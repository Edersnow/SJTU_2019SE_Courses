#include "inode_manager.h"

// disk layer -----------------------------------------

disk::disk()
{
  bzero(blocks, sizeof(blocks));
}

void
disk::read_block(blockid_t id, char *buf)
{
  if (buf == nullptr || id >= BLOCK_NUM) {
    printf("\td: error! block id out of bound.\n");
    assert(false);
  }
  memcpy(buf, blocks[id], BLOCK_SIZE);
}

void
disk::write_block(blockid_t id, const char *buf)
{
  if (buf == nullptr || id >= BLOCK_NUM) {
    printf("\td: error! block id out of bound.\n");
    assert(false);
  }
  memcpy(blocks[id], buf, BLOCK_SIZE);
}

// block layer -----------------------------------------

// Allocate a free disk block.
blockid_t
block_manager::alloc_block()
{
  /*
   * your code goes here.
   * note: you should mark the corresponding bit in block bitmap when alloc.
   * you need to think about which block you can start to be allocated.
   */
  const static int start_index = IBLOCK(INODE_NUM, sb.nblocks) + 1;
  for (int i = start_index; i < BLOCK_NUM; ++i) {
    if (!using_blocks.count(i) || using_blocks[i] == 0) {
      using_blocks[i] = 1;
      return i;
    }
  }

  return 0;
}

void
block_manager::free_block(uint32_t id)
{
  /* 
   * your code goes here.
   * note: you should unmark the corresponding bit in the block bitmap when free.
   */
  if (!using_blocks.count(id) || using_blocks[id] == 0) {
    printf("\tbm: warning! free a block which has been freed.\n");
  }
  using_blocks[id] = 0;
  
  return;
}

// The layout of disk should be like this:
// |<-sb->|<-free block bitmap->|<-inode table->|<-data->|
block_manager::block_manager()
{
  d = new disk();

  // format the disk
  sb.size = BLOCK_SIZE * BLOCK_NUM;
  sb.nblocks = BLOCK_NUM;
  sb.ninodes = INODE_NUM;

}

void
block_manager::read_block(uint32_t id, char *buf)
{
  d->read_block(id, buf);
}

void
block_manager::write_block(uint32_t id, const char *buf)
{
  d->write_block(id, buf);
}

// inode layer -----------------------------------------

inode_manager::inode_manager()
{
  bm = new block_manager();
  uint32_t root_dir = alloc_inode(extent_protocol::T_DIR);
  if (root_dir != 1) {
    printf("\tim: error! alloc first inode %d, should be 1\n", root_dir);
    exit(0);
  }
}

/* Create a new file.
 * Return its inum. */
uint32_t
inode_manager::alloc_inode(uint32_t type)
{
  /* 
   * your code goes here.
   * note: the normal inode block should begin from the 2nd inode block.
   * the 1st is used for root_dir, see inode_manager::inode_manager().
   */
  for (int id = 1; id <= INODE_NUM; ++id) {
    inode_t *inode = get_inode(id);
    if (inode == nullptr) {
      inode = (inode_t *)malloc(sizeof(inode_t));
      inode->type = type;
      inode->size = 0;
      time_t current_time = time(nullptr);
      inode->atime = inode->mtime = inode->ctime = current_time;
      put_inode(id, inode);
      free(inode);
      return id;
    }
    else {
      free(inode);
    }
  }

  assert(false);
  return 0;
}

void
inode_manager::free_inode(uint32_t inum)
{
  /* 
   * your code goes here.
   * note: you need to check if the inode is already a freed one;
   * if not, clear it, and remember to write back to disk.
   */
  inode_t *inode = get_inode(inum);
  if (inode == nullptr) {
    printf("\tim: warning! free a inode which has already been freed.\n");
  }
  else {
    inode->type = 0;
    put_inode(inum, inode);
    free(inode);
  }

  return;
}


/* Return an inode structure by inum, NULL otherwise.
 * Caller should release the memory. */
struct inode* 
inode_manager::get_inode(uint32_t inum)
{
  struct inode *ino, *ino_disk;
  char buf[BLOCK_SIZE];

  printf("\tim: get_inode %d\n", inum);

  if (inum < 0 || inum >= INODE_NUM) {
    printf("\tim: inum out of range\n");
    return NULL;
  }

  bm->read_block(IBLOCK(inum, bm->sb.nblocks), buf);
  // printf("%s:%d\n", __FILE__, __LINE__);

  ino_disk = (struct inode*)buf + inum%IPB;
  if (ino_disk->type == 0) {
    printf("\tim: inode not exist\n");
    return NULL;
  }

  ino = (struct inode*)malloc(sizeof(struct inode));
  *ino = *ino_disk;

  return ino;
}

