#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

#include "y64asm.h"

line_t *line_head = NULL;
line_t *line_tail = NULL;
int lineno = 0;

#define err_print(_s, _a ...) do { \
  if (lineno < 0) \
    fprintf(stderr, "[--]: "_s"\n", ## _a); \
  else \
    fprintf(stderr, "[L%d]: "_s"\n", lineno, ## _a); \
} while (0);


int64_t vmaddr = 0;    /* vm addr */

/* register table */
const reg_t reg_table[REG_NONE] = {
    {"%rax", REG_RAX, 4},
    {"%rcx", REG_RCX, 4},
    {"%rdx", REG_RDX, 4},
    {"%rbx", REG_RBX, 4},
    {"%rsp", REG_RSP, 4},
    {"%rbp", REG_RBP, 4},
    {"%rsi", REG_RSI, 4},
    {"%rdi", REG_RDI, 4},
    {"%r8",  REG_R8,  3},
    {"%r9",  REG_R9,  3},
    {"%r10", REG_R10, 4},
    {"%r11", REG_R11, 4},
    {"%r12", REG_R12, 4},
    {"%r13", REG_R13, 4},
    {"%r14", REG_R14, 4}
};
const reg_t* find_register(char *name)
{
    int i;
    for (i = 0; i < REG_NONE; i++)
        if (!strncmp(name, reg_table[i].name, reg_table[i].namelen))
            return &reg_table[i];
    return NULL;
}


/* instruction set */
instr_t instr_set[] = {
    {"nop", 3,   HPACK(I_NOP, F_NONE), 1 },
    {"halt", 4,  HPACK(I_HALT, F_NONE), 1 },
    {"rrmovq", 6,HPACK(I_RRMOVQ, F_NONE), 2 },
    {"cmovle", 6,HPACK(I_RRMOVQ, C_LE), 2 },
    {"cmovl", 5, HPACK(I_RRMOVQ, C_L), 2 },
    {"cmove", 5, HPACK(I_RRMOVQ, C_E), 2 },
    {"cmovne", 6,HPACK(I_RRMOVQ, C_NE), 2 },
    {"cmovge", 6,HPACK(I_RRMOVQ, C_GE), 2 },
    {"cmovg", 5, HPACK(I_RRMOVQ, C_G), 2 },
    {"irmovq", 6,HPACK(I_IRMOVQ, F_NONE), 10 },
    {"rmmovq", 6,HPACK(I_RMMOVQ, F_NONE), 10 },
    {"mrmovq", 6,HPACK(I_MRMOVQ, F_NONE), 10 },
    {"addq", 4,  HPACK(I_ALU, A_ADD), 2 },
    {"subq", 4,  HPACK(I_ALU, A_SUB), 2 },
    {"andq", 4,  HPACK(I_ALU, A_AND), 2 },
    {"xorq", 4,  HPACK(I_ALU, A_XOR), 2 },
    {"jmp", 3,   HPACK(I_JMP, C_YES), 9 },
    {"jle", 3,   HPACK(I_JMP, C_LE), 9 },
    {"jl", 2,    HPACK(I_JMP, C_L), 9 },
    {"je", 2,    HPACK(I_JMP, C_E), 9 },
    {"jne", 3,   HPACK(I_JMP, C_NE), 9 },
    {"jge", 3,   HPACK(I_JMP, C_GE), 9 },
    {"jg", 2,    HPACK(I_JMP, C_G), 9 },
    {"call", 4,  HPACK(I_CALL, F_NONE), 9 },
    {"ret", 3,   HPACK(I_RET, F_NONE), 1 },
    {"pushq", 5, HPACK(I_PUSHQ, F_NONE), 2 },
    {"popq", 4,  HPACK(I_POPQ, F_NONE),  2 },
    {".byte", 5, HPACK(I_DIRECTIVE, D_DATA), 1 },
    {".word", 5, HPACK(I_DIRECTIVE, D_DATA), 2 },
    {".long", 5, HPACK(I_DIRECTIVE, D_DATA), 4 },
    {".quad", 5, HPACK(I_DIRECTIVE, D_DATA), 8 },
    {".pos", 4,  HPACK(I_DIRECTIVE, D_POS), 0 },
    {".align", 6,HPACK(I_DIRECTIVE, D_ALIGN), 0 },
    {NULL, 1,    0   , 0 } //end
};

instr_t *find_instr(char *name)
{
    int i;
    for (i = 0; instr_set[i].name; i++)
	if (strncmp(instr_set[i].name, name, instr_set[i].len) == 0)
	    return &instr_set[i];
    return NULL;
}

/* symbol table (don't forget to init and finit it) */
symbol_t *symtab = NULL;

/*
 * find_symbol: scan table to find the symbol
 * args
 *     name: the name of symbol
 *
 * return
 *     symbol_t: the 'name' symbol
 *     NULL: not exist
 */
symbol_t *find_symbol(char *name)
{
    symbol_t *p = symtab->next;
    while (p){
        if (strcmp(p->name, name) == 0){
            return p;
        }
        p = p->next;
    }
    return NULL;
}

/*
 * add_symbol: add a new symbol to the symbol table
 * args
 *     name: the name of symbol
 *
 * return
 *     0: success
 *     -1: error, the symbol has exist
 */

int add_symbol(char *name)
{
    /* check duplicate */
    symbol_t *p = symtab->next;
    symbol_t *lastP = symtab;
    while (p){
        if (strncmp(p->name, name, strlen(name)) == 0){
            return -1;
        }
        lastP = p;
        p = p->next;
    }

    /* create new symbol_t (don't forget to free it)*/
    symbol_t *tmp = (symbol_t *)malloc(sizeof(symbol_t));
    memset(tmp, 0, sizeof(symbol_t));
    
    //TODO: check
    tmp->name = (char *)malloc(sizeof(char)*(strlen(name)+1));
    memcpy(tmp->name, name, strlen(name));
    tmp->name[strlen(name)] = '\0';
    tmp->addr = vmaddr;

    /* add the new symbol_t to symbol table */
    lastP->next = tmp;

    return 0;
}

/* relocation table (don't forget to init and finit it) */
reloc_t *reltab = NULL;

/*
 * add_reloc: add a new relocation to the relocation table
 * args
 *     name: the name of symbol
 */

void add_reloc(char *name, bin_t *bin)
{
    /* create new reloc_t (don't forget to free it)*/
    reloc_t *tmp = (reloc_t *)malloc(sizeof(reloc_t));
    memset(tmp, 0, sizeof(reloc_t));
    
    tmp->name = name;
    tmp->y64bin = bin;

    /* add the new reloc_t to relocation table */
    reloc_t *p = reltab;
    while (p->next){
        p = p->next;
    }
    p->next = tmp;
}


/* macro for parsing y64 assembly code */
#define IS_DIGIT(s) ((*(s)>='0' && *(s)<='9') || *(s)=='-' || *(s)=='+')
#define IS_LETTER(s) ((*(s)>='a' && *(s)<='z') || (*(s)>='A' && *(s)<='Z'))
#define IS_COMMENT(s) (*(s)=='#')
#define IS_REG(s) (*(s)=='%')
#define IS_IMM(s) (*(s)=='$')

#define IS_BLANK(s) (*(s)==' ' || *(s)=='\t')
#define IS_END(s) (*(s)=='\0')

#define SKIP_BLANK(s) do {  \
  while(!IS_END(s) && IS_BLANK(s))  \
    (s)++;    \
} while(0);

