
ctarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400bb0 <_init>:
  400bb0:	48 83 ec 08          	sub    $0x8,%rsp
  400bb4:	48 8b 05 3d 34 20 00 	mov    0x20343d(%rip),%rax        # 603ff8 <__gmon_start__>
  400bbb:	48 85 c0             	test   %rax,%rax
  400bbe:	74 02                	je     400bc2 <_init+0x12>
  400bc0:	ff d0                	callq  *%rax
  400bc2:	48 83 c4 08          	add    $0x8,%rsp
  400bc6:	c3                   	retq   

Disassembly of section .plt:

0000000000400bd0 <.plt>:
  400bd0:	ff 35 32 34 20 00    	pushq  0x203432(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400bd6:	ff 25 34 34 20 00    	jmpq   *0x203434(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400bdc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400be0 <strcasecmp@plt>:
  400be0:	ff 25 32 34 20 00    	jmpq   *0x203432(%rip)        # 604018 <strcasecmp@GLIBC_2.2.5>
  400be6:	68 00 00 00 00       	pushq  $0x0
  400beb:	e9 e0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400bf0 <__errno_location@plt>:
  400bf0:	ff 25 2a 34 20 00    	jmpq   *0x20342a(%rip)        # 604020 <__errno_location@GLIBC_2.2.5>
  400bf6:	68 01 00 00 00       	pushq  $0x1
  400bfb:	e9 d0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c00 <srandom@plt>:
  400c00:	ff 25 22 34 20 00    	jmpq   *0x203422(%rip)        # 604028 <srandom@GLIBC_2.2.5>
  400c06:	68 02 00 00 00       	pushq  $0x2
  400c0b:	e9 c0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c10 <strncmp@plt>:
  400c10:	ff 25 1a 34 20 00    	jmpq   *0x20341a(%rip)        # 604030 <strncmp@GLIBC_2.2.5>
  400c16:	68 03 00 00 00       	pushq  $0x3
  400c1b:	e9 b0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c20 <strcpy@plt>:
  400c20:	ff 25 12 34 20 00    	jmpq   *0x203412(%rip)        # 604038 <strcpy@GLIBC_2.2.5>
  400c26:	68 04 00 00 00       	pushq  $0x4
  400c2b:	e9 a0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c30 <puts@plt>:
  400c30:	ff 25 0a 34 20 00    	jmpq   *0x20340a(%rip)        # 604040 <puts@GLIBC_2.2.5>
  400c36:	68 05 00 00 00       	pushq  $0x5
  400c3b:	e9 90 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c40 <write@plt>:
  400c40:	ff 25 02 34 20 00    	jmpq   *0x203402(%rip)        # 604048 <write@GLIBC_2.2.5>
  400c46:	68 06 00 00 00       	pushq  $0x6
  400c4b:	e9 80 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c50 <mmap@plt>:
  400c50:	ff 25 fa 33 20 00    	jmpq   *0x2033fa(%rip)        # 604050 <mmap@GLIBC_2.2.5>
  400c56:	68 07 00 00 00       	pushq  $0x7
  400c5b:	e9 70 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c60 <printf@plt>:
  400c60:	ff 25 f2 33 20 00    	jmpq   *0x2033f2(%rip)        # 604058 <printf@GLIBC_2.2.5>
  400c66:	68 08 00 00 00       	pushq  $0x8
  400c6b:	e9 60 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c70 <memset@plt>:
  400c70:	ff 25 ea 33 20 00    	jmpq   *0x2033ea(%rip)        # 604060 <memset@GLIBC_2.2.5>
  400c76:	68 09 00 00 00       	pushq  $0x9
  400c7b:	e9 50 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c80 <alarm@plt>:
  400c80:	ff 25 e2 33 20 00    	jmpq   *0x2033e2(%rip)        # 604068 <alarm@GLIBC_2.2.5>
  400c86:	68 0a 00 00 00       	pushq  $0xa
  400c8b:	e9 40 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c90 <close@plt>:
  400c90:	ff 25 da 33 20 00    	jmpq   *0x2033da(%rip)        # 604070 <close@GLIBC_2.2.5>
  400c96:	68 0b 00 00 00       	pushq  $0xb
  400c9b:	e9 30 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400ca0 <read@plt>:
  400ca0:	ff 25 d2 33 20 00    	jmpq   *0x2033d2(%rip)        # 604078 <read@GLIBC_2.2.5>
  400ca6:	68 0c 00 00 00       	pushq  $0xc
  400cab:	e9 20 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cb0 <signal@plt>:
  400cb0:	ff 25 ca 33 20 00    	jmpq   *0x2033ca(%rip)        # 604080 <signal@GLIBC_2.2.5>
  400cb6:	68 0d 00 00 00       	pushq  $0xd
  400cbb:	e9 10 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cc0 <gethostbyname@plt>:
  400cc0:	ff 25 c2 33 20 00    	jmpq   *0x2033c2(%rip)        # 604088 <gethostbyname@GLIBC_2.2.5>
  400cc6:	68 0e 00 00 00       	pushq  $0xe
  400ccb:	e9 00 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cd0 <fprintf@plt>:
  400cd0:	ff 25 ba 33 20 00    	jmpq   *0x2033ba(%rip)        # 604090 <fprintf@GLIBC_2.2.5>
  400cd6:	68 0f 00 00 00       	pushq  $0xf
  400cdb:	e9 f0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400ce0 <strtol@plt>:
  400ce0:	ff 25 b2 33 20 00    	jmpq   *0x2033b2(%rip)        # 604098 <strtol@GLIBC_2.2.5>
  400ce6:	68 10 00 00 00       	pushq  $0x10
  400ceb:	e9 e0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400cf0 <memcpy@plt>:
  400cf0:	ff 25 aa 33 20 00    	jmpq   *0x2033aa(%rip)        # 6040a0 <memcpy@GLIBC_2.14>
  400cf6:	68 11 00 00 00       	pushq  $0x11
  400cfb:	e9 d0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d00 <time@plt>:
  400d00:	ff 25 a2 33 20 00    	jmpq   *0x2033a2(%rip)        # 6040a8 <time@GLIBC_2.2.5>
  400d06:	68 12 00 00 00       	pushq  $0x12
  400d0b:	e9 c0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d10 <random@plt>:
  400d10:	ff 25 9a 33 20 00    	jmpq   *0x20339a(%rip)        # 6040b0 <random@GLIBC_2.2.5>
  400d16:	68 13 00 00 00       	pushq  $0x13
  400d1b:	e9 b0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d20 <_IO_getc@plt>:
  400d20:	ff 25 92 33 20 00    	jmpq   *0x203392(%rip)        # 6040b8 <_IO_getc@GLIBC_2.2.5>
  400d26:	68 14 00 00 00       	pushq  $0x14
  400d2b:	e9 a0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d30 <__isoc99_sscanf@plt>:
  400d30:	ff 25 8a 33 20 00    	jmpq   *0x20338a(%rip)        # 6040c0 <__isoc99_sscanf@GLIBC_2.7>
  400d36:	68 15 00 00 00       	pushq  $0x15
  400d3b:	e9 90 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d40 <munmap@plt>:
  400d40:	ff 25 82 33 20 00    	jmpq   *0x203382(%rip)        # 6040c8 <munmap@GLIBC_2.2.5>
  400d46:	68 16 00 00 00       	pushq  $0x16
  400d4b:	e9 80 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d50 <bcopy@plt>:
  400d50:	ff 25 7a 33 20 00    	jmpq   *0x20337a(%rip)        # 6040d0 <bcopy@GLIBC_2.2.5>
  400d56:	68 17 00 00 00       	pushq  $0x17
  400d5b:	e9 70 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d60 <fopen@plt>:
  400d60:	ff 25 72 33 20 00    	jmpq   *0x203372(%rip)        # 6040d8 <fopen@GLIBC_2.2.5>
  400d66:	68 18 00 00 00       	pushq  $0x18
  400d6b:	e9 60 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d70 <getopt@plt>:
  400d70:	ff 25 6a 33 20 00    	jmpq   *0x20336a(%rip)        # 6040e0 <getopt@GLIBC_2.2.5>
  400d76:	68 19 00 00 00       	pushq  $0x19
  400d7b:	e9 50 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d80 <strtoul@plt>:
  400d80:	ff 25 62 33 20 00    	jmpq   *0x203362(%rip)        # 6040e8 <strtoul@GLIBC_2.2.5>
  400d86:	68 1a 00 00 00       	pushq  $0x1a
  400d8b:	e9 40 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d90 <gethostname@plt>:
  400d90:	ff 25 5a 33 20 00    	jmpq   *0x20335a(%rip)        # 6040f0 <gethostname@GLIBC_2.2.5>
  400d96:	68 1b 00 00 00       	pushq  $0x1b
  400d9b:	e9 30 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400da0 <sprintf@plt>:
  400da0:	ff 25 52 33 20 00    	jmpq   *0x203352(%rip)        # 6040f8 <sprintf@GLIBC_2.2.5>
  400da6:	68 1c 00 00 00       	pushq  $0x1c
  400dab:	e9 20 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400db0 <exit@plt>:
  400db0:	ff 25 4a 33 20 00    	jmpq   *0x20334a(%rip)        # 604100 <exit@GLIBC_2.2.5>
  400db6:	68 1d 00 00 00       	pushq  $0x1d
  400dbb:	e9 10 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400dc0 <connect@plt>:
  400dc0:	ff 25 42 33 20 00    	jmpq   *0x203342(%rip)        # 604108 <connect@GLIBC_2.2.5>
  400dc6:	68 1e 00 00 00       	pushq  $0x1e
  400dcb:	e9 00 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400dd0 <socket@plt>:
  400dd0:	ff 25 3a 33 20 00    	jmpq   *0x20333a(%rip)        # 604110 <socket@GLIBC_2.2.5>
  400dd6:	68 1f 00 00 00       	pushq  $0x1f
  400ddb:	e9 f0 fd ff ff       	jmpq   400bd0 <.plt>

Disassembly of section .text:

0000000000400de0 <_start>:
  400de0:	31 ed                	xor    %ebp,%ebp
  400de2:	49 89 d1             	mov    %rdx,%r9
  400de5:	5e                   	pop    %rsi
  400de6:	48 89 e2             	mov    %rsp,%rdx
  400de9:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400ded:	50                   	push   %rax
  400dee:	54                   	push   %rsp
  400def:	49 c7 c0 c0 2b 40 00 	mov    $0x402bc0,%r8
  400df6:	48 c7 c1 50 2b 40 00 	mov    $0x402b50,%rcx
  400dfd:	48 c7 c7 8d 10 40 00 	mov    $0x40108d,%rdi
  400e04:	ff 15 e6 31 20 00    	callq  *0x2031e6(%rip)        # 603ff0 <__libc_start_main@GLIBC_2.2.5>
  400e0a:	f4                   	hlt    
  400e0b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400e10 <deregister_tm_clones>:
  400e10:	b8 97 44 60 00       	mov    $0x604497,%eax
  400e15:	55                   	push   %rbp
  400e16:	48 2d 90 44 60 00    	sub    $0x604490,%rax
  400e1c:	48 83 f8 0e          	cmp    $0xe,%rax
  400e20:	48 89 e5             	mov    %rsp,%rbp
  400e23:	76 1b                	jbe    400e40 <deregister_tm_clones+0x30>
  400e25:	b8 00 00 00 00       	mov    $0x0,%eax
  400e2a:	48 85 c0             	test   %rax,%rax
  400e2d:	74 11                	je     400e40 <deregister_tm_clones+0x30>
  400e2f:	5d                   	pop    %rbp
  400e30:	bf 90 44 60 00       	mov    $0x604490,%edi
  400e35:	ff e0                	jmpq   *%rax
  400e37:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400e3e:	00 00 
  400e40:	5d                   	pop    %rbp
  400e41:	c3                   	retq   
  400e42:	0f 1f 40 00          	nopl   0x0(%rax)
  400e46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e4d:	00 00 00 

0000000000400e50 <register_tm_clones>:
  400e50:	be 90 44 60 00       	mov    $0x604490,%esi
  400e55:	55                   	push   %rbp
  400e56:	48 81 ee 90 44 60 00 	sub    $0x604490,%rsi
  400e5d:	48 c1 fe 03          	sar    $0x3,%rsi
  400e61:	48 89 e5             	mov    %rsp,%rbp
  400e64:	48 89 f0             	mov    %rsi,%rax
  400e67:	48 c1 e8 3f          	shr    $0x3f,%rax
  400e6b:	48 01 c6             	add    %rax,%rsi
  400e6e:	48 d1 fe             	sar    %rsi
  400e71:	74 15                	je     400e88 <register_tm_clones+0x38>
  400e73:	b8 00 00 00 00       	mov    $0x0,%eax
  400e78:	48 85 c0             	test   %rax,%rax
  400e7b:	74 0b                	je     400e88 <register_tm_clones+0x38>
  400e7d:	5d                   	pop    %rbp
  400e7e:	bf 90 44 60 00       	mov    $0x604490,%edi
  400e83:	ff e0                	jmpq   *%rax
  400e85:	0f 1f 00             	nopl   (%rax)
  400e88:	5d                   	pop    %rbp
  400e89:	c3                   	retq   
  400e8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400e90 <__do_global_dtors_aux>:
  400e90:	80 3d 31 36 20 00 00 	cmpb   $0x0,0x203631(%rip)        # 6044c8 <completed.6972>
  400e97:	75 11                	jne    400eaa <__do_global_dtors_aux+0x1a>
  400e99:	55                   	push   %rbp
  400e9a:	48 89 e5             	mov    %rsp,%rbp
  400e9d:	e8 6e ff ff ff       	callq  400e10 <deregister_tm_clones>
  400ea2:	5d                   	pop    %rbp
  400ea3:	c6 05 1e 36 20 00 01 	movb   $0x1,0x20361e(%rip)        # 6044c8 <completed.6972>
  400eaa:	f3 c3                	repz retq 
  400eac:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400eb0 <frame_dummy>:
  400eb0:	bf 18 3e 60 00       	mov    $0x603e18,%edi
  400eb5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400eb9:	75 05                	jne    400ec0 <frame_dummy+0x10>
  400ebb:	eb 93                	jmp    400e50 <register_tm_clones>
  400ebd:	0f 1f 00             	nopl   (%rax)
  400ec0:	b8 00 00 00 00       	mov    $0x0,%eax
  400ec5:	48 85 c0             	test   %rax,%rax
  400ec8:	74 f1                	je     400ebb <frame_dummy+0xb>
  400eca:	55                   	push   %rbp
  400ecb:	48 89 e5             	mov    %rsp,%rbp
  400ece:	ff d0                	callq  *%rax
  400ed0:	5d                   	pop    %rbp
  400ed1:	e9 7a ff ff ff       	jmpq   400e50 <register_tm_clones>

0000000000400ed6 <usage>:
  400ed6:	48 83 ec 08          	sub    $0x8,%rsp
  400eda:	48 89 fe             	mov    %rdi,%rsi
  400edd:	83 3d 24 36 20 00 00 	cmpl   $0x0,0x203624(%rip)        # 604508 <is_checker>
  400ee4:	74 4b                	je     400f31 <usage+0x5b>
  400ee6:	48 8d 3d eb 1c 00 00 	lea    0x1ceb(%rip),%rdi        # 402bd8 <_IO_stdin_used+0x8>
  400eed:	b8 00 00 00 00       	mov    $0x0,%eax
  400ef2:	e8 69 fd ff ff       	callq  400c60 <printf@plt>
  400ef7:	48 8d 3d 12 1d 00 00 	lea    0x1d12(%rip),%rdi        # 402c10 <_IO_stdin_used+0x40>
  400efe:	e8 2d fd ff ff       	callq  400c30 <puts@plt>
  400f03:	48 8d 3d 3e 1e 00 00 	lea    0x1e3e(%rip),%rdi        # 402d48 <_IO_stdin_used+0x178>
  400f0a:	e8 21 fd ff ff       	callq  400c30 <puts@plt>
  400f0f:	48 8d 3d 22 1d 00 00 	lea    0x1d22(%rip),%rdi        # 402c38 <_IO_stdin_used+0x68>
  400f16:	e8 15 fd ff ff       	callq  400c30 <puts@plt>
  400f1b:	48 8d 3d 40 1e 00 00 	lea    0x1e40(%rip),%rdi        # 402d62 <_IO_stdin_used+0x192>
  400f22:	e8 09 fd ff ff       	callq  400c30 <puts@plt>
  400f27:	bf 00 00 00 00       	mov    $0x0,%edi
  400f2c:	e8 7f fe ff ff       	callq  400db0 <exit@plt>
  400f31:	48 8d 3d 46 1e 00 00 	lea    0x1e46(%rip),%rdi        # 402d7e <_IO_stdin_used+0x1ae>
  400f38:	b8 00 00 00 00       	mov    $0x0,%eax
  400f3d:	e8 1e fd ff ff       	callq  400c60 <printf@plt>
  400f42:	48 8d 3d 17 1d 00 00 	lea    0x1d17(%rip),%rdi        # 402c60 <_IO_stdin_used+0x90>
  400f49:	e8 e2 fc ff ff       	callq  400c30 <puts@plt>
  400f4e:	48 8d 3d 33 1d 00 00 	lea    0x1d33(%rip),%rdi        # 402c88 <_IO_stdin_used+0xb8>
  400f55:	e8 d6 fc ff ff       	callq  400c30 <puts@plt>
  400f5a:	48 8d 3d 3b 1e 00 00 	lea    0x1e3b(%rip),%rdi        # 402d9c <_IO_stdin_used+0x1cc>
  400f61:	e8 ca fc ff ff       	callq  400c30 <puts@plt>
  400f66:	eb bf                	jmp    400f27 <usage+0x51>

0000000000400f68 <initialize_target>:
  400f68:	55                   	push   %rbp
  400f69:	53                   	push   %rbx
  400f6a:	48 81 ec 08 21 00 00 	sub    $0x2108,%rsp
  400f71:	89 f5                	mov    %esi,%ebp
  400f73:	89 3d 7f 35 20 00    	mov    %edi,0x20357f(%rip)        # 6044f8 <check_level>
  400f79:	8b 3d b1 31 20 00    	mov    0x2031b1(%rip),%edi        # 604130 <target_id>
  400f7f:	e8 aa 1b 00 00       	callq  402b2e <gencookie>
  400f84:	89 05 7a 35 20 00    	mov    %eax,0x20357a(%rip)        # 604504 <cookie>
  400f8a:	89 c7                	mov    %eax,%edi
  400f8c:	e8 9d 1b 00 00       	callq  402b2e <gencookie>
  400f91:	89 05 69 35 20 00    	mov    %eax,0x203569(%rip)        # 604500 <authkey>
  400f97:	8b 05 93 31 20 00    	mov    0x203193(%rip),%eax        # 604130 <target_id>
  400f9d:	8d 78 01             	lea    0x1(%rax),%edi
  400fa0:	e8 5b fc ff ff       	callq  400c00 <srandom@plt>
  400fa5:	e8 66 fd ff ff       	callq  400d10 <random@plt>
  400faa:	89 c7                	mov    %eax,%edi
  400fac:	e8 c3 02 00 00       	callq  401274 <scramble>
  400fb1:	89 c3                	mov    %eax,%ebx
  400fb3:	85 ed                	test   %ebp,%ebp
  400fb5:	75 3d                	jne    400ff4 <initialize_target+0x8c>
  400fb7:	b8 00 00 00 00       	mov    $0x0,%eax
  400fbc:	01 d8                	add    %ebx,%eax
  400fbe:	0f b7 c0             	movzwl %ax,%eax
  400fc1:	8d 04 c5 00 01 00 00 	lea    0x100(,%rax,8),%eax
  400fc8:	89 c0                	mov    %eax,%eax
  400fca:	48 89 05 af 34 20 00 	mov    %rax,0x2034af(%rip)        # 604480 <buf_offset>
  400fd1:	c6 05 50 41 20 00 63 	movb   $0x63,0x204150(%rip)        # 605128 <target_prefix>
  400fd8:	83 3d a9 34 20 00 00 	cmpl   $0x0,0x2034a9(%rip)        # 604488 <notify>
  400fdf:	74 09                	je     400fea <initialize_target+0x82>
  400fe1:	83 3d 20 35 20 00 00 	cmpl   $0x0,0x203520(%rip)        # 604508 <is_checker>
  400fe8:	74 22                	je     40100c <initialize_target+0xa4>
  400fea:	48 81 c4 08 21 00 00 	add    $0x2108,%rsp
  400ff1:	5b                   	pop    %rbx
  400ff2:	5d                   	pop    %rbp
  400ff3:	c3                   	retq   
  400ff4:	bf 00 00 00 00       	mov    $0x0,%edi
  400ff9:	e8 02 fd ff ff       	callq  400d00 <time@plt>
  400ffe:	89 c7                	mov    %eax,%edi
  401000:	e8 fb fb ff ff       	callq  400c00 <srandom@plt>
  401005:	e8 06 fd ff ff       	callq  400d10 <random@plt>
  40100a:	eb b0                	jmp    400fbc <initialize_target+0x54>
  40100c:	48 89 e7             	mov    %rsp,%rdi
  40100f:	be 00 01 00 00       	mov    $0x100,%esi
  401014:	e8 77 fd ff ff       	callq  400d90 <gethostname@plt>
  401019:	89 c3                	mov    %eax,%ebx
  40101b:	85 c0                	test   %eax,%eax
  40101d:	75 24                	jne    401043 <initialize_target+0xdb>
  40101f:	48 63 c3             	movslq %ebx,%rax
  401022:	48 8d 15 37 31 20 00 	lea    0x203137(%rip),%rdx        # 604160 <host_table>
  401029:	48 8b 3c c2          	mov    (%rdx,%rax,8),%rdi
  40102d:	48 85 ff             	test   %rdi,%rdi
  401030:	74 27                	je     401059 <initialize_target+0xf1>
  401032:	48 89 e6             	mov    %rsp,%rsi
  401035:	e8 a6 fb ff ff       	callq  400be0 <strcasecmp@plt>
  40103a:	85 c0                	test   %eax,%eax
  40103c:	74 1b                	je     401059 <initialize_target+0xf1>
  40103e:	83 c3 01             	add    $0x1,%ebx
  401041:	eb dc                	jmp    40101f <initialize_target+0xb7>
  401043:	48 8d 3d 6e 1c 00 00 	lea    0x1c6e(%rip),%rdi        # 402cb8 <_IO_stdin_used+0xe8>
  40104a:	e8 e1 fb ff ff       	callq  400c30 <puts@plt>
  40104f:	bf 08 00 00 00       	mov    $0x8,%edi
  401054:	e8 57 fd ff ff       	callq  400db0 <exit@plt>
  401059:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  401060:	00 
  401061:	e8 4d 18 00 00       	callq  4028b3 <init_driver>
  401066:	85 c0                	test   %eax,%eax
  401068:	79 80                	jns    400fea <initialize_target+0x82>
  40106a:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  401071:	00 
  401072:	48 8d 3d 77 1c 00 00 	lea    0x1c77(%rip),%rdi        # 402cf0 <_IO_stdin_used+0x120>
  401079:	b8 00 00 00 00       	mov    $0x0,%eax
  40107e:	e8 dd fb ff ff       	callq  400c60 <printf@plt>
  401083:	bf 08 00 00 00       	mov    $0x8,%edi
  401088:	e8 23 fd ff ff       	callq  400db0 <exit@plt>

000000000040108d <main>:
  40108d:	41 56                	push   %r14
  40108f:	41 55                	push   %r13
  401091:	41 54                	push   %r12
  401093:	55                   	push   %rbp
  401094:	53                   	push   %rbx
  401095:	41 89 fc             	mov    %edi,%r12d
  401098:	48 89 f3             	mov    %rsi,%rbx
  40109b:	48 c7 c6 59 1c 40 00 	mov    $0x401c59,%rsi
  4010a2:	bf 0b 00 00 00       	mov    $0xb,%edi
  4010a7:	e8 04 fc ff ff       	callq  400cb0 <signal@plt>
  4010ac:	48 c7 c6 05 1c 40 00 	mov    $0x401c05,%rsi
  4010b3:	bf 07 00 00 00       	mov    $0x7,%edi
  4010b8:	e8 f3 fb ff ff       	callq  400cb0 <signal@plt>
  4010bd:	48 c7 c6 ad 1c 40 00 	mov    $0x401cad,%rsi
  4010c4:	bf 04 00 00 00       	mov    $0x4,%edi
  4010c9:	e8 e2 fb ff ff       	callq  400cb0 <signal@plt>
  4010ce:	83 3d 33 34 20 00 00 	cmpl   $0x0,0x203433(%rip)        # 604508 <is_checker>
  4010d5:	75 58                	jne    40112f <main+0xa2>
  4010d7:	48 8d 2d d7 1c 00 00 	lea    0x1cd7(%rip),%rbp        # 402db5 <_IO_stdin_used+0x1e5>
  4010de:	48 8b 05 bb 33 20 00 	mov    0x2033bb(%rip),%rax        # 6044a0 <stdin@@GLIBC_2.2.5>
  4010e5:	48 89 05 04 34 20 00 	mov    %rax,0x203404(%rip)        # 6044f0 <infile>
  4010ec:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  4010f2:	41 be 00 00 00 00    	mov    $0x0,%r14d
  4010f8:	48 89 ea             	mov    %rbp,%rdx
  4010fb:	48 89 de             	mov    %rbx,%rsi
  4010fe:	44 89 e7             	mov    %r12d,%edi
  401101:	e8 6a fc ff ff       	callq  400d70 <getopt@plt>
  401106:	3c ff                	cmp    $0xff,%al
  401108:	0f 84 f8 00 00 00    	je     401206 <main+0x179>
  40110e:	0f be f0             	movsbl %al,%esi
  401111:	83 e8 61             	sub    $0x61,%eax
  401114:	3c 10                	cmp    $0x10,%al
  401116:	0f 87 d1 00 00 00    	ja     4011ed <main+0x160>
  40111c:	0f b6 c0             	movzbl %al,%eax
  40111f:	48 8d 15 da 1c 00 00 	lea    0x1cda(%rip),%rdx        # 402e00 <_IO_stdin_used+0x230>
  401126:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  40112a:	48 01 d0             	add    %rdx,%rax
  40112d:	ff e0                	jmpq   *%rax
  40112f:	48 c7 c6 01 1d 40 00 	mov    $0x401d01,%rsi
  401136:	bf 0e 00 00 00       	mov    $0xe,%edi
  40113b:	e8 70 fb ff ff       	callq  400cb0 <signal@plt>
  401140:	bf 05 00 00 00       	mov    $0x5,%edi
  401145:	e8 36 fb ff ff       	callq  400c80 <alarm@plt>
  40114a:	48 8d 2d 69 1c 00 00 	lea    0x1c69(%rip),%rbp        # 402dba <_IO_stdin_used+0x1ea>
  401151:	eb 8b                	jmp    4010de <main+0x51>
  401153:	48 8b 3b             	mov    (%rbx),%rdi
  401156:	e8 7b fd ff ff       	callq  400ed6 <usage>
  40115b:	48 8d 35 e3 1e 00 00 	lea    0x1ee3(%rip),%rsi        # 403045 <_IO_stdin_used+0x475>
  401162:	48 8b 3d 3f 33 20 00 	mov    0x20333f(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  401169:	e8 f2 fb ff ff       	callq  400d60 <fopen@plt>
  40116e:	48 89 05 7b 33 20 00 	mov    %rax,0x20337b(%rip)        # 6044f0 <infile>
  401175:	48 85 c0             	test   %rax,%rax
  401178:	0f 85 7a ff ff ff    	jne    4010f8 <main+0x6b>
  40117e:	48 8b 15 23 33 20 00 	mov    0x203323(%rip),%rdx        # 6044a8 <optarg@@GLIBC_2.2.5>
  401185:	48 8d 35 36 1c 00 00 	lea    0x1c36(%rip),%rsi        # 402dc2 <_IO_stdin_used+0x1f2>
  40118c:	48 8b 3d 2d 33 20 00 	mov    0x20332d(%rip),%rdi        # 6044c0 <stderr@@GLIBC_2.2.5>
  401193:	e8 38 fb ff ff       	callq  400cd0 <fprintf@plt>
  401198:	b8 01 00 00 00       	mov    $0x1,%eax
  40119d:	e9 c9 00 00 00       	jmpq   40126b <main+0x1de>
  4011a2:	ba 10 00 00 00       	mov    $0x10,%edx
  4011a7:	be 00 00 00 00       	mov    $0x0,%esi
  4011ac:	48 8b 3d f5 32 20 00 	mov    0x2032f5(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  4011b3:	e8 c8 fb ff ff       	callq  400d80 <strtoul@plt>
  4011b8:	41 89 c6             	mov    %eax,%r14d
  4011bb:	e9 38 ff ff ff       	jmpq   4010f8 <main+0x6b>
  4011c0:	ba 0a 00 00 00       	mov    $0xa,%edx
  4011c5:	be 00 00 00 00       	mov    $0x0,%esi
  4011ca:	48 8b 3d d7 32 20 00 	mov    0x2032d7(%rip),%rdi        # 6044a8 <optarg@@GLIBC_2.2.5>
  4011d1:	e8 0a fb ff ff       	callq  400ce0 <strtol@plt>
  4011d6:	41 89 c5             	mov    %eax,%r13d
  4011d9:	e9 1a ff ff ff       	jmpq   4010f8 <main+0x6b>
  4011de:	c7 05 a0 32 20 00 00 	movl   $0x0,0x2032a0(%rip)        # 604488 <notify>
  4011e5:	00 00 00 
  4011e8:	e9 0b ff ff ff       	jmpq   4010f8 <main+0x6b>
  4011ed:	48 8d 3d eb 1b 00 00 	lea    0x1beb(%rip),%rdi        # 402ddf <_IO_stdin_used+0x20f>
  4011f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4011f9:	e8 62 fa ff ff       	callq  400c60 <printf@plt>
  4011fe:	48 8b 3b             	mov    (%rbx),%rdi
  401201:	e8 d0 fc ff ff       	callq  400ed6 <usage>
  401206:	be 00 00 00 00       	mov    $0x0,%esi
  40120b:	44 89 ef             	mov    %r13d,%edi
  40120e:	e8 55 fd ff ff       	callq  400f68 <initialize_target>
  401213:	83 3d ee 32 20 00 00 	cmpl   $0x0,0x2032ee(%rip)        # 604508 <is_checker>
  40121a:	74 27                	je     401243 <main+0x1b6>
  40121c:	44 3b 35 dd 32 20 00 	cmp    0x2032dd(%rip),%r14d        # 604500 <authkey>
  401223:	74 1e                	je     401243 <main+0x1b6>
  401225:	44 89 f6             	mov    %r14d,%esi
  401228:	48 8d 3d e9 1a 00 00 	lea    0x1ae9(%rip),%rdi        # 402d18 <_IO_stdin_used+0x148>
  40122f:	b8 00 00 00 00       	mov    $0x0,%eax
  401234:	e8 27 fa ff ff       	callq  400c60 <printf@plt>
  401239:	b8 00 00 00 00       	mov    $0x0,%eax
  40123e:	e8 92 06 00 00       	callq  4018d5 <check_fail>
  401243:	8b 35 bb 32 20 00    	mov    0x2032bb(%rip),%esi        # 604504 <cookie>
  401249:	48 8d 3d a2 1b 00 00 	lea    0x1ba2(%rip),%rdi        # 402df2 <_IO_stdin_used+0x222>
  401250:	b8 00 00 00 00       	mov    $0x0,%eax
  401255:	e8 06 fa ff ff       	callq  400c60 <printf@plt>
  40125a:	48 8b 3d 1f 32 20 00 	mov    0x20321f(%rip),%rdi        # 604480 <buf_offset>
  401261:	e8 76 0b 00 00       	callq  401ddc <stable_launch>
  401266:	b8 00 00 00 00       	mov    $0x0,%eax
  40126b:	5b                   	pop    %rbx
  40126c:	5d                   	pop    %rbp
  40126d:	41 5c                	pop    %r12
  40126f:	41 5d                	pop    %r13
  401271:	41 5e                	pop    %r14
  401273:	c3                   	retq   

0000000000401274 <scramble>:
  401274:	b8 00 00 00 00       	mov    $0x0,%eax
  401279:	eb 11                	jmp    40128c <scramble+0x18>
  40127b:	69 d0 87 89 00 00    	imul   $0x8987,%eax,%edx
  401281:	01 fa                	add    %edi,%edx
  401283:	89 c1                	mov    %eax,%ecx
  401285:	89 54 8c d0          	mov    %edx,-0x30(%rsp,%rcx,4)
  401289:	83 c0 01             	add    $0x1,%eax
  40128c:	83 f8 09             	cmp    $0x9,%eax
  40128f:	76 ea                	jbe    40127b <scramble+0x7>
  401291:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401295:	69 c0 86 81 00 00    	imul   $0x8186,%eax,%eax
  40129b:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40129f:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4012a3:	69 c0 5c be 00 00    	imul   $0xbe5c,%eax,%eax
  4012a9:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4012ad:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4012b1:	69 c0 50 07 00 00    	imul   $0x750,%eax,%eax
  4012b7:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4012bb:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4012bf:	69 c0 3b b8 00 00    	imul   $0xb83b,%eax,%eax
  4012c5:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4012c9:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  4012cd:	69 c0 da 93 00 00    	imul   $0x93da,%eax,%eax
  4012d3:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  4012d7:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4012db:	69 c0 b5 d8 00 00    	imul   $0xd8b5,%eax,%eax
  4012e1:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4012e5:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4012e9:	69 c0 11 3a 00 00    	imul   $0x3a11,%eax,%eax
  4012ef:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4012f3:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4012f7:	69 c0 52 37 00 00    	imul   $0x3752,%eax,%eax
  4012fd:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401301:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401305:	69 c0 cd 1e 00 00    	imul   $0x1ecd,%eax,%eax
  40130b:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40130f:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401313:	69 c0 b5 94 00 00    	imul   $0x94b5,%eax,%eax
  401319:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40131d:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401321:	69 c0 a3 b0 00 00    	imul   $0xb0a3,%eax,%eax
  401327:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  40132b:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40132f:	69 c0 41 ed 00 00    	imul   $0xed41,%eax,%eax
  401335:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401339:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  40133d:	69 c0 cb 81 00 00    	imul   $0x81cb,%eax,%eax
  401343:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401347:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  40134b:	69 c0 9d b2 00 00    	imul   $0xb29d,%eax,%eax
  401351:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  401355:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401359:	69 c0 5a 67 00 00    	imul   $0x675a,%eax,%eax
  40135f:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401363:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401367:	69 c0 20 ab 00 00    	imul   $0xab20,%eax,%eax
  40136d:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401371:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401375:	69 c0 5c de 00 00    	imul   $0xde5c,%eax,%eax
  40137b:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  40137f:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401383:	69 c0 0b 66 00 00    	imul   $0x660b,%eax,%eax
  401389:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40138d:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401391:	69 c0 15 df 00 00    	imul   $0xdf15,%eax,%eax
  401397:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  40139b:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  40139f:	69 c0 32 1b 00 00    	imul   $0x1b32,%eax,%eax
  4013a5:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4013a9:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  4013ad:	69 c0 6c 05 00 00    	imul   $0x56c,%eax,%eax
  4013b3:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  4013b7:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4013bb:	69 c0 83 0d 00 00    	imul   $0xd83,%eax,%eax
  4013c1:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4013c5:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4013c9:	69 c0 22 f1 00 00    	imul   $0xf122,%eax,%eax
  4013cf:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4013d3:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4013d7:	69 c0 a6 e5 00 00    	imul   $0xe5a6,%eax,%eax
  4013dd:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4013e1:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4013e5:	69 c0 c5 b1 00 00    	imul   $0xb1c5,%eax,%eax
  4013eb:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  4013ef:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4013f3:	69 c0 a1 4b 00 00    	imul   $0x4ba1,%eax,%eax
  4013f9:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4013fd:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401401:	69 c0 27 f3 00 00    	imul   $0xf327,%eax,%eax
  401407:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40140b:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40140f:	69 c0 33 05 00 00    	imul   $0x533,%eax,%eax
  401415:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401419:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40141d:	69 c0 12 c3 00 00    	imul   $0xc312,%eax,%eax
  401423:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401427:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40142b:	69 c0 8b 96 00 00    	imul   $0x968b,%eax,%eax
  401431:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401435:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401439:	69 c0 74 11 00 00    	imul   $0x1174,%eax,%eax
  40143f:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401443:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  401447:	69 c0 4c 13 00 00    	imul   $0x134c,%eax,%eax
  40144d:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401451:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401455:	69 c0 29 ab 00 00    	imul   $0xab29,%eax,%eax
  40145b:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40145f:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401463:	69 c0 7c d5 00 00    	imul   $0xd57c,%eax,%eax
  401469:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  40146d:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401471:	69 c0 9d 97 00 00    	imul   $0x979d,%eax,%eax
  401477:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40147b:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40147f:	69 c0 2d fd 00 00    	imul   $0xfd2d,%eax,%eax
  401485:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401489:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40148d:	69 c0 96 e4 00 00    	imul   $0xe496,%eax,%eax
  401493:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401497:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40149b:	69 c0 87 dc 00 00    	imul   $0xdc87,%eax,%eax
  4014a1:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4014a5:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4014a9:	69 c0 86 4f 00 00    	imul   $0x4f86,%eax,%eax
  4014af:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4014b3:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4014b7:	69 c0 a7 e5 00 00    	imul   $0xe5a7,%eax,%eax
  4014bd:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4014c1:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4014c5:	69 c0 88 3c 00 00    	imul   $0x3c88,%eax,%eax
  4014cb:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4014cf:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  4014d3:	69 c0 b3 63 00 00    	imul   $0x63b3,%eax,%eax
  4014d9:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  4014dd:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  4014e1:	69 c0 2a 6a 00 00    	imul   $0x6a2a,%eax,%eax
  4014e7:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  4014eb:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4014ef:	69 c0 a2 a4 00 00    	imul   $0xa4a2,%eax,%eax
  4014f5:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4014f9:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  4014fd:	69 c0 b6 20 00 00    	imul   $0x20b6,%eax,%eax
  401503:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401507:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  40150b:	69 c0 a9 57 00 00    	imul   $0x57a9,%eax,%eax
  401511:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401515:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401519:	69 c0 d9 7c 00 00    	imul   $0x7cd9,%eax,%eax
  40151f:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401523:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401527:	69 c0 fa 21 00 00    	imul   $0x21fa,%eax,%eax
  40152d:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401531:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401535:	69 c0 4d e4 00 00    	imul   $0xe44d,%eax,%eax
  40153b:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  40153f:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  401543:	69 c0 40 b2 00 00    	imul   $0xb240,%eax,%eax
  401549:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  40154d:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  401551:	69 c0 25 e8 00 00    	imul   $0xe825,%eax,%eax
  401557:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  40155b:	8b 44 24 dc          	mov    -0x24(%rsp),%eax
  40155f:	69 c0 f5 18 00 00    	imul   $0x18f5,%eax,%eax
  401565:	89 44 24 dc          	mov    %eax,-0x24(%rsp)
  401569:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  40156d:	69 c0 1e ba 00 00    	imul   $0xba1e,%eax,%eax
  401573:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401577:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  40157b:	69 c0 73 a2 00 00    	imul   $0xa273,%eax,%eax
  401581:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  401585:	8b 44 24 f4          	mov    -0xc(%rsp),%eax
  401589:	69 c0 aa b7 00 00    	imul   $0xb7aa,%eax,%eax
  40158f:	89 44 24 f4          	mov    %eax,-0xc(%rsp)
  401593:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  401597:	69 c0 ef 0a 00 00    	imul   $0xaef,%eax,%eax
  40159d:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  4015a1:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4015a5:	69 c0 63 b9 00 00    	imul   $0xb963,%eax,%eax
  4015ab:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4015af:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4015b3:	69 c0 e2 23 00 00    	imul   $0x23e2,%eax,%eax
  4015b9:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4015bd:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  4015c1:	69 c0 89 d7 00 00    	imul   $0xd789,%eax,%eax
  4015c7:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  4015cb:	8b 44 24 ec          	mov    -0x14(%rsp),%eax
  4015cf:	69 c0 cb 50 00 00    	imul   $0x50cb,%eax,%eax
  4015d5:	89 44 24 ec          	mov    %eax,-0x14(%rsp)
  4015d9:	8b 44 24 d8          	mov    -0x28(%rsp),%eax
  4015dd:	69 c0 b1 03 00 00    	imul   $0x3b1,%eax,%eax
  4015e3:	89 44 24 d8          	mov    %eax,-0x28(%rsp)
  4015e7:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  4015eb:	69 c0 6a 2a 00 00    	imul   $0x2a6a,%eax,%eax
  4015f1:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  4015f5:	8b 44 24 f0          	mov    -0x10(%rsp),%eax
  4015f9:	69 c0 6a 13 00 00    	imul   $0x136a,%eax,%eax
  4015ff:	89 44 24 f0          	mov    %eax,-0x10(%rsp)
  401603:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401607:	69 c0 8d a8 00 00    	imul   $0xa88d,%eax,%eax
  40160d:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401611:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401615:	69 c0 db 43 00 00    	imul   $0x43db,%eax,%eax
  40161b:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40161f:	8b 44 24 d4          	mov    -0x2c(%rsp),%eax
  401623:	69 c0 a3 73 00 00    	imul   $0x73a3,%eax,%eax
  401629:	89 44 24 d4          	mov    %eax,-0x2c(%rsp)
  40162d:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  401631:	69 c0 3b 0a 00 00    	imul   $0xa3b,%eax,%eax
  401637:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  40163b:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  40163f:	69 c0 bc f8 00 00    	imul   $0xf8bc,%eax,%eax
  401645:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  401649:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  40164d:	69 c0 14 82 00 00    	imul   $0x8214,%eax,%eax
  401653:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401657:	8b 44 24 d0          	mov    -0x30(%rsp),%eax
  40165b:	69 c0 fd cd 00 00    	imul   $0xcdfd,%eax,%eax
  401661:	89 44 24 d0          	mov    %eax,-0x30(%rsp)
  401665:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401669:	69 c0 4b 23 00 00    	imul   $0x234b,%eax,%eax
  40166f:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  401673:	8b 44 24 e0          	mov    -0x20(%rsp),%eax
  401677:	69 c0 f1 2d 00 00    	imul   $0x2df1,%eax,%eax
  40167d:	89 44 24 e0          	mov    %eax,-0x20(%rsp)
  401681:	8b 44 24 e4          	mov    -0x1c(%rsp),%eax
  401685:	69 c0 8f 47 00 00    	imul   $0x478f,%eax,%eax
  40168b:	89 44 24 e4          	mov    %eax,-0x1c(%rsp)
  40168f:	8b 44 24 e8          	mov    -0x18(%rsp),%eax
  401693:	6b c0 3c             	imul   $0x3c,%eax,%eax
  401696:	89 44 24 e8          	mov    %eax,-0x18(%rsp)
  40169a:	ba 00 00 00 00       	mov    $0x0,%edx
  40169f:	b8 00 00 00 00       	mov    $0x0,%eax
  4016a4:	eb 0b                	jmp    4016b1 <scramble+0x43d>
  4016a6:	89 d1                	mov    %edx,%ecx
  4016a8:	8b 4c 8c d0          	mov    -0x30(%rsp,%rcx,4),%ecx
  4016ac:	01 c8                	add    %ecx,%eax
  4016ae:	83 c2 01             	add    $0x1,%edx
  4016b1:	83 fa 09             	cmp    $0x9,%edx
  4016b4:	76 f0                	jbe    4016a6 <scramble+0x432>
  4016b6:	f3 c3                	repz retq 

00000000004016b8 <getbuf>:
  4016b8:	48 83 ec 38          	sub    $0x38,%rsp
  4016bc:	48 89 e7             	mov    %rsp,%rdi
  4016bf:	e8 44 02 00 00       	callq  401908 <Gets>
  4016c4:	b8 01 00 00 00       	mov    $0x1,%eax
  4016c9:	48 83 c4 38          	add    $0x38,%rsp
  4016cd:	c3                   	retq   

00000000004016ce <touch1>:
  4016ce:	48 83 ec 08          	sub    $0x8,%rsp
  4016d2:	c7 05 20 2e 20 00 01 	movl   $0x1,0x202e20(%rip)        # 6044fc <vlevel>
  4016d9:	00 00 00 
  4016dc:	48 8d 3d b8 17 00 00 	lea    0x17b8(%rip),%rdi        # 402e9b <_IO_stdin_used+0x2cb>
  4016e3:	e8 48 f5 ff ff       	callq  400c30 <puts@plt>
  4016e8:	bf 01 00 00 00       	mov    $0x1,%edi
  4016ed:	e8 2d 04 00 00       	callq  401b1f <validate>
  4016f2:	bf 00 00 00 00       	mov    $0x0,%edi
  4016f7:	e8 b4 f6 ff ff       	callq  400db0 <exit@plt>

00000000004016fc <touch2>:
  4016fc:	48 83 ec 08          	sub    $0x8,%rsp
  401700:	89 fe                	mov    %edi,%esi
  401702:	c7 05 f0 2d 20 00 02 	movl   $0x2,0x202df0(%rip)        # 6044fc <vlevel>
  401709:	00 00 00 
  40170c:	39 3d f2 2d 20 00    	cmp    %edi,0x202df2(%rip)        # 604504 <cookie>
  401712:	74 25                	je     401739 <touch2+0x3d>
  401714:	48 8d 3d cd 17 00 00 	lea    0x17cd(%rip),%rdi        # 402ee8 <_IO_stdin_used+0x318>
  40171b:	b8 00 00 00 00       	mov    $0x0,%eax
  401720:	e8 3b f5 ff ff       	callq  400c60 <printf@plt>
  401725:	bf 02 00 00 00       	mov    $0x2,%edi
  40172a:	e8 ae 04 00 00       	callq  401bdd <fail>
  40172f:	bf 00 00 00 00       	mov    $0x0,%edi
  401734:	e8 77 f6 ff ff       	callq  400db0 <exit@plt>
  401739:	48 8d 3d 80 17 00 00 	lea    0x1780(%rip),%rdi        # 402ec0 <_IO_stdin_used+0x2f0>
  401740:	b8 00 00 00 00       	mov    $0x0,%eax
  401745:	e8 16 f5 ff ff       	callq  400c60 <printf@plt>
  40174a:	bf 02 00 00 00       	mov    $0x2,%edi
  40174f:	e8 cb 03 00 00       	callq  401b1f <validate>
  401754:	eb d9                	jmp    40172f <touch2+0x33>

0000000000401756 <hexmatch>:
  401756:	41 54                	push   %r12
  401758:	55                   	push   %rbp
  401759:	53                   	push   %rbx
  40175a:	48 83 ec 70          	sub    $0x70,%rsp
  40175e:	89 fd                	mov    %edi,%ebp
  401760:	48 89 f3             	mov    %rsi,%rbx
  401763:	e8 a8 f5 ff ff       	callq  400d10 <random@plt>
  401768:	48 89 c1             	mov    %rax,%rcx
  40176b:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  401772:	0a d7 a3 
  401775:	48 f7 ea             	imul   %rdx
  401778:	48 01 ca             	add    %rcx,%rdx
  40177b:	48 c1 fa 06          	sar    $0x6,%rdx
  40177f:	48 89 c8             	mov    %rcx,%rax
  401782:	48 c1 f8 3f          	sar    $0x3f,%rax
  401786:	48 29 c2             	sub    %rax,%rdx
  401789:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  40178d:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  401791:	48 8d 04 95 00 00 00 	lea    0x0(,%rdx,4),%rax
  401798:	00 
  401799:	48 29 c1             	sub    %rax,%rcx
  40179c:	4c 8d 24 0c          	lea    (%rsp,%rcx,1),%r12
  4017a0:	89 ea                	mov    %ebp,%edx
  4017a2:	48 8d 35 0f 17 00 00 	lea    0x170f(%rip),%rsi        # 402eb8 <_IO_stdin_used+0x2e8>
  4017a9:	4c 89 e7             	mov    %r12,%rdi
  4017ac:	b8 00 00 00 00       	mov    $0x0,%eax
  4017b1:	e8 ea f5 ff ff       	callq  400da0 <sprintf@plt>
  4017b6:	ba 09 00 00 00       	mov    $0x9,%edx
  4017bb:	4c 89 e6             	mov    %r12,%rsi
  4017be:	48 89 df             	mov    %rbx,%rdi
  4017c1:	e8 4a f4 ff ff       	callq  400c10 <strncmp@plt>
  4017c6:	85 c0                	test   %eax,%eax
  4017c8:	0f 94 c0             	sete   %al
  4017cb:	0f b6 c0             	movzbl %al,%eax
  4017ce:	48 83 c4 70          	add    $0x70,%rsp
  4017d2:	5b                   	pop    %rbx
  4017d3:	5d                   	pop    %rbp
  4017d4:	41 5c                	pop    %r12
  4017d6:	c3                   	retq   

00000000004017d7 <touch3>:
  4017d7:	53                   	push   %rbx
  4017d8:	48 89 fb             	mov    %rdi,%rbx
  4017db:	c7 05 17 2d 20 00 03 	movl   $0x3,0x202d17(%rip)        # 6044fc <vlevel>
  4017e2:	00 00 00 
  4017e5:	48 89 fe             	mov    %rdi,%rsi
  4017e8:	8b 3d 16 2d 20 00    	mov    0x202d16(%rip),%edi        # 604504 <cookie>
  4017ee:	e8 63 ff ff ff       	callq  401756 <hexmatch>
  4017f3:	85 c0                	test   %eax,%eax
  4017f5:	74 28                	je     40181f <touch3+0x48>
  4017f7:	48 89 de             	mov    %rbx,%rsi
  4017fa:	48 8d 3d 0f 17 00 00 	lea    0x170f(%rip),%rdi        # 402f10 <_IO_stdin_used+0x340>
  401801:	b8 00 00 00 00       	mov    $0x0,%eax
  401806:	e8 55 f4 ff ff       	callq  400c60 <printf@plt>
  40180b:	bf 03 00 00 00       	mov    $0x3,%edi
  401810:	e8 0a 03 00 00       	callq  401b1f <validate>
  401815:	bf 00 00 00 00       	mov    $0x0,%edi
  40181a:	e8 91 f5 ff ff       	callq  400db0 <exit@plt>
  40181f:	48 89 de             	mov    %rbx,%rsi
  401822:	48 8d 3d 0f 17 00 00 	lea    0x170f(%rip),%rdi        # 402f38 <_IO_stdin_used+0x368>
  401829:	b8 00 00 00 00       	mov    $0x0,%eax
  40182e:	e8 2d f4 ff ff       	callq  400c60 <printf@plt>
  401833:	bf 03 00 00 00       	mov    $0x3,%edi
  401838:	e8 a0 03 00 00       	callq  401bdd <fail>
  40183d:	eb d6                	jmp    401815 <touch3+0x3e>

000000000040183f <test>:
  40183f:	48 83 ec 08          	sub    $0x8,%rsp
  401843:	b8 00 00 00 00       	mov    $0x0,%eax
  401848:	e8 6b fe ff ff       	callq  4016b8 <getbuf>
  40184d:	89 c6                	mov    %eax,%esi
  40184f:	48 8d 3d 0a 17 00 00 	lea    0x170a(%rip),%rdi        # 402f60 <_IO_stdin_used+0x390>
  401856:	b8 00 00 00 00       	mov    $0x0,%eax
  40185b:	e8 00 f4 ff ff       	callq  400c60 <printf@plt>
  401860:	48 83 c4 08          	add    $0x8,%rsp
  401864:	c3                   	retq   

0000000000401865 <save_char>:
  401865:	8b 05 b9 38 20 00    	mov    0x2038b9(%rip),%eax        # 605124 <gets_cnt>
  40186b:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401870:	7f 4a                	jg     4018bc <save_char+0x57>
  401872:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401875:	89 f9                	mov    %edi,%ecx
  401877:	c0 e9 04             	shr    $0x4,%cl
  40187a:	4c 8d 05 ff 19 00 00 	lea    0x19ff(%rip),%r8        # 403280 <trans_char>
  401881:	83 e1 0f             	and    $0xf,%ecx
  401884:	45 0f b6 0c 08       	movzbl (%r8,%rcx,1),%r9d
  401889:	48 8d 0d 90 2c 20 00 	lea    0x202c90(%rip),%rcx        # 604520 <gets_buf>
  401890:	48 63 f2             	movslq %edx,%rsi
  401893:	44 88 0c 31          	mov    %r9b,(%rcx,%rsi,1)
  401897:	8d 72 01             	lea    0x1(%rdx),%esi
  40189a:	83 e7 0f             	and    $0xf,%edi
  40189d:	41 0f b6 3c 38       	movzbl (%r8,%rdi,1),%edi
  4018a2:	48 63 f6             	movslq %esi,%rsi
  4018a5:	40 88 3c 31          	mov    %dil,(%rcx,%rsi,1)
  4018a9:	83 c2 02             	add    $0x2,%edx
  4018ac:	48 63 d2             	movslq %edx,%rdx
  4018af:	c6 04 11 20          	movb   $0x20,(%rcx,%rdx,1)
  4018b3:	83 c0 01             	add    $0x1,%eax
  4018b6:	89 05 68 38 20 00    	mov    %eax,0x203868(%rip)        # 605124 <gets_cnt>
  4018bc:	f3 c3                	repz retq 

00000000004018be <save_term>:
  4018be:	8b 05 60 38 20 00    	mov    0x203860(%rip),%eax        # 605124 <gets_cnt>
  4018c4:	8d 04 40             	lea    (%rax,%rax,2),%eax
  4018c7:	48 98                	cltq   
  4018c9:	48 8d 15 50 2c 20 00 	lea    0x202c50(%rip),%rdx        # 604520 <gets_buf>
  4018d0:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  4018d4:	c3                   	retq   

00000000004018d5 <check_fail>:
  4018d5:	48 83 ec 08          	sub    $0x8,%rsp
  4018d9:	0f be 35 48 38 20 00 	movsbl 0x203848(%rip),%esi        # 605128 <target_prefix>
  4018e0:	48 8d 0d 39 2c 20 00 	lea    0x202c39(%rip),%rcx        # 604520 <gets_buf>
  4018e7:	8b 15 0b 2c 20 00    	mov    0x202c0b(%rip),%edx        # 6044f8 <check_level>
  4018ed:	48 8d 3d 8f 16 00 00 	lea    0x168f(%rip),%rdi        # 402f83 <_IO_stdin_used+0x3b3>
  4018f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4018f9:	e8 62 f3 ff ff       	callq  400c60 <printf@plt>
  4018fe:	bf 01 00 00 00       	mov    $0x1,%edi
  401903:	e8 a8 f4 ff ff       	callq  400db0 <exit@plt>

0000000000401908 <Gets>:
  401908:	41 54                	push   %r12
  40190a:	55                   	push   %rbp
  40190b:	53                   	push   %rbx
  40190c:	49 89 fc             	mov    %rdi,%r12
  40190f:	c7 05 0b 38 20 00 00 	movl   $0x0,0x20380b(%rip)        # 605124 <gets_cnt>
  401916:	00 00 00 
  401919:	48 89 fb             	mov    %rdi,%rbx
  40191c:	eb 11                	jmp    40192f <Gets+0x27>
  40191e:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401922:	88 03                	mov    %al,(%rbx)
  401924:	0f b6 f8             	movzbl %al,%edi
  401927:	e8 39 ff ff ff       	callq  401865 <save_char>
  40192c:	48 89 eb             	mov    %rbp,%rbx
  40192f:	48 8b 3d ba 2b 20 00 	mov    0x202bba(%rip),%rdi        # 6044f0 <infile>
  401936:	e8 e5 f3 ff ff       	callq  400d20 <_IO_getc@plt>
  40193b:	83 f8 ff             	cmp    $0xffffffff,%eax
  40193e:	74 05                	je     401945 <Gets+0x3d>
  401940:	83 f8 0a             	cmp    $0xa,%eax
  401943:	75 d9                	jne    40191e <Gets+0x16>
  401945:	c6 03 00             	movb   $0x0,(%rbx)
  401948:	b8 00 00 00 00       	mov    $0x0,%eax
  40194d:	e8 6c ff ff ff       	callq  4018be <save_term>
  401952:	4c 89 e0             	mov    %r12,%rax
  401955:	5b                   	pop    %rbx
  401956:	5d                   	pop    %rbp
  401957:	41 5c                	pop    %r12
  401959:	c3                   	retq   

000000000040195a <notify_server>:
  40195a:	83 3d a7 2b 20 00 00 	cmpl   $0x0,0x202ba7(%rip)        # 604508 <is_checker>
  401961:	0f 85 de 00 00 00    	jne    401a45 <notify_server+0xeb>
  401967:	55                   	push   %rbp
  401968:	53                   	push   %rbx
  401969:	48 81 ec 08 40 00 00 	sub    $0x4008,%rsp
  401970:	89 fb                	mov    %edi,%ebx
  401972:	8b 05 ac 37 20 00    	mov    0x2037ac(%rip),%eax        # 605124 <gets_cnt>
  401978:	83 c0 64             	add    $0x64,%eax
  40197b:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401980:	0f 8f c1 00 00 00    	jg     401a47 <notify_server+0xed>
  401986:	44 0f be 0d 9a 37 20 	movsbl 0x20379a(%rip),%r9d        # 605128 <target_prefix>
  40198d:	00 
  40198e:	83 3d f3 2a 20 00 00 	cmpl   $0x0,0x202af3(%rip)        # 604488 <notify>
  401995:	0f 84 c7 00 00 00    	je     401a62 <notify_server+0x108>
  40199b:	44 8b 05 5e 2b 20 00 	mov    0x202b5e(%rip),%r8d        # 604500 <authkey>
  4019a2:	85 db                	test   %ebx,%ebx
  4019a4:	0f 84 c3 00 00 00    	je     401a6d <notify_server+0x113>
  4019aa:	48 8d 2d e8 15 00 00 	lea    0x15e8(%rip),%rbp        # 402f99 <_IO_stdin_used+0x3c9>
  4019b1:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  4019b8:	00 
  4019b9:	48 8d 05 60 2b 20 00 	lea    0x202b60(%rip),%rax        # 604520 <gets_buf>
  4019c0:	50                   	push   %rax
  4019c1:	56                   	push   %rsi
  4019c2:	48 89 e9             	mov    %rbp,%rcx
  4019c5:	8b 15 65 27 20 00    	mov    0x202765(%rip),%edx        # 604130 <target_id>
  4019cb:	48 8d 35 d1 15 00 00 	lea    0x15d1(%rip),%rsi        # 402fa3 <_IO_stdin_used+0x3d3>
  4019d2:	b8 00 00 00 00       	mov    $0x0,%eax
  4019d7:	e8 c4 f3 ff ff       	callq  400da0 <sprintf@plt>
  4019dc:	48 83 c4 10          	add    $0x10,%rsp
  4019e0:	83 3d a1 2a 20 00 00 	cmpl   $0x0,0x202aa1(%rip)        # 604488 <notify>
  4019e7:	0f 84 b8 00 00 00    	je     401aa5 <notify_server+0x14b>
  4019ed:	85 db                	test   %ebx,%ebx
  4019ef:	0f 84 a2 00 00 00    	je     401a97 <notify_server+0x13d>
  4019f5:	48 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%rcx
  4019fc:	00 
  4019fd:	49 89 e1             	mov    %rsp,%r9
  401a00:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401a06:	48 8b 15 3b 27 20 00 	mov    0x20273b(%rip),%rdx        # 604148 <lab>
  401a0d:	48 8b 35 3c 27 20 00 	mov    0x20273c(%rip),%rsi        # 604150 <course>
  401a14:	48 8b 3d 25 27 20 00 	mov    0x202725(%rip),%rdi        # 604140 <user_id>
  401a1b:	e8 6e 10 00 00       	callq  402a8e <driver_post>
  401a20:	85 c0                	test   %eax,%eax
  401a22:	78 55                	js     401a79 <notify_server+0x11f>
  401a24:	48 8d 3d bd 16 00 00 	lea    0x16bd(%rip),%rdi        # 4030e8 <_IO_stdin_used+0x518>
  401a2b:	e8 00 f2 ff ff       	callq  400c30 <puts@plt>
  401a30:	48 8d 3d 94 15 00 00 	lea    0x1594(%rip),%rdi        # 402fcb <_IO_stdin_used+0x3fb>
  401a37:	e8 f4 f1 ff ff       	callq  400c30 <puts@plt>
  401a3c:	48 81 c4 08 40 00 00 	add    $0x4008,%rsp
  401a43:	5b                   	pop    %rbx
  401a44:	5d                   	pop    %rbp
  401a45:	f3 c3                	repz retq 
  401a47:	48 8d 3d 6a 16 00 00 	lea    0x166a(%rip),%rdi        # 4030b8 <_IO_stdin_used+0x4e8>
  401a4e:	b8 00 00 00 00       	mov    $0x0,%eax
  401a53:	e8 08 f2 ff ff       	callq  400c60 <printf@plt>
  401a58:	bf 01 00 00 00       	mov    $0x1,%edi
  401a5d:	e8 4e f3 ff ff       	callq  400db0 <exit@plt>
  401a62:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  401a68:	e9 35 ff ff ff       	jmpq   4019a2 <notify_server+0x48>
  401a6d:	48 8d 2d 2a 15 00 00 	lea    0x152a(%rip),%rbp        # 402f9e <_IO_stdin_used+0x3ce>
  401a74:	e9 38 ff ff ff       	jmpq   4019b1 <notify_server+0x57>
  401a79:	48 89 e6             	mov    %rsp,%rsi
  401a7c:	48 8d 3d 3c 15 00 00 	lea    0x153c(%rip),%rdi        # 402fbf <_IO_stdin_used+0x3ef>
  401a83:	b8 00 00 00 00       	mov    $0x0,%eax
  401a88:	e8 d3 f1 ff ff       	callq  400c60 <printf@plt>
  401a8d:	bf 01 00 00 00       	mov    $0x1,%edi
  401a92:	e8 19 f3 ff ff       	callq  400db0 <exit@plt>
  401a97:	48 8d 3d 37 15 00 00 	lea    0x1537(%rip),%rdi        # 402fd5 <_IO_stdin_used+0x405>
  401a9e:	e8 8d f1 ff ff       	callq  400c30 <puts@plt>
  401aa3:	eb 97                	jmp    401a3c <notify_server+0xe2>
  401aa5:	48 89 ee             	mov    %rbp,%rsi
  401aa8:	48 8d 3d 71 16 00 00 	lea    0x1671(%rip),%rdi        # 403120 <_IO_stdin_used+0x550>
  401aaf:	b8 00 00 00 00       	mov    $0x0,%eax
  401ab4:	e8 a7 f1 ff ff       	callq  400c60 <printf@plt>
  401ab9:	48 8b 35 80 26 20 00 	mov    0x202680(%rip),%rsi        # 604140 <user_id>
  401ac0:	48 8d 3d 15 15 00 00 	lea    0x1515(%rip),%rdi        # 402fdc <_IO_stdin_used+0x40c>
  401ac7:	b8 00 00 00 00       	mov    $0x0,%eax
  401acc:	e8 8f f1 ff ff       	callq  400c60 <printf@plt>
  401ad1:	48 8b 35 78 26 20 00 	mov    0x202678(%rip),%rsi        # 604150 <course>
  401ad8:	48 8d 3d 0a 15 00 00 	lea    0x150a(%rip),%rdi        # 402fe9 <_IO_stdin_used+0x419>
  401adf:	b8 00 00 00 00       	mov    $0x0,%eax
  401ae4:	e8 77 f1 ff ff       	callq  400c60 <printf@plt>
  401ae9:	48 8b 35 58 26 20 00 	mov    0x202658(%rip),%rsi        # 604148 <lab>
  401af0:	48 8d 3d fe 14 00 00 	lea    0x14fe(%rip),%rdi        # 402ff5 <_IO_stdin_used+0x425>
  401af7:	b8 00 00 00 00       	mov    $0x0,%eax
  401afc:	e8 5f f1 ff ff       	callq  400c60 <printf@plt>
  401b01:	48 8d b4 24 00 20 00 	lea    0x2000(%rsp),%rsi
  401b08:	00 
  401b09:	48 8d 3d ee 14 00 00 	lea    0x14ee(%rip),%rdi        # 402ffe <_IO_stdin_used+0x42e>
  401b10:	b8 00 00 00 00       	mov    $0x0,%eax
  401b15:	e8 46 f1 ff ff       	callq  400c60 <printf@plt>
  401b1a:	e9 1d ff ff ff       	jmpq   401a3c <notify_server+0xe2>

0000000000401b1f <validate>:
  401b1f:	53                   	push   %rbx
  401b20:	89 fb                	mov    %edi,%ebx
  401b22:	83 3d df 29 20 00 00 	cmpl   $0x0,0x2029df(%rip)        # 604508 <is_checker>
  401b29:	74 68                	je     401b93 <validate+0x74>
  401b2b:	39 3d cb 29 20 00    	cmp    %edi,0x2029cb(%rip)        # 6044fc <vlevel>
  401b31:	75 2d                	jne    401b60 <validate+0x41>
  401b33:	8b 35 bf 29 20 00    	mov    0x2029bf(%rip),%esi        # 6044f8 <check_level>
  401b39:	39 f7                	cmp    %esi,%edi
  401b3b:	75 39                	jne    401b76 <validate+0x57>
  401b3d:	0f be 35 e4 35 20 00 	movsbl 0x2035e4(%rip),%esi        # 605128 <target_prefix>
  401b44:	48 8d 0d d5 29 20 00 	lea    0x2029d5(%rip),%rcx        # 604520 <gets_buf>
  401b4b:	89 fa                	mov    %edi,%edx
  401b4d:	48 8d 3d d4 14 00 00 	lea    0x14d4(%rip),%rdi        # 403028 <_IO_stdin_used+0x458>
  401b54:	b8 00 00 00 00       	mov    $0x0,%eax
  401b59:	e8 02 f1 ff ff       	callq  400c60 <printf@plt>
  401b5e:	5b                   	pop    %rbx
  401b5f:	c3                   	retq   
  401b60:	48 8d 3d a3 14 00 00 	lea    0x14a3(%rip),%rdi        # 40300a <_IO_stdin_used+0x43a>
  401b67:	e8 c4 f0 ff ff       	callq  400c30 <puts@plt>
  401b6c:	b8 00 00 00 00       	mov    $0x0,%eax
  401b71:	e8 5f fd ff ff       	callq  4018d5 <check_fail>
  401b76:	89 fa                	mov    %edi,%edx
  401b78:	48 8d 3d c9 15 00 00 	lea    0x15c9(%rip),%rdi        # 403148 <_IO_stdin_used+0x578>
  401b7f:	b8 00 00 00 00       	mov    $0x0,%eax
  401b84:	e8 d7 f0 ff ff       	callq  400c60 <printf@plt>
  401b89:	b8 00 00 00 00       	mov    $0x0,%eax
  401b8e:	e8 42 fd ff ff       	callq  4018d5 <check_fail>
  401b93:	3b 3d 63 29 20 00    	cmp    0x202963(%rip),%edi        # 6044fc <vlevel>
  401b99:	74 1a                	je     401bb5 <validate+0x96>
  401b9b:	48 8d 3d 68 14 00 00 	lea    0x1468(%rip),%rdi        # 40300a <_IO_stdin_used+0x43a>
  401ba2:	e8 89 f0 ff ff       	callq  400c30 <puts@plt>
  401ba7:	89 de                	mov    %ebx,%esi
  401ba9:	bf 00 00 00 00       	mov    $0x0,%edi
  401bae:	e8 a7 fd ff ff       	callq  40195a <notify_server>
  401bb3:	eb a9                	jmp    401b5e <validate+0x3f>
  401bb5:	0f be 15 6c 35 20 00 	movsbl 0x20356c(%rip),%edx        # 605128 <target_prefix>
  401bbc:	89 fe                	mov    %edi,%esi
  401bbe:	48 8d 3d ab 15 00 00 	lea    0x15ab(%rip),%rdi        # 403170 <_IO_stdin_used+0x5a0>
  401bc5:	b8 00 00 00 00       	mov    $0x0,%eax
  401bca:	e8 91 f0 ff ff       	callq  400c60 <printf@plt>
  401bcf:	89 de                	mov    %ebx,%esi
  401bd1:	bf 01 00 00 00       	mov    $0x1,%edi
  401bd6:	e8 7f fd ff ff       	callq  40195a <notify_server>
  401bdb:	eb 81                	jmp    401b5e <validate+0x3f>

0000000000401bdd <fail>:
  401bdd:	48 83 ec 08          	sub    $0x8,%rsp
  401be1:	83 3d 20 29 20 00 00 	cmpl   $0x0,0x202920(%rip)        # 604508 <is_checker>
  401be8:	75 11                	jne    401bfb <fail+0x1e>
  401bea:	89 fe                	mov    %edi,%esi
  401bec:	bf 00 00 00 00       	mov    $0x0,%edi
  401bf1:	e8 64 fd ff ff       	callq  40195a <notify_server>
  401bf6:	48 83 c4 08          	add    $0x8,%rsp
  401bfa:	c3                   	retq   
  401bfb:	b8 00 00 00 00       	mov    $0x0,%eax
  401c00:	e8 d0 fc ff ff       	callq  4018d5 <check_fail>

0000000000401c05 <bushandler>:
  401c05:	48 83 ec 08          	sub    $0x8,%rsp
  401c09:	83 3d f8 28 20 00 00 	cmpl   $0x0,0x2028f8(%rip)        # 604508 <is_checker>
  401c10:	74 16                	je     401c28 <bushandler+0x23>
  401c12:	48 8d 3d 24 14 00 00 	lea    0x1424(%rip),%rdi        # 40303d <_IO_stdin_used+0x46d>
  401c19:	e8 12 f0 ff ff       	callq  400c30 <puts@plt>
  401c1e:	b8 00 00 00 00       	mov    $0x0,%eax
  401c23:	e8 ad fc ff ff       	callq  4018d5 <check_fail>
  401c28:	48 8d 3d 79 15 00 00 	lea    0x1579(%rip),%rdi        # 4031a8 <_IO_stdin_used+0x5d8>
  401c2f:	e8 fc ef ff ff       	callq  400c30 <puts@plt>
  401c34:	48 8d 3d 0c 14 00 00 	lea    0x140c(%rip),%rdi        # 403047 <_IO_stdin_used+0x477>
  401c3b:	e8 f0 ef ff ff       	callq  400c30 <puts@plt>
  401c40:	be 00 00 00 00       	mov    $0x0,%esi
  401c45:	bf 00 00 00 00       	mov    $0x0,%edi
  401c4a:	e8 0b fd ff ff       	callq  40195a <notify_server>
  401c4f:	bf 01 00 00 00       	mov    $0x1,%edi
  401c54:	e8 57 f1 ff ff       	callq  400db0 <exit@plt>

0000000000401c59 <seghandler>:
  401c59:	48 83 ec 08          	sub    $0x8,%rsp
  401c5d:	83 3d a4 28 20 00 00 	cmpl   $0x0,0x2028a4(%rip)        # 604508 <is_checker>
  401c64:	74 16                	je     401c7c <seghandler+0x23>
  401c66:	48 8d 3d f0 13 00 00 	lea    0x13f0(%rip),%rdi        # 40305d <_IO_stdin_used+0x48d>
  401c6d:	e8 be ef ff ff       	callq  400c30 <puts@plt>
  401c72:	b8 00 00 00 00       	mov    $0x0,%eax
  401c77:	e8 59 fc ff ff       	callq  4018d5 <check_fail>
  401c7c:	48 8d 3d 45 15 00 00 	lea    0x1545(%rip),%rdi        # 4031c8 <_IO_stdin_used+0x5f8>
  401c83:	e8 a8 ef ff ff       	callq  400c30 <puts@plt>
  401c88:	48 8d 3d b8 13 00 00 	lea    0x13b8(%rip),%rdi        # 403047 <_IO_stdin_used+0x477>
  401c8f:	e8 9c ef ff ff       	callq  400c30 <puts@plt>
  401c94:	be 00 00 00 00       	mov    $0x0,%esi
  401c99:	bf 00 00 00 00       	mov    $0x0,%edi
  401c9e:	e8 b7 fc ff ff       	callq  40195a <notify_server>
  401ca3:	bf 01 00 00 00       	mov    $0x1,%edi
  401ca8:	e8 03 f1 ff ff       	callq  400db0 <exit@plt>

0000000000401cad <illegalhandler>:
  401cad:	48 83 ec 08          	sub    $0x8,%rsp
  401cb1:	83 3d 50 28 20 00 00 	cmpl   $0x0,0x202850(%rip)        # 604508 <is_checker>
  401cb8:	74 16                	je     401cd0 <illegalhandler+0x23>
  401cba:	48 8d 3d af 13 00 00 	lea    0x13af(%rip),%rdi        # 403070 <_IO_stdin_used+0x4a0>
  401cc1:	e8 6a ef ff ff       	callq  400c30 <puts@plt>
  401cc6:	b8 00 00 00 00       	mov    $0x0,%eax
  401ccb:	e8 05 fc ff ff       	callq  4018d5 <check_fail>
  401cd0:	48 8d 3d 19 15 00 00 	lea    0x1519(%rip),%rdi        # 4031f0 <_IO_stdin_used+0x620>
  401cd7:	e8 54 ef ff ff       	callq  400c30 <puts@plt>
  401cdc:	48 8d 3d 64 13 00 00 	lea    0x1364(%rip),%rdi        # 403047 <_IO_stdin_used+0x477>
  401ce3:	e8 48 ef ff ff       	callq  400c30 <puts@plt>
  401ce8:	be 00 00 00 00       	mov    $0x0,%esi
  401ced:	bf 00 00 00 00       	mov    $0x0,%edi
  401cf2:	e8 63 fc ff ff       	callq  40195a <notify_server>
  401cf7:	bf 01 00 00 00       	mov    $0x1,%edi
  401cfc:	e8 af f0 ff ff       	callq  400db0 <exit@plt>

0000000000401d01 <sigalrmhandler>:
  401d01:	48 83 ec 08          	sub    $0x8,%rsp
  401d05:	83 3d fc 27 20 00 00 	cmpl   $0x0,0x2027fc(%rip)        # 604508 <is_checker>
  401d0c:	74 16                	je     401d24 <sigalrmhandler+0x23>
  401d0e:	48 8d 3d 6f 13 00 00 	lea    0x136f(%rip),%rdi        # 403084 <_IO_stdin_used+0x4b4>
  401d15:	e8 16 ef ff ff       	callq  400c30 <puts@plt>
  401d1a:	b8 00 00 00 00       	mov    $0x0,%eax
  401d1f:	e8 b1 fb ff ff       	callq  4018d5 <check_fail>
  401d24:	be 05 00 00 00       	mov    $0x5,%esi
  401d29:	48 8d 3d f0 14 00 00 	lea    0x14f0(%rip),%rdi        # 403220 <_IO_stdin_used+0x650>
  401d30:	b8 00 00 00 00       	mov    $0x0,%eax
  401d35:	e8 26 ef ff ff       	callq  400c60 <printf@plt>
  401d3a:	be 00 00 00 00       	mov    $0x0,%esi
  401d3f:	bf 00 00 00 00       	mov    $0x0,%edi
  401d44:	e8 11 fc ff ff       	callq  40195a <notify_server>
  401d49:	bf 01 00 00 00       	mov    $0x1,%edi
  401d4e:	e8 5d f0 ff ff       	callq  400db0 <exit@plt>

0000000000401d53 <launch>:
  401d53:	55                   	push   %rbp
  401d54:	48 89 e5             	mov    %rsp,%rbp
  401d57:	48 89 fa             	mov    %rdi,%rdx
  401d5a:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401d5e:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401d62:	48 29 c4             	sub    %rax,%rsp
  401d65:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401d6a:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401d6e:	be f4 00 00 00       	mov    $0xf4,%esi
  401d73:	e8 f8 ee ff ff       	callq  400c70 <memset@plt>
  401d78:	48 8b 05 21 27 20 00 	mov    0x202721(%rip),%rax        # 6044a0 <stdin@@GLIBC_2.2.5>
  401d7f:	48 39 05 6a 27 20 00 	cmp    %rax,0x20276a(%rip)        # 6044f0 <infile>
  401d86:	74 2b                	je     401db3 <launch+0x60>
  401d88:	c7 05 6a 27 20 00 00 	movl   $0x0,0x20276a(%rip)        # 6044fc <vlevel>
  401d8f:	00 00 00 
  401d92:	b8 00 00 00 00       	mov    $0x0,%eax
  401d97:	e8 a3 fa ff ff       	callq  40183f <test>
  401d9c:	83 3d 65 27 20 00 00 	cmpl   $0x0,0x202765(%rip)        # 604508 <is_checker>
  401da3:	75 21                	jne    401dc6 <launch+0x73>
  401da5:	48 8d 3d f8 12 00 00 	lea    0x12f8(%rip),%rdi        # 4030a4 <_IO_stdin_used+0x4d4>
  401dac:	e8 7f ee ff ff       	callq  400c30 <puts@plt>
  401db1:	c9                   	leaveq 
  401db2:	c3                   	retq   
  401db3:	48 8d 3d d2 12 00 00 	lea    0x12d2(%rip),%rdi        # 40308c <_IO_stdin_used+0x4bc>
  401dba:	b8 00 00 00 00       	mov    $0x0,%eax
  401dbf:	e8 9c ee ff ff       	callq  400c60 <printf@plt>
  401dc4:	eb c2                	jmp    401d88 <launch+0x35>
  401dc6:	48 8d 3d cc 12 00 00 	lea    0x12cc(%rip),%rdi        # 403099 <_IO_stdin_used+0x4c9>
  401dcd:	e8 5e ee ff ff       	callq  400c30 <puts@plt>
  401dd2:	b8 00 00 00 00       	mov    $0x0,%eax
  401dd7:	e8 f9 fa ff ff       	callq  4018d5 <check_fail>

0000000000401ddc <stable_launch>:
  401ddc:	53                   	push   %rbx
  401ddd:	48 89 3d 04 27 20 00 	mov    %rdi,0x202704(%rip)        # 6044e8 <global_offset>
  401de4:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401dea:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401df0:	b9 32 01 00 00       	mov    $0x132,%ecx
  401df5:	ba 07 00 00 00       	mov    $0x7,%edx
  401dfa:	be 00 00 10 00       	mov    $0x100000,%esi
  401dff:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401e04:	e8 47 ee ff ff       	callq  400c50 <mmap@plt>
  401e09:	48 89 c3             	mov    %rax,%rbx
  401e0c:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  401e12:	75 43                	jne    401e57 <stable_launch+0x7b>
  401e14:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  401e1b:	48 89 15 0e 33 20 00 	mov    %rdx,0x20330e(%rip)        # 605130 <stack_top>
  401e22:	48 89 e0             	mov    %rsp,%rax
  401e25:	48 89 d4             	mov    %rdx,%rsp
  401e28:	48 89 c2             	mov    %rax,%rdx
  401e2b:	48 89 15 ae 26 20 00 	mov    %rdx,0x2026ae(%rip)        # 6044e0 <global_save_stack>
  401e32:	48 8b 3d af 26 20 00 	mov    0x2026af(%rip),%rdi        # 6044e8 <global_offset>
  401e39:	e8 15 ff ff ff       	callq  401d53 <launch>
  401e3e:	48 8b 05 9b 26 20 00 	mov    0x20269b(%rip),%rax        # 6044e0 <global_save_stack>
  401e45:	48 89 c4             	mov    %rax,%rsp
  401e48:	be 00 00 10 00       	mov    $0x100000,%esi
  401e4d:	48 89 df             	mov    %rbx,%rdi
  401e50:	e8 eb ee ff ff       	callq  400d40 <munmap@plt>
  401e55:	5b                   	pop    %rbx
  401e56:	c3                   	retq   
  401e57:	be 00 00 10 00       	mov    $0x100000,%esi
  401e5c:	48 89 c7             	mov    %rax,%rdi
  401e5f:	e8 dc ee ff ff       	callq  400d40 <munmap@plt>
  401e64:	ba 00 60 58 55       	mov    $0x55586000,%edx
  401e69:	48 8d 35 e8 13 00 00 	lea    0x13e8(%rip),%rsi        # 403258 <_IO_stdin_used+0x688>
  401e70:	48 8b 3d 49 26 20 00 	mov    0x202649(%rip),%rdi        # 6044c0 <stderr@@GLIBC_2.2.5>
  401e77:	b8 00 00 00 00       	mov    $0x0,%eax
  401e7c:	e8 4f ee ff ff       	callq  400cd0 <fprintf@plt>
  401e81:	bf 01 00 00 00       	mov    $0x1,%edi
  401e86:	e8 25 ef ff ff       	callq  400db0 <exit@plt>

0000000000401e8b <rio_readinitb>:
  401e8b:	89 37                	mov    %esi,(%rdi)
  401e8d:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  401e94:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401e98:	48 89 47 08          	mov    %rax,0x8(%rdi)
  401e9c:	c3                   	retq   

0000000000401e9d <sigalrm_handler>:
  401e9d:	48 83 ec 08          	sub    $0x8,%rsp
  401ea1:	ba 00 00 00 00       	mov    $0x0,%edx
  401ea6:	48 8d 35 e3 13 00 00 	lea    0x13e3(%rip),%rsi        # 403290 <trans_char+0x10>
  401ead:	48 8b 3d 0c 26 20 00 	mov    0x20260c(%rip),%rdi        # 6044c0 <stderr@@GLIBC_2.2.5>
  401eb4:	b8 00 00 00 00       	mov    $0x0,%eax
  401eb9:	e8 12 ee ff ff       	callq  400cd0 <fprintf@plt>
  401ebe:	bf 01 00 00 00       	mov    $0x1,%edi
  401ec3:	e8 e8 ee ff ff       	callq  400db0 <exit@plt>

0000000000401ec8 <urlencode>:
  401ec8:	41 54                	push   %r12
  401eca:	55                   	push   %rbp
  401ecb:	53                   	push   %rbx
  401ecc:	48 83 ec 10          	sub    $0x10,%rsp
  401ed0:	48 89 fb             	mov    %rdi,%rbx
  401ed3:	48 89 f5             	mov    %rsi,%rbp
  401ed6:	b8 00 00 00 00       	mov    $0x0,%eax
  401edb:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401ee2:	f2 ae                	repnz scas %es:(%rdi),%al
  401ee4:	48 f7 d1             	not    %rcx
  401ee7:	8d 41 ff             	lea    -0x1(%rcx),%eax
  401eea:	eb 0e                	jmp    401efa <urlencode+0x32>
  401eec:	88 55 00             	mov    %dl,0x0(%rbp)
  401eef:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401ef3:	48 83 c3 01          	add    $0x1,%rbx
  401ef7:	44 89 e0             	mov    %r12d,%eax
  401efa:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  401efe:	85 c0                	test   %eax,%eax
  401f00:	0f 84 95 00 00 00    	je     401f9b <urlencode+0xd3>
  401f06:	0f b6 13             	movzbl (%rbx),%edx
  401f09:	80 fa 2a             	cmp    $0x2a,%dl
  401f0c:	0f 94 c1             	sete   %cl
  401f0f:	80 fa 2d             	cmp    $0x2d,%dl
  401f12:	0f 94 c0             	sete   %al
  401f15:	08 c1                	or     %al,%cl
  401f17:	75 d3                	jne    401eec <urlencode+0x24>
  401f19:	80 fa 2e             	cmp    $0x2e,%dl
  401f1c:	74 ce                	je     401eec <urlencode+0x24>
  401f1e:	80 fa 5f             	cmp    $0x5f,%dl
  401f21:	74 c9                	je     401eec <urlencode+0x24>
  401f23:	8d 42 d0             	lea    -0x30(%rdx),%eax
  401f26:	3c 09                	cmp    $0x9,%al
  401f28:	76 c2                	jbe    401eec <urlencode+0x24>
  401f2a:	8d 42 bf             	lea    -0x41(%rdx),%eax
  401f2d:	3c 19                	cmp    $0x19,%al
  401f2f:	76 bb                	jbe    401eec <urlencode+0x24>
  401f31:	8d 42 9f             	lea    -0x61(%rdx),%eax
  401f34:	3c 19                	cmp    $0x19,%al
  401f36:	76 b4                	jbe    401eec <urlencode+0x24>
  401f38:	80 fa 20             	cmp    $0x20,%dl
  401f3b:	74 4c                	je     401f89 <urlencode+0xc1>
  401f3d:	8d 42 e0             	lea    -0x20(%rdx),%eax
  401f40:	3c 5f                	cmp    $0x5f,%al
  401f42:	0f 96 c1             	setbe  %cl
  401f45:	80 fa 09             	cmp    $0x9,%dl
  401f48:	0f 94 c0             	sete   %al
  401f4b:	08 c1                	or     %al,%cl
  401f4d:	74 47                	je     401f96 <urlencode+0xce>
  401f4f:	0f b6 d2             	movzbl %dl,%edx
  401f52:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  401f57:	48 8d 35 ca 13 00 00 	lea    0x13ca(%rip),%rsi        # 403328 <trans_char+0xa8>
  401f5e:	b8 00 00 00 00       	mov    $0x0,%eax
  401f63:	e8 38 ee ff ff       	callq  400da0 <sprintf@plt>
  401f68:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
  401f6d:	88 45 00             	mov    %al,0x0(%rbp)
  401f70:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
  401f75:	88 45 01             	mov    %al,0x1(%rbp)
  401f78:	0f b6 44 24 0a       	movzbl 0xa(%rsp),%eax
  401f7d:	88 45 02             	mov    %al,0x2(%rbp)
  401f80:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  401f84:	e9 6a ff ff ff       	jmpq   401ef3 <urlencode+0x2b>
  401f89:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  401f8d:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401f91:	e9 5d ff ff ff       	jmpq   401ef3 <urlencode+0x2b>
  401f96:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f9b:	48 83 c4 10          	add    $0x10,%rsp
  401f9f:	5b                   	pop    %rbx
  401fa0:	5d                   	pop    %rbp
  401fa1:	41 5c                	pop    %r12
  401fa3:	c3                   	retq   

0000000000401fa4 <rio_writen>:
  401fa4:	41 55                	push   %r13
  401fa6:	41 54                	push   %r12
  401fa8:	55                   	push   %rbp
  401fa9:	53                   	push   %rbx
  401faa:	48 83 ec 08          	sub    $0x8,%rsp
  401fae:	41 89 fc             	mov    %edi,%r12d
  401fb1:	49 89 d5             	mov    %rdx,%r13
  401fb4:	48 89 f5             	mov    %rsi,%rbp
  401fb7:	48 89 d3             	mov    %rdx,%rbx
  401fba:	eb 06                	jmp    401fc2 <rio_writen+0x1e>
  401fbc:	48 29 c3             	sub    %rax,%rbx
  401fbf:	48 01 c5             	add    %rax,%rbp
  401fc2:	48 85 db             	test   %rbx,%rbx
  401fc5:	74 24                	je     401feb <rio_writen+0x47>
  401fc7:	48 89 da             	mov    %rbx,%rdx
  401fca:	48 89 ee             	mov    %rbp,%rsi
  401fcd:	44 89 e7             	mov    %r12d,%edi
  401fd0:	e8 6b ec ff ff       	callq  400c40 <write@plt>
  401fd5:	48 85 c0             	test   %rax,%rax
  401fd8:	7f e2                	jg     401fbc <rio_writen+0x18>
  401fda:	e8 11 ec ff ff       	callq  400bf0 <__errno_location@plt>
  401fdf:	83 38 04             	cmpl   $0x4,(%rax)
  401fe2:	75 15                	jne    401ff9 <rio_writen+0x55>
  401fe4:	b8 00 00 00 00       	mov    $0x0,%eax
  401fe9:	eb d1                	jmp    401fbc <rio_writen+0x18>
  401feb:	4c 89 e8             	mov    %r13,%rax
  401fee:	48 83 c4 08          	add    $0x8,%rsp
  401ff2:	5b                   	pop    %rbx
  401ff3:	5d                   	pop    %rbp
  401ff4:	41 5c                	pop    %r12
  401ff6:	41 5d                	pop    %r13
  401ff8:	c3                   	retq   
  401ff9:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402000:	eb ec                	jmp    401fee <rio_writen+0x4a>

0000000000402002 <rio_read>:
  402002:	41 55                	push   %r13
  402004:	41 54                	push   %r12
  402006:	55                   	push   %rbp
  402007:	53                   	push   %rbx
  402008:	48 83 ec 08          	sub    $0x8,%rsp
  40200c:	48 89 fb             	mov    %rdi,%rbx
  40200f:	49 89 f5             	mov    %rsi,%r13
  402012:	49 89 d4             	mov    %rdx,%r12
  402015:	eb 0a                	jmp    402021 <rio_read+0x1f>
  402017:	e8 d4 eb ff ff       	callq  400bf0 <__errno_location@plt>
  40201c:	83 38 04             	cmpl   $0x4,(%rax)
  40201f:	75 5c                	jne    40207d <rio_read+0x7b>
  402021:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402024:	85 ed                	test   %ebp,%ebp
  402026:	7f 24                	jg     40204c <rio_read+0x4a>
  402028:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  40202c:	ba 00 20 00 00       	mov    $0x2000,%edx
  402031:	48 89 ee             	mov    %rbp,%rsi
  402034:	8b 3b                	mov    (%rbx),%edi
  402036:	e8 65 ec ff ff       	callq  400ca0 <read@plt>
  40203b:	89 43 04             	mov    %eax,0x4(%rbx)
  40203e:	85 c0                	test   %eax,%eax
  402040:	78 d5                	js     402017 <rio_read+0x15>
  402042:	85 c0                	test   %eax,%eax
  402044:	74 40                	je     402086 <rio_read+0x84>
  402046:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  40204a:	eb d5                	jmp    402021 <rio_read+0x1f>
  40204c:	89 e8                	mov    %ebp,%eax
  40204e:	49 39 c4             	cmp    %rax,%r12
  402051:	77 03                	ja     402056 <rio_read+0x54>
  402053:	44 89 e5             	mov    %r12d,%ebp
  402056:	4c 63 e5             	movslq %ebp,%r12
  402059:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  40205d:	4c 89 e2             	mov    %r12,%rdx
  402060:	4c 89 ef             	mov    %r13,%rdi
  402063:	e8 88 ec ff ff       	callq  400cf0 <memcpy@plt>
  402068:	4c 01 63 08          	add    %r12,0x8(%rbx)
  40206c:	29 6b 04             	sub    %ebp,0x4(%rbx)
  40206f:	4c 89 e0             	mov    %r12,%rax
  402072:	48 83 c4 08          	add    $0x8,%rsp
  402076:	5b                   	pop    %rbx
  402077:	5d                   	pop    %rbp
  402078:	41 5c                	pop    %r12
  40207a:	41 5d                	pop    %r13
  40207c:	c3                   	retq   
  40207d:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402084:	eb ec                	jmp    402072 <rio_read+0x70>
  402086:	b8 00 00 00 00       	mov    $0x0,%eax
  40208b:	eb e5                	jmp    402072 <rio_read+0x70>

000000000040208d <rio_readlineb>:
  40208d:	41 55                	push   %r13
  40208f:	41 54                	push   %r12
  402091:	55                   	push   %rbp
  402092:	53                   	push   %rbx
  402093:	48 83 ec 18          	sub    $0x18,%rsp
  402097:	49 89 fd             	mov    %rdi,%r13
  40209a:	49 89 d4             	mov    %rdx,%r12
  40209d:	48 89 f5             	mov    %rsi,%rbp
  4020a0:	bb 01 00 00 00       	mov    $0x1,%ebx
  4020a5:	4c 39 e3             	cmp    %r12,%rbx
  4020a8:	73 47                	jae    4020f1 <rio_readlineb+0x64>
  4020aa:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  4020af:	ba 01 00 00 00       	mov    $0x1,%edx
  4020b4:	4c 89 ef             	mov    %r13,%rdi
  4020b7:	e8 46 ff ff ff       	callq  402002 <rio_read>
  4020bc:	83 f8 01             	cmp    $0x1,%eax
  4020bf:	75 1c                	jne    4020dd <rio_readlineb+0x50>
  4020c1:	48 8d 45 01          	lea    0x1(%rbp),%rax
  4020c5:	0f b6 54 24 0f       	movzbl 0xf(%rsp),%edx
  4020ca:	88 55 00             	mov    %dl,0x0(%rbp)
  4020cd:	80 7c 24 0f 0a       	cmpb   $0xa,0xf(%rsp)
  4020d2:	74 1a                	je     4020ee <rio_readlineb+0x61>
  4020d4:	48 83 c3 01          	add    $0x1,%rbx
  4020d8:	48 89 c5             	mov    %rax,%rbp
  4020db:	eb c8                	jmp    4020a5 <rio_readlineb+0x18>
  4020dd:	85 c0                	test   %eax,%eax
  4020df:	75 22                	jne    402103 <rio_readlineb+0x76>
  4020e1:	48 83 fb 01          	cmp    $0x1,%rbx
  4020e5:	75 0a                	jne    4020f1 <rio_readlineb+0x64>
  4020e7:	b8 00 00 00 00       	mov    $0x0,%eax
  4020ec:	eb 0a                	jmp    4020f8 <rio_readlineb+0x6b>
  4020ee:	48 89 c5             	mov    %rax,%rbp
  4020f1:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  4020f5:	48 89 d8             	mov    %rbx,%rax
  4020f8:	48 83 c4 18          	add    $0x18,%rsp
  4020fc:	5b                   	pop    %rbx
  4020fd:	5d                   	pop    %rbp
  4020fe:	41 5c                	pop    %r12
  402100:	41 5d                	pop    %r13
  402102:	c3                   	retq   
  402103:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40210a:	eb ec                	jmp    4020f8 <rio_readlineb+0x6b>

000000000040210c <submitr>:
  40210c:	41 57                	push   %r15
  40210e:	41 56                	push   %r14
  402110:	41 55                	push   %r13
  402112:	41 54                	push   %r12
  402114:	55                   	push   %rbp
  402115:	53                   	push   %rbx
  402116:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  40211d:	49 89 fd             	mov    %rdi,%r13
  402120:	89 74 24 14          	mov    %esi,0x14(%rsp)
  402124:	49 89 d7             	mov    %rdx,%r15
  402127:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  40212c:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  402131:	4d 89 ce             	mov    %r9,%r14
  402134:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  40213b:	00 
  40213c:	c7 84 24 2c 20 00 00 	movl   $0x0,0x202c(%rsp)
  402143:	00 00 00 00 
  402147:	ba 00 00 00 00       	mov    $0x0,%edx
  40214c:	be 01 00 00 00       	mov    $0x1,%esi
  402151:	bf 02 00 00 00       	mov    $0x2,%edi
  402156:	e8 75 ec ff ff       	callq  400dd0 <socket@plt>
  40215b:	85 c0                	test   %eax,%eax
  40215d:	0f 88 ca 01 00 00    	js     40232d <submitr+0x221>
  402163:	89 c5                	mov    %eax,%ebp
  402165:	4c 89 ef             	mov    %r13,%rdi
  402168:	e8 53 eb ff ff       	callq  400cc0 <gethostbyname@plt>
  40216d:	48 85 c0             	test   %rax,%rax
  402170:	0f 84 05 02 00 00    	je     40237b <submitr+0x26f>
  402176:	4c 8d a4 24 40 a0 00 	lea    0xa040(%rsp),%r12
  40217d:	00 
  40217e:	48 c7 84 24 40 a0 00 	movq   $0x0,0xa040(%rsp)
  402185:	00 00 00 00 00 
  40218a:	48 c7 84 24 48 a0 00 	movq   $0x0,0xa048(%rsp)
  402191:	00 00 00 00 00 
  402196:	66 c7 84 24 40 a0 00 	movw   $0x2,0xa040(%rsp)
  40219d:	00 02 00 
  4021a0:	48 8b 48 18          	mov    0x18(%rax),%rcx
  4021a4:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4021a8:	48 8d b4 24 44 a0 00 	lea    0xa044(%rsp),%rsi
  4021af:	00 
  4021b0:	48 8b 39             	mov    (%rcx),%rdi
  4021b3:	e8 98 eb ff ff       	callq  400d50 <bcopy@plt>
  4021b8:	0f b7 44 24 14       	movzwl 0x14(%rsp),%eax
  4021bd:	66 c1 c8 08          	ror    $0x8,%ax
  4021c1:	66 89 84 24 42 a0 00 	mov    %ax,0xa042(%rsp)
  4021c8:	00 
  4021c9:	ba 10 00 00 00       	mov    $0x10,%edx
  4021ce:	4c 89 e6             	mov    %r12,%rsi
  4021d1:	89 ef                	mov    %ebp,%edi
  4021d3:	e8 e8 eb ff ff       	callq  400dc0 <connect@plt>
  4021d8:	85 c0                	test   %eax,%eax
  4021da:	0f 88 02 02 00 00    	js     4023e2 <submitr+0x2d6>
  4021e0:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  4021e7:	b8 00 00 00 00       	mov    $0x0,%eax
  4021ec:	48 89 f1             	mov    %rsi,%rcx
  4021ef:	4c 89 f7             	mov    %r14,%rdi
  4021f2:	f2 ae                	repnz scas %es:(%rdi),%al
  4021f4:	48 f7 d1             	not    %rcx
  4021f7:	48 89 ca             	mov    %rcx,%rdx
  4021fa:	48 89 f1             	mov    %rsi,%rcx
  4021fd:	4c 89 ff             	mov    %r15,%rdi
  402200:	f2 ae                	repnz scas %es:(%rdi),%al
  402202:	48 f7 d1             	not    %rcx
  402205:	49 89 c8             	mov    %rcx,%r8
  402208:	48 89 f1             	mov    %rsi,%rcx
  40220b:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402210:	f2 ae                	repnz scas %es:(%rdi),%al
  402212:	48 f7 d1             	not    %rcx
  402215:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  40221a:	48 89 f1             	mov    %rsi,%rcx
  40221d:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  402222:	f2 ae                	repnz scas %es:(%rdi),%al
  402224:	48 89 c8             	mov    %rcx,%rax
  402227:	48 f7 d0             	not    %rax
  40222a:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  40222f:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  402234:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  40223b:	00 
  40223c:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  402242:	0f 87 f3 01 00 00    	ja     40243b <submitr+0x32f>
  402248:	48 8d b4 24 30 40 00 	lea    0x4030(%rsp),%rsi
  40224f:	00 
  402250:	b9 00 04 00 00       	mov    $0x400,%ecx
  402255:	b8 00 00 00 00       	mov    $0x0,%eax
  40225a:	48 89 f7             	mov    %rsi,%rdi
  40225d:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402260:	4c 89 f7             	mov    %r14,%rdi
  402263:	e8 60 fc ff ff       	callq  401ec8 <urlencode>
  402268:	85 c0                	test   %eax,%eax
  40226a:	0f 88 3d 02 00 00    	js     4024ad <submitr+0x3a1>
  402270:	4c 8d a4 24 30 60 00 	lea    0x6030(%rsp),%r12
  402277:	00 
  402278:	4d 89 e9             	mov    %r13,%r9
  40227b:	4c 8d 84 24 30 40 00 	lea    0x4030(%rsp),%r8
  402282:	00 
  402283:	4c 89 f9             	mov    %r15,%rcx
  402286:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  40228b:	48 8d 35 26 10 00 00 	lea    0x1026(%rip),%rsi        # 4032b8 <trans_char+0x38>
  402292:	4c 89 e7             	mov    %r12,%rdi
  402295:	b8 00 00 00 00       	mov    $0x0,%eax
  40229a:	e8 01 eb ff ff       	callq  400da0 <sprintf@plt>
  40229f:	b8 00 00 00 00       	mov    $0x0,%eax
  4022a4:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4022ab:	4c 89 e7             	mov    %r12,%rdi
  4022ae:	f2 ae                	repnz scas %es:(%rdi),%al
  4022b0:	48 f7 d1             	not    %rcx
  4022b3:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  4022b7:	4c 89 e6             	mov    %r12,%rsi
  4022ba:	89 ef                	mov    %ebp,%edi
  4022bc:	e8 e3 fc ff ff       	callq  401fa4 <rio_writen>
  4022c1:	48 85 c0             	test   %rax,%rax
  4022c4:	0f 88 6d 02 00 00    	js     402537 <submitr+0x42b>
  4022ca:	4c 8d a4 24 30 80 00 	lea    0x8030(%rsp),%r12
  4022d1:	00 
  4022d2:	89 ee                	mov    %ebp,%esi
  4022d4:	4c 89 e7             	mov    %r12,%rdi
  4022d7:	e8 af fb ff ff       	callq  401e8b <rio_readinitb>
  4022dc:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  4022e3:	00 
  4022e4:	ba 00 20 00 00       	mov    $0x2000,%edx
  4022e9:	4c 89 e7             	mov    %r12,%rdi
  4022ec:	e8 9c fd ff ff       	callq  40208d <rio_readlineb>
  4022f1:	48 85 c0             	test   %rax,%rax
  4022f4:	0f 8e ab 02 00 00    	jle    4025a5 <submitr+0x499>
  4022fa:	48 8d 8c 24 2c 20 00 	lea    0x202c(%rsp),%rcx
  402301:	00 
  402302:	48 8d 94 24 30 20 00 	lea    0x2030(%rsp),%rdx
  402309:	00 
  40230a:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  402311:	00 
  402312:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  402317:	48 8d 35 11 10 00 00 	lea    0x1011(%rip),%rsi        # 40332f <trans_char+0xaf>
  40231e:	b8 00 00 00 00       	mov    $0x0,%eax
  402323:	e8 08 ea ff ff       	callq  400d30 <__isoc99_sscanf@plt>
  402328:	e9 9f 03 00 00       	jmpq   4026cc <submitr+0x5c0>
  40232d:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402334:	3a 20 43 
  402337:	48 89 03             	mov    %rax,(%rbx)
  40233a:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402341:	20 75 6e 
  402344:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402348:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40234f:	74 6f 20 
  402352:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402356:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  40235d:	65 20 73 
  402360:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402364:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  40236b:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  402371:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402376:	e9 18 03 00 00       	jmpq   402693 <submitr+0x587>
  40237b:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402382:	3a 20 44 
  402385:	48 89 03             	mov    %rax,(%rbx)
  402388:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  40238f:	20 75 6e 
  402392:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402396:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40239d:	74 6f 20 
  4023a0:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4023a4:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4023ab:	76 65 20 
  4023ae:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4023b2:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4023b9:	72 20 61 
  4023bc:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4023c0:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  4023c7:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  4023cd:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  4023d1:	89 ef                	mov    %ebp,%edi
  4023d3:	e8 b8 e8 ff ff       	callq  400c90 <close@plt>
  4023d8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023dd:	e9 b1 02 00 00       	jmpq   402693 <submitr+0x587>
  4023e2:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  4023e9:	3a 20 55 
  4023ec:	48 89 03             	mov    %rax,(%rbx)
  4023ef:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  4023f6:	20 74 6f 
  4023f9:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4023fd:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402404:	65 63 74 
  402407:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40240b:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  402412:	68 65 20 
  402415:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402419:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  402420:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  402426:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  40242a:	89 ef                	mov    %ebp,%edi
  40242c:	e8 5f e8 ff ff       	callq  400c90 <close@plt>
  402431:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402436:	e9 58 02 00 00       	jmpq   402693 <submitr+0x587>
  40243b:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402442:	3a 20 52 
  402445:	48 89 03             	mov    %rax,(%rbx)
  402448:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  40244f:	20 73 74 
  402452:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402456:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  40245d:	74 6f 6f 
  402460:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402464:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  40246b:	65 2e 20 
  40246e:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402472:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  402479:	61 73 65 
  40247c:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402480:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  402487:	49 54 52 
  40248a:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40248e:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  402495:	55 46 00 
  402498:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40249c:	89 ef                	mov    %ebp,%edi
  40249e:	e8 ed e7 ff ff       	callq  400c90 <close@plt>
  4024a3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024a8:	e9 e6 01 00 00       	jmpq   402693 <submitr+0x587>
  4024ad:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4024b4:	3a 20 52 
  4024b7:	48 89 03             	mov    %rax,(%rbx)
  4024ba:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4024c1:	20 73 74 
  4024c4:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4024c8:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4024cf:	63 6f 6e 
  4024d2:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4024d6:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4024dd:	20 61 6e 
  4024e0:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4024e4:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4024eb:	67 61 6c 
  4024ee:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4024f2:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  4024f9:	6e 70 72 
  4024fc:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402500:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  402507:	6c 65 20 
  40250a:	48 89 43 30          	mov    %rax,0x30(%rbx)
  40250e:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  402515:	63 74 65 
  402518:	48 89 43 38          	mov    %rax,0x38(%rbx)
  40251c:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  402522:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  402526:	89 ef                	mov    %ebp,%edi
  402528:	e8 63 e7 ff ff       	callq  400c90 <close@plt>
  40252d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402532:	e9 5c 01 00 00       	jmpq   402693 <submitr+0x587>
  402537:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40253e:	3a 20 43 
  402541:	48 89 03             	mov    %rax,(%rbx)
  402544:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40254b:	20 75 6e 
  40254e:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402552:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402559:	74 6f 20 
  40255c:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402560:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  402567:	20 74 6f 
  40256a:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40256e:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  402575:	72 65 73 
  402578:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40257c:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  402583:	65 72 76 
  402586:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40258a:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  402590:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  402594:	89 ef                	mov    %ebp,%edi
  402596:	e8 f5 e6 ff ff       	callq  400c90 <close@plt>
  40259b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025a0:	e9 ee 00 00 00       	jmpq   402693 <submitr+0x587>
  4025a5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4025ac:	3a 20 43 
  4025af:	48 89 03             	mov    %rax,(%rbx)
  4025b2:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4025b9:	20 75 6e 
  4025bc:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4025c0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4025c7:	74 6f 20 
  4025ca:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4025ce:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  4025d5:	66 69 72 
  4025d8:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4025dc:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  4025e3:	61 64 65 
  4025e6:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4025ea:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  4025f1:	6d 20 72 
  4025f4:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4025f8:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  4025ff:	20 73 65 
  402602:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402606:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  40260d:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  402611:	89 ef                	mov    %ebp,%edi
  402613:	e8 78 e6 ff ff       	callq  400c90 <close@plt>
  402618:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40261d:	eb 74                	jmp    402693 <submitr+0x587>
  40261f:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402626:	3a 20 43 
  402629:	48 89 03             	mov    %rax,(%rbx)
  40262c:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402633:	20 75 6e 
  402636:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40263a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402641:	74 6f 20 
  402644:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402648:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  40264f:	68 65 61 
  402652:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402656:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  40265d:	66 72 6f 
  402660:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402664:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  40266b:	20 72 65 
  40266e:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402672:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  402679:	73 65 72 
  40267c:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402680:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  402687:	89 ef                	mov    %ebp,%edi
  402689:	e8 02 e6 ff ff       	callq  400c90 <close@plt>
  40268e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402693:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  40269a:	5b                   	pop    %rbx
  40269b:	5d                   	pop    %rbp
  40269c:	41 5c                	pop    %r12
  40269e:	41 5d                	pop    %r13
  4026a0:	41 5e                	pop    %r14
  4026a2:	41 5f                	pop    %r15
  4026a4:	c3                   	retq   
  4026a5:	85 c0                	test   %eax,%eax
  4026a7:	74 51                	je     4026fa <submitr+0x5ee>
  4026a9:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  4026b0:	00 
  4026b1:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  4026b8:	00 
  4026b9:	ba 00 20 00 00       	mov    $0x2000,%edx
  4026be:	e8 ca f9 ff ff       	callq  40208d <rio_readlineb>
  4026c3:	48 85 c0             	test   %rax,%rax
  4026c6:	0f 8e 53 ff ff ff    	jle    40261f <submitr+0x513>
  4026cc:	0f b6 94 24 30 60 00 	movzbl 0x6030(%rsp),%edx
  4026d3:	00 
  4026d4:	b8 0d 00 00 00       	mov    $0xd,%eax
  4026d9:	29 d0                	sub    %edx,%eax
  4026db:	75 c8                	jne    4026a5 <submitr+0x599>
  4026dd:	0f b6 94 24 31 60 00 	movzbl 0x6031(%rsp),%edx
  4026e4:	00 
  4026e5:	b8 0a 00 00 00       	mov    $0xa,%eax
  4026ea:	29 d0                	sub    %edx,%eax
  4026ec:	75 b7                	jne    4026a5 <submitr+0x599>
  4026ee:	0f b6 84 24 32 60 00 	movzbl 0x6032(%rsp),%eax
  4026f5:	00 
  4026f6:	f7 d8                	neg    %eax
  4026f8:	eb ab                	jmp    4026a5 <submitr+0x599>
  4026fa:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402701:	00 
  402702:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  402709:	00 
  40270a:	ba 00 20 00 00       	mov    $0x2000,%edx
  40270f:	e8 79 f9 ff ff       	callq  40208d <rio_readlineb>
  402714:	48 85 c0             	test   %rax,%rax
  402717:	7e 67                	jle    402780 <submitr+0x674>
  402719:	8b 94 24 2c 20 00 00 	mov    0x202c(%rsp),%edx
  402720:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  402726:	0f 85 d7 00 00 00    	jne    402803 <submitr+0x6f7>
  40272c:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402733:	00 
  402734:	48 89 df             	mov    %rbx,%rdi
  402737:	e8 e4 e4 ff ff       	callq  400c20 <strcpy@plt>
  40273c:	89 ef                	mov    %ebp,%edi
  40273e:	e8 4d e5 ff ff       	callq  400c90 <close@plt>
  402743:	0f b6 03             	movzbl (%rbx),%eax
  402746:	ba 4f 00 00 00       	mov    $0x4f,%edx
  40274b:	29 c2                	sub    %eax,%edx
  40274d:	0f 85 da 00 00 00    	jne    40282d <submitr+0x721>
  402753:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402757:	b8 4b 00 00 00       	mov    $0x4b,%eax
  40275c:	29 c8                	sub    %ecx,%eax
  40275e:	0f 85 cb 00 00 00    	jne    40282f <submitr+0x723>
  402764:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  402768:	b8 0a 00 00 00       	mov    $0xa,%eax
  40276d:	29 c8                	sub    %ecx,%eax
  40276f:	0f 85 ba 00 00 00    	jne    40282f <submitr+0x723>
  402775:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  402779:	f7 d8                	neg    %eax
  40277b:	e9 af 00 00 00       	jmpq   40282f <submitr+0x723>
  402780:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402787:	3a 20 43 
  40278a:	48 89 03             	mov    %rax,(%rbx)
  40278d:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402794:	20 75 6e 
  402797:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40279b:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4027a2:	74 6f 20 
  4027a5:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4027a9:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  4027b0:	73 74 61 
  4027b3:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4027b7:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  4027be:	65 73 73 
  4027c1:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4027c5:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  4027cc:	72 6f 6d 
  4027cf:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4027d3:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  4027da:	6c 74 20 
  4027dd:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4027e1:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  4027e8:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  4027ee:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  4027f2:	89 ef                	mov    %ebp,%edi
  4027f4:	e8 97 e4 ff ff       	callq  400c90 <close@plt>
  4027f9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027fe:	e9 90 fe ff ff       	jmpq   402693 <submitr+0x587>
  402803:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  402808:	48 8d 35 e9 0a 00 00 	lea    0xae9(%rip),%rsi        # 4032f8 <trans_char+0x78>
  40280f:	48 89 df             	mov    %rbx,%rdi
  402812:	b8 00 00 00 00       	mov    $0x0,%eax
  402817:	e8 84 e5 ff ff       	callq  400da0 <sprintf@plt>
  40281c:	89 ef                	mov    %ebp,%edi
  40281e:	e8 6d e4 ff ff       	callq  400c90 <close@plt>
  402823:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402828:	e9 66 fe ff ff       	jmpq   402693 <submitr+0x587>
  40282d:	89 d0                	mov    %edx,%eax
  40282f:	f7 d8                	neg    %eax
  402831:	0f 84 5c fe ff ff    	je     402693 <submitr+0x587>
  402837:	b9 05 00 00 00       	mov    $0x5,%ecx
  40283c:	48 8d 3d fd 0a 00 00 	lea    0xafd(%rip),%rdi        # 403340 <trans_char+0xc0>
  402843:	48 89 de             	mov    %rbx,%rsi
  402846:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  402848:	0f 97 c0             	seta   %al
  40284b:	0f 92 c1             	setb   %cl
  40284e:	29 c8                	sub    %ecx,%eax
  402850:	0f be c0             	movsbl %al,%eax
  402853:	85 c0                	test   %eax,%eax
  402855:	0f 84 38 fe ff ff    	je     402693 <submitr+0x587>
  40285b:	85 d2                	test   %edx,%edx
  40285d:	75 13                	jne    402872 <submitr+0x766>
  40285f:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402863:	ba 4b 00 00 00       	mov    $0x4b,%edx
  402868:	29 c2                	sub    %eax,%edx
  40286a:	75 06                	jne    402872 <submitr+0x766>
  40286c:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402870:	f7 da                	neg    %edx
  402872:	89 d0                	mov    %edx,%eax
  402874:	f7 d8                	neg    %eax
  402876:	0f 84 17 fe ff ff    	je     402693 <submitr+0x587>
  40287c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402881:	e9 0d fe ff ff       	jmpq   402693 <submitr+0x587>

0000000000402886 <init_timeout>:
  402886:	85 ff                	test   %edi,%edi
  402888:	74 20                	je     4028aa <init_timeout+0x24>
  40288a:	53                   	push   %rbx
  40288b:	89 fb                	mov    %edi,%ebx
  40288d:	85 ff                	test   %edi,%edi
  40288f:	78 1b                	js     4028ac <init_timeout+0x26>
  402891:	48 8d 35 05 f6 ff ff 	lea    -0x9fb(%rip),%rsi        # 401e9d <sigalrm_handler>
  402898:	bf 0e 00 00 00       	mov    $0xe,%edi
  40289d:	e8 0e e4 ff ff       	callq  400cb0 <signal@plt>
  4028a2:	89 df                	mov    %ebx,%edi
  4028a4:	e8 d7 e3 ff ff       	callq  400c80 <alarm@plt>
  4028a9:	5b                   	pop    %rbx
  4028aa:	f3 c3                	repz retq 
  4028ac:	bb 00 00 00 00       	mov    $0x0,%ebx
  4028b1:	eb de                	jmp    402891 <init_timeout+0xb>

00000000004028b3 <init_driver>:
  4028b3:	41 54                	push   %r12
  4028b5:	55                   	push   %rbp
  4028b6:	53                   	push   %rbx
  4028b7:	48 83 ec 10          	sub    $0x10,%rsp
  4028bb:	48 89 fd             	mov    %rdi,%rbp
  4028be:	be 01 00 00 00       	mov    $0x1,%esi
  4028c3:	bf 0d 00 00 00       	mov    $0xd,%edi
  4028c8:	e8 e3 e3 ff ff       	callq  400cb0 <signal@plt>
  4028cd:	be 01 00 00 00       	mov    $0x1,%esi
  4028d2:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4028d7:	e8 d4 e3 ff ff       	callq  400cb0 <signal@plt>
  4028dc:	be 01 00 00 00       	mov    $0x1,%esi
  4028e1:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4028e6:	e8 c5 e3 ff ff       	callq  400cb0 <signal@plt>
  4028eb:	ba 00 00 00 00       	mov    $0x0,%edx
  4028f0:	be 01 00 00 00       	mov    $0x1,%esi
  4028f5:	bf 02 00 00 00       	mov    $0x2,%edi
  4028fa:	e8 d1 e4 ff ff       	callq  400dd0 <socket@plt>
  4028ff:	85 c0                	test   %eax,%eax
  402901:	0f 88 80 00 00 00    	js     402987 <init_driver+0xd4>
  402907:	89 c3                	mov    %eax,%ebx
  402909:	48 8d 3d 35 0a 00 00 	lea    0xa35(%rip),%rdi        # 403345 <trans_char+0xc5>
  402910:	e8 ab e3 ff ff       	callq  400cc0 <gethostbyname@plt>
  402915:	48 85 c0             	test   %rax,%rax
  402918:	0f 84 b5 00 00 00    	je     4029d3 <init_driver+0x120>
  40291e:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402925:	00 
  402926:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  40292d:	00 00 
  40292f:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402935:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402939:	48 63 50 14          	movslq 0x14(%rax),%rdx
  40293d:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  402942:	48 8b 39             	mov    (%rcx),%rdi
  402945:	e8 06 e4 ff ff       	callq  400d50 <bcopy@plt>
  40294a:	66 c7 44 24 02 3c a4 	movw   $0xa43c,0x2(%rsp)
  402951:	ba 10 00 00 00       	mov    $0x10,%edx
  402956:	48 89 e6             	mov    %rsp,%rsi
  402959:	89 df                	mov    %ebx,%edi
  40295b:	e8 60 e4 ff ff       	callq  400dc0 <connect@plt>
  402960:	85 c0                	test   %eax,%eax
  402962:	0f 88 d3 00 00 00    	js     402a3b <init_driver+0x188>
  402968:	89 df                	mov    %ebx,%edi
  40296a:	e8 21 e3 ff ff       	callq  400c90 <close@plt>
  40296f:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402975:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402979:	b8 00 00 00 00       	mov    $0x0,%eax
  40297e:	48 83 c4 10          	add    $0x10,%rsp
  402982:	5b                   	pop    %rbx
  402983:	5d                   	pop    %rbp
  402984:	41 5c                	pop    %r12
  402986:	c3                   	retq   
  402987:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40298e:	3a 20 43 
  402991:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402995:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40299c:	20 75 6e 
  40299f:	48 89 45 08          	mov    %rax,0x8(%rbp)
  4029a3:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4029aa:	74 6f 20 
  4029ad:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4029b1:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  4029b8:	65 20 73 
  4029bb:	48 89 45 18          	mov    %rax,0x18(%rbp)
  4029bf:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  4029c6:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  4029cc:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029d1:	eb ab                	jmp    40297e <init_driver+0xcb>
  4029d3:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4029da:	3a 20 44 
  4029dd:	48 89 45 00          	mov    %rax,0x0(%rbp)
  4029e1:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4029e8:	20 75 6e 
  4029eb:	48 89 45 08          	mov    %rax,0x8(%rbp)
  4029ef:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4029f6:	74 6f 20 
  4029f9:	48 89 45 10          	mov    %rax,0x10(%rbp)
  4029fd:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402a04:	76 65 20 
  402a07:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402a0b:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402a12:	72 20 61 
  402a15:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402a19:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402a20:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402a26:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402a2a:	89 df                	mov    %ebx,%edi
  402a2c:	e8 5f e2 ff ff       	callq  400c90 <close@plt>
  402a31:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a36:	e9 43 ff ff ff       	jmpq   40297e <init_driver+0xcb>
  402a3b:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402a42:	3a 20 55 
  402a45:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402a49:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402a50:	20 74 6f 
  402a53:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402a57:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402a5e:	65 63 74 
  402a61:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402a65:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402a6c:	65 72 76 
  402a6f:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402a73:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402a79:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402a7d:	89 df                	mov    %ebx,%edi
  402a7f:	e8 0c e2 ff ff       	callq  400c90 <close@plt>
  402a84:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402a89:	e9 f0 fe ff ff       	jmpq   40297e <init_driver+0xcb>

0000000000402a8e <driver_post>:
  402a8e:	53                   	push   %rbx
  402a8f:	4c 89 cb             	mov    %r9,%rbx
  402a92:	45 85 c0             	test   %r8d,%r8d
  402a95:	75 18                	jne    402aaf <driver_post+0x21>
  402a97:	48 85 ff             	test   %rdi,%rdi
  402a9a:	74 05                	je     402aa1 <driver_post+0x13>
  402a9c:	80 3f 00             	cmpb   $0x0,(%rdi)
  402a9f:	75 32                	jne    402ad3 <driver_post+0x45>
  402aa1:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402aa6:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402aaa:	44 89 c0             	mov    %r8d,%eax
  402aad:	5b                   	pop    %rbx
  402aae:	c3                   	retq   
  402aaf:	48 89 ce             	mov    %rcx,%rsi
  402ab2:	48 8d 3d 9a 08 00 00 	lea    0x89a(%rip),%rdi        # 403353 <trans_char+0xd3>
  402ab9:	b8 00 00 00 00       	mov    $0x0,%eax
  402abe:	e8 9d e1 ff ff       	callq  400c60 <printf@plt>
  402ac3:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402ac8:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402acc:	b8 00 00 00 00       	mov    $0x0,%eax
  402ad1:	eb da                	jmp    402aad <driver_post+0x1f>
  402ad3:	48 83 ec 08          	sub    $0x8,%rsp
  402ad7:	41 51                	push   %r9
  402ad9:	49 89 c9             	mov    %rcx,%r9
  402adc:	49 89 d0             	mov    %rdx,%r8
  402adf:	48 89 f9             	mov    %rdi,%rcx
  402ae2:	48 89 f2             	mov    %rsi,%rdx
  402ae5:	be a4 3c 00 00       	mov    $0x3ca4,%esi
  402aea:	48 8d 3d 54 08 00 00 	lea    0x854(%rip),%rdi        # 403345 <trans_char+0xc5>
  402af1:	e8 16 f6 ff ff       	callq  40210c <submitr>
  402af6:	48 83 c4 10          	add    $0x10,%rsp
  402afa:	eb b1                	jmp    402aad <driver_post+0x1f>

0000000000402afc <check>:
  402afc:	89 f8                	mov    %edi,%eax
  402afe:	c1 e8 1c             	shr    $0x1c,%eax
  402b01:	85 c0                	test   %eax,%eax
  402b03:	74 1d                	je     402b22 <check+0x26>
  402b05:	b9 00 00 00 00       	mov    $0x0,%ecx
  402b0a:	83 f9 1f             	cmp    $0x1f,%ecx
  402b0d:	7f 0d                	jg     402b1c <check+0x20>
  402b0f:	89 f8                	mov    %edi,%eax
  402b11:	d3 e8                	shr    %cl,%eax
  402b13:	3c 0a                	cmp    $0xa,%al
  402b15:	74 11                	je     402b28 <check+0x2c>
  402b17:	83 c1 08             	add    $0x8,%ecx
  402b1a:	eb ee                	jmp    402b0a <check+0xe>
  402b1c:	b8 01 00 00 00       	mov    $0x1,%eax
  402b21:	c3                   	retq   
  402b22:	b8 00 00 00 00       	mov    $0x0,%eax
  402b27:	c3                   	retq   
  402b28:	b8 00 00 00 00       	mov    $0x0,%eax
  402b2d:	c3                   	retq   

0000000000402b2e <gencookie>:
  402b2e:	53                   	push   %rbx
  402b2f:	83 c7 01             	add    $0x1,%edi
  402b32:	e8 c9 e0 ff ff       	callq  400c00 <srandom@plt>
  402b37:	e8 d4 e1 ff ff       	callq  400d10 <random@plt>
  402b3c:	89 c3                	mov    %eax,%ebx
  402b3e:	89 c7                	mov    %eax,%edi
  402b40:	e8 b7 ff ff ff       	callq  402afc <check>
  402b45:	85 c0                	test   %eax,%eax
  402b47:	74 ee                	je     402b37 <gencookie+0x9>
  402b49:	89 d8                	mov    %ebx,%eax
  402b4b:	5b                   	pop    %rbx
  402b4c:	c3                   	retq   
  402b4d:	0f 1f 00             	nopl   (%rax)

0000000000402b50 <__libc_csu_init>:
  402b50:	41 57                	push   %r15
  402b52:	41 56                	push   %r14
  402b54:	41 89 ff             	mov    %edi,%r15d
  402b57:	41 55                	push   %r13
  402b59:	41 54                	push   %r12
  402b5b:	4c 8d 25 a6 12 20 00 	lea    0x2012a6(%rip),%r12        # 603e08 <__frame_dummy_init_array_entry>
  402b62:	55                   	push   %rbp
  402b63:	48 8d 2d a6 12 20 00 	lea    0x2012a6(%rip),%rbp        # 603e10 <__init_array_end>
  402b6a:	53                   	push   %rbx
  402b6b:	49 89 f6             	mov    %rsi,%r14
  402b6e:	49 89 d5             	mov    %rdx,%r13
  402b71:	4c 29 e5             	sub    %r12,%rbp
  402b74:	48 83 ec 08          	sub    $0x8,%rsp
  402b78:	48 c1 fd 03          	sar    $0x3,%rbp
  402b7c:	e8 2f e0 ff ff       	callq  400bb0 <_init>
  402b81:	48 85 ed             	test   %rbp,%rbp
  402b84:	74 20                	je     402ba6 <__libc_csu_init+0x56>
  402b86:	31 db                	xor    %ebx,%ebx
  402b88:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402b8f:	00 
  402b90:	4c 89 ea             	mov    %r13,%rdx
  402b93:	4c 89 f6             	mov    %r14,%rsi
  402b96:	44 89 ff             	mov    %r15d,%edi
  402b99:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402b9d:	48 83 c3 01          	add    $0x1,%rbx
  402ba1:	48 39 dd             	cmp    %rbx,%rbp
  402ba4:	75 ea                	jne    402b90 <__libc_csu_init+0x40>
  402ba6:	48 83 c4 08          	add    $0x8,%rsp
  402baa:	5b                   	pop    %rbx
  402bab:	5d                   	pop    %rbp
  402bac:	41 5c                	pop    %r12
  402bae:	41 5d                	pop    %r13
  402bb0:	41 5e                	pop    %r14
  402bb2:	41 5f                	pop    %r15
  402bb4:	c3                   	retq   
  402bb5:	90                   	nop
  402bb6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402bbd:	00 00 00 

0000000000402bc0 <__libc_csu_fini>:
  402bc0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402bc4 <_fini>:
  402bc4:	48 83 ec 08          	sub    $0x8,%rsp
  402bc8:	48 83 c4 08          	add    $0x8,%rsp
  402bcc:	c3                   	retq   