void
inode_manager::put_inode(uint32_t inum, struct inode *ino)
{
  char buf[BLOCK_SIZE];
  struct inode *ino_disk;

  printf("\tim: put_inode %d\n", inum);
  if (ino == NULL)
    return;

  bm->read_block(IBLOCK(inum, bm->sb.nblocks), buf);
  ino_disk = (struct inode*)buf + inum%IPB;
  *ino_disk = *ino;
  bm->write_block(IBLOCK(inum, bm->sb.nblocks), buf);
}

#define MIN(a,b) ((a)<(b) ? (a) : (b))

/* Get all the data of a file by inum. 
 * Return alloced data, should be freed by caller. */
void
inode_manager::read_file(uint32_t inum, char **buf_out, int *size)
{
  /*
   * your code goes here.
   * note: read blocks related to inode number inum,
   * and copy them to buf_out
   */
  char tmp_buf[BLOCK_SIZE];

  inode_t *inode = get_inode(inum);
  if (inode != nullptr) {
    if (size == nullptr) {
      size = (int *)malloc(sizeof(int));
    }
    *size = inode->size;

    if (buf_out == nullptr) {
      buf_out = (char **)malloc(sizeof(char *));
    }
    *buf_out = (char *)malloc(*size);

    // part 1: get all block id
    unsigned int block_num = ((*size) + BLOCK_SIZE - 1) / BLOCK_SIZE;
    uint32_t *block_ids = (uint32_t *)malloc(block_num * sizeof(uint32_t));

    unsigned int c = MIN(block_num, NDIRECT);
    memcpy(block_ids, inode->blocks, c * sizeof(uint32_t));

    if (block_num > NDIRECT) {
      bm->read_block(inode->blocks[NDIRECT], tmp_buf);
      memcpy(block_ids + NDIRECT, tmp_buf, (block_num - NDIRECT) * sizeof(uint32_t));
    }
    // part 1: end

    // part 2: read from blocks
    for (unsigned int i = 0; i + 1 < block_num; ++i) {
      bm->read_block(block_ids[i], tmp_buf);
      memcpy(*buf_out + i * BLOCK_SIZE, tmp_buf, BLOCK_SIZE);
    }
    if (block_num != 0) {
      bm->read_block(block_ids[block_num - 1], tmp_buf);
      memcpy(*buf_out + (block_num - 1) * BLOCK_SIZE, tmp_buf, (*size) - (block_num - 1) * BLOCK_SIZE);
    }
    free(block_ids);
    // part 2: end

    inode->atime = time(nullptr);
    put_inode(inum, inode);
    free(inode);
  }
  else {
    printf("\tim: warning! reading from an inode which has already been freed.");
  }
  
  return;
}