/* return value from different parse_xxx function */
typedef enum { PARSE_ERR=-1, PARSE_REG, PARSE_DIGIT, PARSE_SYMBOL, 
    PARSE_MEM, PARSE_DELIM, PARSE_INSTR, PARSE_LABEL} parse_t;

/*
 * parse_instr: parse an expected data token (e.g., 'rrmovq')
 * args
 *     ptr: point to the start of string
 *     inst: point to the inst_t within instr_set
 *
 * return
 *     PARSE_INSTR: success, move 'ptr' to the first char after token,
 *                            and store the pointer of the instruction to 'inst'
 *     PARSE_ERR: error, the value of 'ptr' and 'inst' are undefined
 */

parse_t parse_instr(char **ptr, instr_t **inst)
{
    /* skip the blank */
    char *tmpP = *ptr;
    SKIP_BLANK(tmpP);
    if (IS_END(tmpP)){
        return PARSE_ERR;
    }

    /* find_instr and check end */
    instr_t *tmpI = find_instr(tmpP);

    /* set 'ptr' and 'inst' */
    if (tmpI != NULL){
        *inst = tmpI;
        *ptr = tmpP + tmpI->len;
        return PARSE_INSTR;
    }

    return PARSE_ERR;
}

/*
 * parse_delim: parse an expected delimiter token (e.g., ',')
 * args
 *     ptr: point to the start of string
 *
 * return
 *     PARSE_DELIM: success, move 'ptr' to the first char after token
 *     PARSE_ERR: error, the value of 'ptr' and 'delim' are undefined
 */

parse_t parse_delim(char **ptr, char delim)
{
    /* skip the blank and check */
    char *tmpP=*ptr;
    SKIP_BLANK(tmpP);

    if (*tmpP != delim){
        err_print("Invalid \'%c\'", delim);
        return PARSE_ERR;
    }

    /* set 'ptr' */
    ++tmpP;
    *ptr = tmpP;
    return PARSE_DELIM;
}


/*
 * parse_reg: parse an expected register token (e.g., '%rax')
 * args
 *     ptr: point to the start of string
 *     regid: point to the regid of register
 *
 * return
 *     PARSE_REG: success, move 'ptr' to the first char after token, 
 *                         and store the regid to 'regid'
 *     PARSE_ERR: error, the value of 'ptr' and 'regid' are undefined
 */

parse_t parse_reg(char **ptr, regid_t *regid)
{
    /* skip the blank and check */
    char *tmpP = *ptr;

    SKIP_BLANK(tmpP);

    /* find register */
    if (!IS_REG(tmpP)){
        return PARSE_ERR;
    }
    // This function include the char '%'
    const reg_t *tmpR = find_register(tmpP);

    /* set 'ptr' and 'regid' */
    if (tmpR != NULL){
        *regid = tmpR->id;
        *ptr = tmpP + tmpR->namelen;
        return PARSE_REG;
    }

    err_print("Invalid REG");
    return PARSE_ERR;
}

/*
 * parse_symbol: parse an expected symbol token (e.g., 'Main')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *
 * return
 *     PARSE_SYMBOL: success, move 'ptr' to the first char after token,
 *                               and allocate and store name to 'name'
 *     PARSE_ERR: error, the value of 'ptr' and 'name' are undefined
 */

parse_t parse_symbol(char **ptr, char **name)
{
    /* skip the blank and check */
    char *tmpP = *ptr;

    SKIP_BLANK(tmpP);
    if (!IS_LETTER(tmpP))  return PARSE_ERR;

    /* allocate name and copy to it */
    char *tmpP2 = tmpP;
    while (IS_LETTER(tmpP2) || IS_DIGIT(tmpP2))  ++tmpP2;

    /* set 'ptr' and 'name' */
    if (tmpP2 != tmpP){
        *name = (char *)malloc(sizeof(char) * (tmpP2 - tmpP + 1));
        memcpy(*name, tmpP, tmpP2 - tmpP);
        (*name)[tmpP2 - tmpP] = '\0';

        *ptr = tmpP2;
        return PARSE_SYMBOL;
    }

    return PARSE_ERR;
}


/*
 * parse_digit: parse an expected digit token (e.g., '0x100')
 * args
 *     ptr: point to the start of string
 *     value: point to the value of digit
 *
 * return
 *     PARSE_DIGIT: success, move 'ptr' to the first char after token
 *                            and store the value of digit to 'value'
 *     PARSE_ERR: error, the value of 'ptr' and 'value' are undefined
 */

parse_t parse_digit(char **ptr, long *value)
{
    /* skip the blank and check */
    char *tmpP = *ptr;

    SKIP_BLANK(tmpP);

    /* calculate the digit, (NOTE: see strtoll()) */
    long sign = 1;
    if (*tmpP == '-'){
        sign = -1;
        ++tmpP;
    }
    char *tmpP2;
    long res = strtoull(tmpP, &tmpP2, 0) * sign;

    /* set 'ptr' and 'value' */
    if (tmpP2 != tmpP){
        *ptr = tmpP2;
        *value = res;
        return PARSE_DIGIT;
    }

    return PARSE_ERR;
}

/*
 * parse_imm: parse an expected immediate token (e.g., '$0x100' or 'STACK')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *     value: point to the value of digit
 *
 * return
 *     PARSE_DIGIT: success, the immediate token is a digit,
 *                            move 'ptr' to the first char after token,
 *                            and store the value of digit to 'value'
 *     PARSE_SYMBOL: success, the immediate token is a symbol,
 *                            move 'ptr' to the first char after token,
 *                            and allocate and store name to 'name' 
 *     PARSE_ERR: error, the value of 'ptr', 'name' and 'value' are undefined
 */

parse_t parse_imm(char **ptr, char **name, long *value)
{
    /* skip the blank and check */
    parse_t resT = PARSE_ERR;
    char *tmp = *ptr;
    char *tmpN;
    long tmpV;
    SKIP_BLANK(tmp);

    /* if IS_IMM, then parse the digit */
    if (IS_END(tmp)){
        return PARSE_ERR;
    }
    if (IS_IMM(tmp)){
        ++tmp;
        resT = parse_digit(&tmp, &tmpV);
        if (resT == PARSE_ERR){
            err_print("Invalid Immediate");
            return PARSE_ERR;
        }
    }

    /* if IS_LETTER, then parse the symbol */
    if (IS_LETTER(tmp)){
        resT = parse_symbol(&tmp, &tmpN);
        if (resT == PARSE_ERR){
            err_print("Invalid Immediate");
            return PARSE_ERR;
        }
    }
    
    /* set 'ptr' and 'name' or 'value' */
    if (resT != PARSE_ERR){
        *ptr = tmp;
        if (resT == PARSE_DIGIT){
            *value = tmpV;
        }
        else {
            *name = tmpN;
        }
    }
    
    return resT;
}