/* alloc/free blocks if needed */
void
inode_manager::write_file(uint32_t inum, const char *buf, int size)
{
  /*
   * your code goes here.
   * note: write buf to blocks of inode inum.
   * you need to consider the situation when the size of buf 
   * is larger or smaller than the size of original inode
   */
  char tmp_buf[BLOCK_SIZE];

  if (size < 0 || (unsigned long) size > MAXFILE * BLOCK_SIZE) {
    printf("\tim: error! file size is too large.");
    return;
  }

  inode_t *inode = get_inode(inum);
  if (inode != nullptr) {
    // part 1: rearrange blocks
    unsigned int block_num_old = (inode->size + BLOCK_SIZE - 1) / BLOCK_SIZE;
    unsigned int block_num_new = (size + BLOCK_SIZE - 1) / BLOCK_SIZE;
    uint32_t *block_ids_old = (uint32_t *)malloc(block_num_old * sizeof(uint32_t));
    uint32_t *block_ids = (uint32_t *)malloc(block_num_new * sizeof(uint32_t));

    unsigned int c = MIN(block_num_old, NDIRECT);
    memcpy(block_ids_old, inode->blocks, c * sizeof(uint32_t));

    if (block_num_old > NDIRECT) {
      bm->read_block(inode->blocks[NDIRECT], tmp_buf);
      memcpy(block_ids_old + NDIRECT, tmp_buf, (block_num_old - NDIRECT) * sizeof(uint32_t));
    }

    // case 1
    if (block_num_new <= block_num_old) {
      // handle block_ids
      memcpy(block_ids, block_ids_old, block_num_new * sizeof(uint32_t));
      for (unsigned int i = block_num_new; i < block_num_old; ++i) {
        bm->free_block(block_ids_old[i]);
      }

      // handle NDIRECT
      if (block_num_new <= NDIRECT && block_num_old > NDIRECT) {
        bm->free_block(inode->blocks[NDIRECT]);
      }
    }
    // case 2
    else {
      memcpy(block_ids, block_ids_old, block_num_old * sizeof(uint32_t));
      c = MIN(block_num_new, NDIRECT);
      for (unsigned int i = block_num_old; i < c; ++i) {
        inode->blocks[i] = block_ids[i] = bm->alloc_block();
      }
      for (unsigned int i = NDIRECT; i < block_num_new; ++i) {
        block_ids[i] = bm->alloc_block();
      }

      if (block_num_new > NDIRECT) {
        if (block_num_old <= NDIRECT) {
          inode->blocks[NDIRECT] = bm->alloc_block();
        }
        memcpy(tmp_buf, block_ids + NDIRECT, (block_num_new - NDIRECT) * sizeof(uint32_t));
        bm->write_block(inode->blocks[NDIRECT], tmp_buf);
      }
    }
    free(block_ids_old);
    // part 1: end

    // part 2: write
    for (unsigned int i = 0; i + 1 < block_num_new; ++i) {
      memcpy(tmp_buf, buf + i * BLOCK_SIZE, BLOCK_SIZE);
      bm->write_block(block_ids[i], tmp_buf);
    }
    if (block_num_new != 0) {
      memcpy(tmp_buf, buf + (block_num_new - 1) * BLOCK_SIZE, size - (block_num_new - 1) * BLOCK_SIZE);
      bm->write_block(block_ids[block_num_new - 1], tmp_buf);
    }
    free(block_ids);
    // part 2: end

    inode->size = size;
    time_t current_time = time(nullptr);
    inode->atime = inode->mtime = inode->ctime = current_time;
    put_inode(inum, inode);
    free(inode);
  }
  else {
    printf("\tim: error! write to an inode which has already been freed.");
  }
  
  return;
}

void
inode_manager::getattr(uint32_t inum, extent_protocol::attr &a)
{
  /*
   * your code goes here.
   * note: get the attributes of inode inum.
   * you can refer to "struct attr" in extent_protocol.h
   */
  inode_t *inode = get_inode(inum);
  if (inode == nullptr) {
    printf("\tim: warning! get attr of an inode which has already been freed.");
  }
  else {
    a.type = inode->type;
    a.atime = inode->atime;
    a.mtime = inode->mtime;
    a.ctime = inode->ctime;
    a.size = inode->size;
    free(inode);
  }
  
  return;
}

void
inode_manager::remove_file(uint32_t inum)
{
  /*
   * your code goes here
   * note: you need to consider about both the data block and inode of the file
   */
  inode_t *inode = get_inode(inum);
  if (inode == nullptr) {
    printf("\tim: warning! remove an inode which has already been freed.");
  }
  else {
    // part 1: get all block id
    unsigned int block_num = (inode->size + BLOCK_SIZE - 1) / BLOCK_SIZE;
    unsigned int extra_num = block_num > NDIRECT ? 1 : 0;
    uint32_t *block_ids = (uint32_t *)malloc((block_num + extra_num) * sizeof(uint32_t));

    unsigned int c = MIN(block_num, NDIRECT);
    unsigned int i = 0;
    while (i < c) {
      block_ids[i] = inode->blocks[i];
      ++i;
    }

    if (extra_num) {
      char tmp_buf[BLOCK_SIZE];
      bm->read_block(inode->blocks[NDIRECT], tmp_buf);
      memcpy(block_ids + NDIRECT, tmp_buf, (block_num - NDIRECT) * sizeof(uint32_t));
      block_ids[block_num] = inode->blocks[NDIRECT];
    }
    // part 1: end

    // part 2: free blocks
    for (unsigned int i = 0; i < block_num + extra_num; ++i) {
      bm->free_block(block_ids[i]);
    }
    free(block_ids);
    // part 2: end

    free_inode(inum);
    free(inode);
  }
  
  return;
}