/*
 * parse_mem: parse an expected memory token (e.g., '8(%rbp)')
 * args
 *     ptr: point to the start of string
 *     value: point to the value of digit
 *     regid: point to the regid of register
 *
 * return
 *     PARSE_MEM: success, move 'ptr' to the first char after token,
 *                          and store the value of digit to 'value',
 *                          and store the regid to 'regid'
 *     PARSE_ERR: error, the value of 'ptr', 'value' and 'regid' are undefined
 */

parse_t parse_mem(char **ptr, long *value, regid_t *regid)
{
    /* skip the blank and check */
    char *tmpP = *ptr;

    SKIP_BLANK(tmpP);

    /* calculate the digit and register, (ex: (%rbp) or 8(%rbp)) */
    long tmpv;
    if (parse_digit(&tmpP, &tmpv) == PARSE_ERR){
        tmpv = 0;
    }

    if (*tmpP != '('){
        err_print("Invalid MEM");
        return PARSE_ERR;
    }
    ++tmpP;

    regid_t tmpr;
    if (parse_reg(&tmpP, &tmpr) == PARSE_ERR){
        err_print("Invalid MEM");
        return PARSE_ERR;
    }

    if (*tmpP != ')'){
        err_print("Invalid MEM");
        return PARSE_ERR;
    }
    ++tmpP;

    /* set 'ptr', 'value' and 'regid' */
    *ptr = tmpP;
    *value = tmpv;
    *regid = tmpr;
    return PARSE_MEM;
}


/*
 * parse_data: parse an expected data token (e.g., '0x100' or 'array')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *     value: point to the value of digit
 *
 * return
 *     PARSE_DIGIT: success, data token is a digit,
 *                            and move 'ptr' to the first char after token,
 *                            and store the value of digit to 'value'
 *     PARSE_SYMBOL: success, data token is a symbol,
 *                            and move 'ptr' to the first char after token,
 *                            and allocate and store name to 'name' 
 *     PARSE_ERR: error, the value of 'ptr', 'name' and 'value' are undefined
 */

parse_t parse_data(char **ptr, char **name, long *value)
{
    /* skip the blank and check */
    char *tmpP = *ptr;
    parse_t resT = TYPE_ERR;
    long tmpV;
    char *tmpN;

    SKIP_BLANK(tmpP)

    /* if IS_DIGIT, then parse the digit */
    if (IS_DIGIT(tmpP)){
        resT = parse_digit(&tmpP, &tmpV);
    }

    /* if IS_LETTER, then parse the symbol */
    if (IS_LETTER(tmpP)){
        resT = parse_symbol(&tmpP, &tmpN);
    }

    /* set 'ptr', 'name' and 'value' */
    if (resT == PARSE_DIGIT){
        *ptr = tmpP;
        *value = tmpV;
    }
    if (resT == PARSE_SYMBOL){
        *ptr = tmpP;
        *name = tmpN;
    }

    return resT;
}

/*
 * parse_label: parse an expected label token (e.g., 'Loop:')
 * args
 *     ptr: point to the start of string
 *     name: point to the name of symbol (should be allocated in this function)
 *
 * return
 *     PARSE_LABEL: success, move 'ptr' to the first char after token
 *                            and allocate and store name to 'name'
 *     PARSE_ERR: error, the value of 'ptr' is undefined
 */

parse_t parse_label(char **ptr, char **name)
{
    /* skip the blank and check */
    char *tmpP = *ptr;
    parse_t tmpT;
    char *tmpN;

    SKIP_BLANK(tmpP);

    /* allocate name and copy to it */
    tmpT = parse_symbol(&tmpP, &tmpN);
    if (tmpT == PARSE_ERR || *tmpP != ':'){
        return PARSE_ERR;
    }
    ++tmpP;

    /* set 'ptr' and 'name' */
    *ptr = tmpP;
    *name = tmpN;
    return PARSE_LABEL;
}

/*
 * parse_line: parse a line of y64 code (e.g., 'Loop: mrmovq (%rcx), %rsi')
 * (you could combine above parse_xxx functions to do it)
 * args
 *     line: point to a line_t data with a line of y64 assembly code
 *
 * return
 *     PARSE_XXX: success, fill line_t with assembled y64 code
 *     PARSE_ERR: error, try to print err information (e.g., instr type and line number)
 */

//TODOI

type_t parse_line(line_t *line)
{

/* when finish parse an instruction or lable, we still need to continue check 
* e.g., 
*  Loop: mrmovl (%rbp), %rcx
*           call SUM  #invoke SUM function */

    /* skip blank and check IS_END */
    char *tmpP = line->y64asm;
    char *tmpN = NULL;
    instr_t *tmpI;

    SKIP_BLANK(tmpP);
    if (IS_END(tmpP)){
        line->type = TYPE_COMM;
        return TYPE_COMM;
    }
    
    /* is a comment ? */
   if (IS_COMMENT(tmpP)){
        line->type = TYPE_COMM;
        return TYPE_COMM;
    }

    /* is a label ? */
    if (parse_label(&tmpP, &tmpN) == PARSE_LABEL){
        if (add_symbol(tmpN)){
            err_print("Dup symbol:%s", tmpN);
            line->type = TYPE_ERR;
            return TYPE_ERR;
        }

        SKIP_BLANK(tmpP);
        if (IS_END(tmpP) || IS_COMMENT(tmpP)){
            line->y64bin.addr = vmaddr;
            line->y64bin.bytes = 0;
            line->type = TYPE_INS;
            return TYPE_INS;
        }
    }

    /* is an instruction ? */
    if (parse_instr(&tmpP, &tmpI) == PARSE_ERR){
        line->type = TYPE_ERR;
        return TYPE_ERR;
    }
    else {
        line->type = TYPE_INS;
    }

    /* set type and y64bin */
    
    if (line->type == TYPE_INS){
        line->y64bin.addr = vmaddr;
        line->y64bin.bytes = tmpI->bytes;
        line->y64bin.codes[0] = tmpI->code;

        /* update vmaddr */ 
        

        /* parse the rest of instruction according to the itype */
        parse_t tmpRES;
        regid_t rA, rB;
        long tmpV;
        char *tmpN;

        switch (HIGH(tmpI->code)) {
        
        case I_HALT:
            break;

        case I_NOP:
            break;

        case I_RET:
            break;

        case I_RRMOVQ: case I_ALU:
            if (parse_reg(&tmpP, &rA) == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            if (parse_delim(&tmpP, ',') == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            if (parse_reg(&tmpP, &rB) == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            line->y64bin.codes[1] = HPACK(rA, rB);
            break;

        case I_IRMOVQ:
            tmpRES = parse_imm(&tmpP, &tmpN, &tmpV);
            if (tmpRES == PARSE_SYMBOL){
                add_reloc(tmpN, &line->y64bin);
            }
            else if (tmpRES == PARSE_DIGIT){
                memcpy(line->y64bin.codes + 2, (void *)&tmpV, sizeof(long));
            }
            else{
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            
            if (parse_delim(&tmpP, ',') == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            if (parse_reg(&tmpP, &rB) == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }

            line->y64bin.codes[1] = HPACK(REG_NONE, rB);
            break;

        case I_RMMOVQ:
            if (parse_reg(&tmpP, &rA) == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            if (parse_delim(&tmpP, ',') == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            if (parse_mem(&tmpP, &tmpV, &rB) == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            line->y64bin.codes[1] = HPACK(rA, rB);
            memcpy(line->y64bin.codes + 2, (void *)&tmpV, sizeof(long));
            break;

        case I_MRMOVQ:
            if (parse_mem(&tmpP, &tmpV, &rB) == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            if (parse_delim(&tmpP, ',') == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            if (parse_reg(&tmpP, &rA) == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            line->y64bin.codes[1] = HPACK(rA, rB);
            memcpy(line->y64bin.codes + 2, (void *)&tmpV, sizeof(long));
            break;

        case I_JMP: case I_CALL:
            if (parse_symbol(&tmpP, &tmpN) == PARSE_ERR){
                err_print("Invalid DEST");
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            add_reloc(tmpN, &line->y64bin);
            break;

        case I_PUSHQ: case I_POPQ:
            if (parse_reg(&tmpP, &rA) == PARSE_ERR){
                line->type = TYPE_ERR;
                return TYPE_ERR;
            }
            line->y64bin.codes[1] = HPACK(rA, REG_NONE);
            break;

        default:
            if (strncmp(tmpI->name, ".align", tmpI->len) == 0){
                if (parse_digit(&tmpP, &tmpV) == PARSE_ERR){
                    line->type = TYPE_ERR;
                    return TYPE_ERR;
                }
                if (vmaddr % tmpV){
                    vmaddr = (vmaddr / tmpV + 1) * tmpV;
                }
                line->y64bin.addr = vmaddr;
            }
            else if (strncmp(tmpI->name, ".pos", tmpI->len) == 0){
                if (parse_digit(&tmpP, &tmpV) == PARSE_ERR){
                    line->type = TYPE_ERR;
                    return TYPE_ERR;
                }
                line->y64bin.addr = vmaddr = tmpV;
            }
            else {
                tmpRES = parse_data(&tmpP, &tmpN, &tmpV);
                if (tmpRES == PARSE_DIGIT){
                    memcpy(line->y64bin.codes, (void *)&tmpV, sizeof(long));
                }
                else if (tmpRES == PARSE_SYMBOL){
                    add_reloc(tmpN, &line->y64bin);
                }
                else {
                    line->type = TYPE_ERR;
                    return TYPE_ERR;
                }
            }
        }
    }

    SKIP_BLANK(tmpP);
    if (!(IS_END(tmpP) || IS_COMMENT(tmpP))){
        line->type = TYPE_ERR;
        return TYPE_ERR;
    }

    vmaddr += tmpI->bytes;

    return line->type;
}

// type_t parse_line(line_t *line)
// {
//     char *curChar = line->y64asm;
//     char *name = NULL;
//     long value = 0;
//     regid_t regA = REG_NONE, regB= REG_NONE;
//     instr_t *inst;
//     bin_t bin;
// /* when finish parse an instruction or lable, we still need to continue check 
// * e.g., 
// *  Loop: mrmovl (%rbp), %rcx
// *           call SUM  #invoke SUM function */

//     /* skip blank and check IS_END */
//     /* is a comment ? */
//     SKIP_BLANK(curChar);
//     if(IS_END(curChar) || IS_COMMENT(curChar)) {
//         line->type = TYPE_COMM;
//         return line->type;
//     }
//     if(!IS_LETTER(curChar) && *curChar != '.') return line->type;
//     /* is a label ? */
//     /* is an instruction ? */
//     /* set type and y64bin */
//     /* update vmaddr */   
//     char *oldChar = curChar;
//     if(parse_instr(&curChar, &inst) == PARSE_ERR) {
//         curChar = oldChar;
//         if(parse_label(&curChar, &name) == PARSE_ERR) {
//             line->type = TYPE_ERR;
//             return line->type;
//         }
//         if(add_symbol(name) < 0) {
//             err_print("Dup symbol:%s", name);
//             line->type = TYPE_ERR;
//             return line->type;
//         }
//         SKIP_BLANK(curChar);
//         if(IS_END(curChar) || IS_COMMENT(curChar)) {
//             line->y64bin.bytes = 0;
//             line->y64bin.addr = vmaddr;
//             line->type = TYPE_INS;
//             return line->type;
//         }
//         if(parse_instr(&curChar, &inst) == PARSE_ERR) {
//             line->type = TYPE_ERR;
//             return line->type;
//         }
//     }
//     /* parse the rest of instruction according to the itype */
//     itype_t icode = HIGH(inst->code);
//     itype_t ifun = LOW(inst->code);
//     parse_t res;
//     switch(icode) {
//     case I_HALT: case I_NOP: case I_RET:
//         break;
//     case I_RRMOVQ: case I_ALU:
//         if(parse_reg(&curChar, &regA) == PARSE_ERR || parse_delim(&curChar, ',') == PARSE_ERR || parse_reg(&curChar, &regB)) {
//             line->type = TYPE_ERR;
//             return line->type;
//         }
//         bin.codes[1] = HPACK(regA, regB);
//         break;
//     case I_IRMOVQ:
//         res = parse_imm(&curChar, &name, &value);
//         if(res == PARSE_ERR || parse_delim(&curChar, ',') == PARSE_ERR || parse_reg(&curChar, &regB) == PARSE_ERR) {
//             line->type = TYPE_ERR;
//             return line->type;
//         }
//         bin.codes[1] = HPACK(REG_NONE, regB);
//         if(res == PARSE_DIGIT) {
//             for(int i = 0;i < 8;++ i) {
//                 bin.codes[i + 2] = ((value >> (8 * i)) & 0xff);
//             }
//         } else if(res == PARSE_SYMBOL) {
//             add_reloc(name, &line->y64bin);
//         }
//         break;
//     case I_RMMOVQ:
//         if(parse_reg(&curChar, &regA) == PARSE_ERR || parse_delim(&curChar, ',') == PARSE_ERR || parse_mem(&curChar, &value, &regB) == PARSE_ERR) {
//             line->type = TYPE_ERR;
//             return line->type;
//         }
//         bin.codes[1] = HPACK(regA, regB);
//         for(int i = 0;i < 8;++ i) {
//             bin.codes[i + 2] = ((value >> (8 * i)) & 0xff);
//         }
//         break;
//     case I_MRMOVQ:
//         if(parse_mem(&curChar, &value, &regB) == PARSE_ERR || parse_delim(&curChar, ',') == PARSE_ERR || parse_reg(&curChar, &regA) == PARSE_ERR) {
//             line->type = TYPE_ERR;
//             return line->type;
//         }
//         bin.codes[1] = HPACK(regA, regB);
//         for(int i = 0;i < 8;++ i) {
//             bin.codes[i + 2] = ((value >> (8 * i)) & 0xff);
//         }
//         break;
//     case I_JMP: case I_CALL:
//         if(parse_symbol(&curChar, &name) == PARSE_ERR) {
//             err_print("Invalid DEST");
//             line->type = TYPE_ERR;
//             return line->type;
//         }
//         add_reloc(name, &(line->y64bin));
//         break;
//     case I_POPQ: case I_PUSHQ:
//         if(parse_reg(&curChar, &regA) == PARSE_ERR) {
//             line->type = TYPE_ERR;
//             return line->type;
//         }
//         bin.codes[1] = HPACK(regA, REG_NONE);
//         break;
//     case I_DIRECTIVE: {
//         int bytes = 0;
//         switch(ifun) {
//         case D_POS:
//             if(parse_digit(&curChar, &value) == PARSE_ERR) {
//                 line->type = TYPE_ERR;
//                 return line->type;
//             }
//             line->y64bin.bytes = 0;
//             line->y64bin.addr = vmaddr;
//             line->type = TYPE_INS;
//             vmaddr = value;
//             break;
//         case D_DATA:
//             bytes = inst->bytes;
//             res = parse_data(&curChar, &name, &value);
//             if(res == PARSE_DIGIT) {
//                 for(int i = 0;i < bytes;++ i) {
//                     line->y64bin.codes[i] = ((value >> (8 * i)) & 0xff);
//                 }
//             } else if(res == PARSE_SYMBOL) {
//                 add_reloc(name, &(line->y64bin));
//             } else if(res == PARSE_ERR) {
//                 line->type = TYPE_ERR;
//                 return line->type;
//             }
//             line->y64bin.bytes = bytes;
// 			line->y64bin.addr = vmaddr;
// 			line->type = TYPE_INS;
// 			vmaddr += bytes;
// 			break;
//         case D_ALIGN:
//             if(parse_digit(&curChar, &value) == PARSE_ERR) {
//                 line->type = TYPE_ERR;
//                 return line->type;
//             }
// 			line->y64bin.bytes = 0;
// 			line->y64bin.addr = vmaddr;
// 			line->type = TYPE_INS;
//             vmaddr = (vmaddr + value - 1) / value * value;
// 			break;
//         default:
//             break;
//         }
//     }
//     default:
//         break;
//     }
//     if(icode != I_DIRECTIVE) {
//         bin.addr = vmaddr;
// 		bin.bytes = inst->bytes;
// 		bin.codes[0] = inst->code;
// 		line->y64bin = bin;
// 		line->type = TYPE_INS;
// 		vmaddr += inst->bytes;
//     }
//     return line->type;
// }

/*
 * assemble: assemble an y64 file (e.g., 'asum.ys')
 * args
 *     in: point to input file (an y64 assembly file)
 *
 * return
 *     0: success, assmble the y64 file to a list of line_t
 *     -1: error, try to print err information (e.g., instr type and line number)
 */
int assemble(FILE *in)
{
    static char asm_buf[MAX_INSLEN]; /* the current line of asm code */
    line_t *line;
    int slen;
    char *y64asm;

    /* read y64 code line-by-line, and parse them to generate raw y64 binary code list */
    while (fgets(asm_buf, MAX_INSLEN, in) != NULL) {
        slen  = strlen(asm_buf);
        while ((asm_buf[slen-1] == '\n') || (asm_buf[slen-1] == '\r')) { 
            asm_buf[--slen] = '\0'; /* replace terminator */
        }

        /* store y64 assembly code */
        y64asm = (char *)malloc(sizeof(char) * (slen + 1)); // free in finit
        strcpy(y64asm, asm_buf);

        line = (line_t *)malloc(sizeof(line_t)); // free in finit
        memset(line, '\0', sizeof(line_t));

        line->type = TYPE_COMM;
        line->y64asm = y64asm;
        line->next = NULL;

        line_tail->next = line;
        line_tail = line;
        lineno ++;

        if (parse_line(line) == TYPE_ERR) {
            return -1;
        }
    }

	lineno = -1;
    return 0;
}

/*
 * relocate: relocate the raw y64 binary code with symbol address
 *
 * return
 *     0: success
 *     -1: error, try to print err information (e.g., addr and symbol)
 */

int relocate(void)
{
    reloc_t *rtmp = NULL;
    
    rtmp = reltab->next;
    while (rtmp) {
        /* find symbol */
        symbol_t *tmpS = find_symbol(rtmp->name);

        /* relocate y64bin according itype */
        if (tmpS == NULL){
            err_print("Unknown symbol:\'%s\'", rtmp->name);
            return -1;
        }
        memcpy(rtmp->y64bin->codes + (rtmp->y64bin->bytes - 8), (void *)&tmpS->addr, sizeof(int64_t));

        /* next */
        rtmp = rtmp->next;
    }
    return 0;
}

/*
 * binfile: generate the y64 binary file
 * args
 *     out: point to output file (an y64 binary file)
 *
 * return
 *     0: success
 *     -1: error
 */

int binfile(FILE *out)
{
    /* prepare image with y64 binary code */
    line_t *tmpL = line_head->next;

    /* binary write y64 code to output file (NOTE: see fwrite()) */
    while (tmpL){
        if (tmpL->type == TYPE_INS && tmpL->y64bin.bytes){
            if(fseek(out, tmpL->y64bin.addr, SEEK_SET) != 0){
                return -1;
            }
            if(fwrite(tmpL->y64bin.codes, tmpL->y64bin.bytes, 1, out) == 0){
                return -1;
            }
        }
        
        tmpL = tmpL->next;
    }
    
    return 0;
}


/* whether print the readable output to screen or not ? */
bool_t screen = FALSE; 

static void hexstuff(char *dest, int value, int len)
{
    int i;
    for (i = 0; i < len; i++) {
        char c;
        int h = (value >> 4*i) & 0xF;
        c = h < 10 ? h + '0' : h - 10 + 'a';
        dest[len-i-1] = c;
    }
}

void print_line(line_t *line)
{
    char buf[64];

    /* line format: 0xHHH: cccccccccccc | <line> */
    if (line->type == TYPE_INS) {
        bin_t *y64bin = &line->y64bin;
        int i;
        
        strcpy(buf, "  0x000:                      | ");
        
        hexstuff(buf+4, y64bin->addr, 3);
        if (y64bin->bytes > 0)
            for (i = 0; i < y64bin->bytes; i++)
                hexstuff(buf+9+2*i, y64bin->codes[i]&0xFF, 2);
    } else {
        strcpy(buf, "                              | ");
    }

    printf("%s%s\n", buf, line->y64asm);
}

/* 
 * print_screen: dump readable binary and assembly code to screen
 * (e.g., Figure 4.8 in ICS book)
 */
void print_screen(void)
{
    line_t *tmp = line_head->next;
    while (tmp != NULL) {
        print_line(tmp);
        tmp = tmp->next;
    }
}

/* init and finit */
void init(void)
{
    reltab = (reloc_t *)malloc(sizeof(reloc_t)); // free in finit
    memset(reltab, 0, sizeof(reloc_t));

    symtab = (symbol_t *)malloc(sizeof(symbol_t)); // free in finit
    memset(symtab, 0, sizeof(symbol_t));

    line_head = (line_t *)malloc(sizeof(line_t)); // free in finit
    memset(line_head, 0, sizeof(line_t));
    line_tail = line_head;
    lineno = 0;
}

void finit(void)
{
    reloc_t *rtmp = NULL;
    do {
        rtmp = reltab->next;
        if (reltab->name) 
            free(reltab->name);
        free(reltab);
        reltab = rtmp;
    } while (reltab);
    
    symbol_t *stmp = NULL;
    do {
        stmp = symtab->next;
        if (symtab->name) 
            free(symtab->name);
        free(symtab);
        symtab = stmp;
    } while (symtab);

    line_t *ltmp = NULL;
    do {
        ltmp = line_head->next;
        if (line_head->y64asm) 
            free(line_head->y64asm);
        free(line_head);
        line_head = ltmp;
    } while (line_head);
}

static void usage(char *pname)
{
    printf("Usage: %s [-v] file.ys\n", pname);
    printf("   -v print the readable output to screen\n");
    exit(0);
}

int main(int argc, char *argv[])
{
    int rootlen;
    char infname[512];
    char outfname[512];
    int nextarg = 1;
    FILE *in = NULL, *out = NULL;
    
    if (argc < 2)
        usage(argv[0]);
    
    if (argv[nextarg][0] == '-') {
        char flag = argv[nextarg][1];
        switch (flag) {
          case 'v':
            screen = TRUE;
            nextarg++;
            break;
          default:
            usage(argv[0]);
        }
    }

    /* parse input file name */
    rootlen = strlen(argv[nextarg])-3;
    /* only support the .ys file */
    if (strcmp(argv[nextarg]+rootlen, ".ys"))
        usage(argv[0]);
    
    if (rootlen > 500) {
        err_print("File name too long");
        exit(1);
    }
 

    /* init */
    init();

    
    /* assemble .ys file */
    strncpy(infname, argv[nextarg], rootlen);
    strcpy(infname+rootlen, ".ys");
    in = fopen(infname, "r");
    if (!in) {
        err_print("Can't open input file '%s'", infname);
        exit(1);
    }
    
    if (assemble(in) < 0) {
        err_print("Assemble y64 code error");
        fclose(in);
        exit(1);
    }
    fclose(in);


    /* relocate binary code */
    if (relocate() < 0) {
        err_print("Relocate binary code error");
        exit(1);
    }


    /* generate .bin file */
    strncpy(outfname, argv[nextarg], rootlen);
    strcpy(outfname+rootlen, ".bin");
    out = fopen(outfname, "wb");
    if (!out) {
        err_print("Can't open output file '%s'", outfname);
        exit(1);
    }

    if (binfile(out) < 0) {
        err_print("Generate binary file error");
        fclose(out);
        exit(1);
    }
    fclose(out);
    
    /* print to screen (.yo file) */
    if (screen)
       print_screen(); 

    /* finit */
    finit();
    return 0;
}


