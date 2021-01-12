
rtarget:     file format elf64-x86-64


Disassembly of section .init:

0000000000400bb0 <_init>:
  400bb0:	48 83 ec 08          	sub    $0x8,%rsp
  400bb4:	48 8b 05 3d 44 20 00 	mov    0x20443d(%rip),%rax        # 604ff8 <__gmon_start__>
  400bbb:	48 85 c0             	test   %rax,%rax
  400bbe:	74 02                	je     400bc2 <_init+0x12>
  400bc0:	ff d0                	callq  *%rax
  400bc2:	48 83 c4 08          	add    $0x8,%rsp
  400bc6:	c3                   	retq   

Disassembly of section .plt:

0000000000400bd0 <.plt>:
  400bd0:	ff 35 32 44 20 00    	pushq  0x204432(%rip)        # 605008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400bd6:	ff 25 34 44 20 00    	jmpq   *0x204434(%rip)        # 605010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400bdc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400be0 <strcasecmp@plt>:
  400be0:	ff 25 32 44 20 00    	jmpq   *0x204432(%rip)        # 605018 <strcasecmp@GLIBC_2.2.5>
  400be6:	68 00 00 00 00       	pushq  $0x0
  400beb:	e9 e0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400bf0 <__errno_location@plt>:
  400bf0:	ff 25 2a 44 20 00    	jmpq   *0x20442a(%rip)        # 605020 <__errno_location@GLIBC_2.2.5>
  400bf6:	68 01 00 00 00       	pushq  $0x1
  400bfb:	e9 d0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c00 <srandom@plt>:
  400c00:	ff 25 22 44 20 00    	jmpq   *0x204422(%rip)        # 605028 <srandom@GLIBC_2.2.5>
  400c06:	68 02 00 00 00       	pushq  $0x2
  400c0b:	e9 c0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c10 <strncmp@plt>:
  400c10:	ff 25 1a 44 20 00    	jmpq   *0x20441a(%rip)        # 605030 <strncmp@GLIBC_2.2.5>
  400c16:	68 03 00 00 00       	pushq  $0x3
  400c1b:	e9 b0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c20 <strcpy@plt>:
  400c20:	ff 25 12 44 20 00    	jmpq   *0x204412(%rip)        # 605038 <strcpy@GLIBC_2.2.5>
  400c26:	68 04 00 00 00       	pushq  $0x4
  400c2b:	e9 a0 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c30 <puts@plt>:
  400c30:	ff 25 0a 44 20 00    	jmpq   *0x20440a(%rip)        # 605040 <puts@GLIBC_2.2.5>
  400c36:	68 05 00 00 00       	pushq  $0x5
  400c3b:	e9 90 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c40 <write@plt>:
  400c40:	ff 25 02 44 20 00    	jmpq   *0x204402(%rip)        # 605048 <write@GLIBC_2.2.5>
  400c46:	68 06 00 00 00       	pushq  $0x6
  400c4b:	e9 80 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c50 <mmap@plt>:
  400c50:	ff 25 fa 43 20 00    	jmpq   *0x2043fa(%rip)        # 605050 <mmap@GLIBC_2.2.5>
  400c56:	68 07 00 00 00       	pushq  $0x7
  400c5b:	e9 70 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c60 <printf@plt>:
  400c60:	ff 25 f2 43 20 00    	jmpq   *0x2043f2(%rip)        # 605058 <printf@GLIBC_2.2.5>
  400c66:	68 08 00 00 00       	pushq  $0x8
  400c6b:	e9 60 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c70 <memset@plt>:
  400c70:	ff 25 ea 43 20 00    	jmpq   *0x2043ea(%rip)        # 605060 <memset@GLIBC_2.2.5>
  400c76:	68 09 00 00 00       	pushq  $0x9
  400c7b:	e9 50 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c80 <alarm@plt>:
  400c80:	ff 25 e2 43 20 00    	jmpq   *0x2043e2(%rip)        # 605068 <alarm@GLIBC_2.2.5>
  400c86:	68 0a 00 00 00       	pushq  $0xa
  400c8b:	e9 40 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400c90 <close@plt>:
  400c90:	ff 25 da 43 20 00    	jmpq   *0x2043da(%rip)        # 605070 <close@GLIBC_2.2.5>
  400c96:	68 0b 00 00 00       	pushq  $0xb
  400c9b:	e9 30 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400ca0 <read@plt>:
  400ca0:	ff 25 d2 43 20 00    	jmpq   *0x2043d2(%rip)        # 605078 <read@GLIBC_2.2.5>
  400ca6:	68 0c 00 00 00       	pushq  $0xc
  400cab:	e9 20 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cb0 <signal@plt>:
  400cb0:	ff 25 ca 43 20 00    	jmpq   *0x2043ca(%rip)        # 605080 <signal@GLIBC_2.2.5>
  400cb6:	68 0d 00 00 00       	pushq  $0xd
  400cbb:	e9 10 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cc0 <gethostbyname@plt>:
  400cc0:	ff 25 c2 43 20 00    	jmpq   *0x2043c2(%rip)        # 605088 <gethostbyname@GLIBC_2.2.5>
  400cc6:	68 0e 00 00 00       	pushq  $0xe
  400ccb:	e9 00 ff ff ff       	jmpq   400bd0 <.plt>

0000000000400cd0 <fprintf@plt>:
  400cd0:	ff 25 ba 43 20 00    	jmpq   *0x2043ba(%rip)        # 605090 <fprintf@GLIBC_2.2.5>
  400cd6:	68 0f 00 00 00       	pushq  $0xf
  400cdb:	e9 f0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400ce0 <strtol@plt>:
  400ce0:	ff 25 b2 43 20 00    	jmpq   *0x2043b2(%rip)        # 605098 <strtol@GLIBC_2.2.5>
  400ce6:	68 10 00 00 00       	pushq  $0x10
  400ceb:	e9 e0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400cf0 <memcpy@plt>:
  400cf0:	ff 25 aa 43 20 00    	jmpq   *0x2043aa(%rip)        # 6050a0 <memcpy@GLIBC_2.14>
  400cf6:	68 11 00 00 00       	pushq  $0x11
  400cfb:	e9 d0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d00 <time@plt>:
  400d00:	ff 25 a2 43 20 00    	jmpq   *0x2043a2(%rip)        # 6050a8 <time@GLIBC_2.2.5>
  400d06:	68 12 00 00 00       	pushq  $0x12
  400d0b:	e9 c0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d10 <random@plt>:
  400d10:	ff 25 9a 43 20 00    	jmpq   *0x20439a(%rip)        # 6050b0 <random@GLIBC_2.2.5>
  400d16:	68 13 00 00 00       	pushq  $0x13
  400d1b:	e9 b0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d20 <_IO_getc@plt>:
  400d20:	ff 25 92 43 20 00    	jmpq   *0x204392(%rip)        # 6050b8 <_IO_getc@GLIBC_2.2.5>
  400d26:	68 14 00 00 00       	pushq  $0x14
  400d2b:	e9 a0 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d30 <__isoc99_sscanf@plt>:
  400d30:	ff 25 8a 43 20 00    	jmpq   *0x20438a(%rip)        # 6050c0 <__isoc99_sscanf@GLIBC_2.7>
  400d36:	68 15 00 00 00       	pushq  $0x15
  400d3b:	e9 90 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d40 <munmap@plt>:
  400d40:	ff 25 82 43 20 00    	jmpq   *0x204382(%rip)        # 6050c8 <munmap@GLIBC_2.2.5>
  400d46:	68 16 00 00 00       	pushq  $0x16
  400d4b:	e9 80 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d50 <bcopy@plt>:
  400d50:	ff 25 7a 43 20 00    	jmpq   *0x20437a(%rip)        # 6050d0 <bcopy@GLIBC_2.2.5>
  400d56:	68 17 00 00 00       	pushq  $0x17
  400d5b:	e9 70 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d60 <fopen@plt>:
  400d60:	ff 25 72 43 20 00    	jmpq   *0x204372(%rip)        # 6050d8 <fopen@GLIBC_2.2.5>
  400d66:	68 18 00 00 00       	pushq  $0x18
  400d6b:	e9 60 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d70 <getopt@plt>:
  400d70:	ff 25 6a 43 20 00    	jmpq   *0x20436a(%rip)        # 6050e0 <getopt@GLIBC_2.2.5>
  400d76:	68 19 00 00 00       	pushq  $0x19
  400d7b:	e9 50 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d80 <strtoul@plt>:
  400d80:	ff 25 62 43 20 00    	jmpq   *0x204362(%rip)        # 6050e8 <strtoul@GLIBC_2.2.5>
  400d86:	68 1a 00 00 00       	pushq  $0x1a
  400d8b:	e9 40 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400d90 <gethostname@plt>:
  400d90:	ff 25 5a 43 20 00    	jmpq   *0x20435a(%rip)        # 6050f0 <gethostname@GLIBC_2.2.5>
  400d96:	68 1b 00 00 00       	pushq  $0x1b
  400d9b:	e9 30 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400da0 <sprintf@plt>:
  400da0:	ff 25 52 43 20 00    	jmpq   *0x204352(%rip)        # 6050f8 <sprintf@GLIBC_2.2.5>
  400da6:	68 1c 00 00 00       	pushq  $0x1c
  400dab:	e9 20 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400db0 <exit@plt>:
  400db0:	ff 25 4a 43 20 00    	jmpq   *0x20434a(%rip)        # 605100 <exit@GLIBC_2.2.5>
  400db6:	68 1d 00 00 00       	pushq  $0x1d
  400dbb:	e9 10 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400dc0 <connect@plt>:
  400dc0:	ff 25 42 43 20 00    	jmpq   *0x204342(%rip)        # 605108 <connect@GLIBC_2.2.5>
  400dc6:	68 1e 00 00 00       	pushq  $0x1e
  400dcb:	e9 00 fe ff ff       	jmpq   400bd0 <.plt>

0000000000400dd0 <socket@plt>:
  400dd0:	ff 25 3a 43 20 00    	jmpq   *0x20433a(%rip)        # 605110 <socket@GLIBC_2.2.5>
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
  400def:	49 c7 c0 e0 2c 40 00 	mov    $0x402ce0,%r8
  400df6:	48 c7 c1 70 2c 40 00 	mov    $0x402c70,%rcx
  400dfd:	48 c7 c7 8d 10 40 00 	mov    $0x40108d,%rdi
  400e04:	ff 15 e6 41 20 00    	callq  *0x2041e6(%rip)        # 604ff0 <__libc_start_main@GLIBC_2.2.5>
  400e0a:	f4                   	hlt    
  400e0b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000400e10 <deregister_tm_clones>:
  400e10:	b8 97 54 60 00       	mov    $0x605497,%eax
  400e15:	55                   	push   %rbp
  400e16:	48 2d 90 54 60 00    	sub    $0x605490,%rax
  400e1c:	48 83 f8 0e          	cmp    $0xe,%rax
  400e20:	48 89 e5             	mov    %rsp,%rbp
  400e23:	76 1b                	jbe    400e40 <deregister_tm_clones+0x30>
  400e25:	b8 00 00 00 00       	mov    $0x0,%eax
  400e2a:	48 85 c0             	test   %rax,%rax
  400e2d:	74 11                	je     400e40 <deregister_tm_clones+0x30>
  400e2f:	5d                   	pop    %rbp
  400e30:	bf 90 54 60 00       	mov    $0x605490,%edi
  400e35:	ff e0                	jmpq   *%rax
  400e37:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400e3e:	00 00 
  400e40:	5d                   	pop    %rbp
  400e41:	c3                   	retq   
  400e42:	0f 1f 40 00          	nopl   0x0(%rax)
  400e46:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400e4d:	00 00 00 

0000000000400e50 <register_tm_clones>:
  400e50:	be 90 54 60 00       	mov    $0x605490,%esi
  400e55:	55                   	push   %rbp
  400e56:	48 81 ee 90 54 60 00 	sub    $0x605490,%rsi
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
  400e7e:	bf 90 54 60 00       	mov    $0x605490,%edi
  400e83:	ff e0                	jmpq   *%rax
  400e85:	0f 1f 00             	nopl   (%rax)
  400e88:	5d                   	pop    %rbp
  400e89:	c3                   	retq   
  400e8a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400e90 <__do_global_dtors_aux>:
  400e90:	80 3d 31 46 20 00 00 	cmpb   $0x0,0x204631(%rip)        # 6054c8 <completed.6972>
  400e97:	75 11                	jne    400eaa <__do_global_dtors_aux+0x1a>
  400e99:	55                   	push   %rbp
  400e9a:	48 89 e5             	mov    %rsp,%rbp
  400e9d:	e8 6e ff ff ff       	callq  400e10 <deregister_tm_clones>
  400ea2:	5d                   	pop    %rbp
  400ea3:	c6 05 1e 46 20 00 01 	movb   $0x1,0x20461e(%rip)        # 6054c8 <completed.6972>
  400eaa:	f3 c3                	repz retq 
  400eac:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400eb0 <frame_dummy>:
  400eb0:	bf 18 4e 60 00       	mov    $0x604e18,%edi
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
  400edd:	83 3d 24 46 20 00 00 	cmpl   $0x0,0x204624(%rip)        # 605508 <is_checker>
  400ee4:	74 4b                	je     400f31 <usage+0x5b>
  400ee6:	48 8d 3d 0b 1e 00 00 	lea    0x1e0b(%rip),%rdi        # 402cf8 <_IO_stdin_used+0x8>
  400eed:	b8 00 00 00 00       	mov    $0x0,%eax
  400ef2:	e8 69 fd ff ff       	callq  400c60 <printf@plt>
  400ef7:	48 8d 3d 32 1e 00 00 	lea    0x1e32(%rip),%rdi        # 402d30 <_IO_stdin_used+0x40>
  400efe:	e8 2d fd ff ff       	callq  400c30 <puts@plt>
  400f03:	48 8d 3d 5e 1f 00 00 	lea    0x1f5e(%rip),%rdi        # 402e68 <_IO_stdin_used+0x178>
  400f0a:	e8 21 fd ff ff       	callq  400c30 <puts@plt>
  400f0f:	48 8d 3d 42 1e 00 00 	lea    0x1e42(%rip),%rdi        # 402d58 <_IO_stdin_used+0x68>
  400f16:	e8 15 fd ff ff       	callq  400c30 <puts@plt>
  400f1b:	48 8d 3d 60 1f 00 00 	lea    0x1f60(%rip),%rdi        # 402e82 <_IO_stdin_used+0x192>
  400f22:	e8 09 fd ff ff       	callq  400c30 <puts@plt>
  400f27:	bf 00 00 00 00       	mov    $0x0,%edi
  400f2c:	e8 7f fe ff ff       	callq  400db0 <exit@plt>
  400f31:	48 8d 3d 66 1f 00 00 	lea    0x1f66(%rip),%rdi        # 402e9e <_IO_stdin_used+0x1ae>
  400f38:	b8 00 00 00 00       	mov    $0x0,%eax
  400f3d:	e8 1e fd ff ff       	callq  400c60 <printf@plt>
  400f42:	48 8d 3d 37 1e 00 00 	lea    0x1e37(%rip),%rdi        # 402d80 <_IO_stdin_used+0x90>
  400f49:	e8 e2 fc ff ff       	callq  400c30 <puts@plt>
  400f4e:	48 8d 3d 53 1e 00 00 	lea    0x1e53(%rip),%rdi        # 402da8 <_IO_stdin_used+0xb8>
  400f55:	e8 d6 fc ff ff       	callq  400c30 <puts@plt>
  400f5a:	48 8d 3d 5b 1f 00 00 	lea    0x1f5b(%rip),%rdi        # 402ebc <_IO_stdin_used+0x1cc>
  400f61:	e8 ca fc ff ff       	callq  400c30 <puts@plt>
  400f66:	eb bf                	jmp    400f27 <usage+0x51>

0000000000400f68 <initialize_target>:
  400f68:	55                   	push   %rbp
  400f69:	53                   	push   %rbx
  400f6a:	48 81 ec 08 21 00 00 	sub    $0x2108,%rsp
  400f71:	89 f5                	mov    %esi,%ebp
  400f73:	89 3d 7f 45 20 00    	mov    %edi,0x20457f(%rip)        # 6054f8 <check_level>
  400f79:	8b 3d b1 41 20 00    	mov    0x2041b1(%rip),%edi        # 605130 <target_id>
  400f7f:	e8 cc 1c 00 00       	callq  402c50 <gencookie>
  400f84:	89 05 7a 45 20 00    	mov    %eax,0x20457a(%rip)        # 605504 <cookie>
  400f8a:	89 c7                	mov    %eax,%edi
  400f8c:	e8 bf 1c 00 00       	callq  402c50 <gencookie>
  400f91:	89 05 69 45 20 00    	mov    %eax,0x204569(%rip)        # 605500 <authkey>
  400f97:	8b 05 93 41 20 00    	mov    0x204193(%rip),%eax        # 605130 <target_id>
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
  400fca:	48 89 05 af 44 20 00 	mov    %rax,0x2044af(%rip)        # 605480 <buf_offset>
  400fd1:	c6 05 50 51 20 00 72 	movb   $0x72,0x205150(%rip)        # 606128 <target_prefix>
  400fd8:	83 3d a9 44 20 00 00 	cmpl   $0x0,0x2044a9(%rip)        # 605488 <notify>
  400fdf:	74 09                	je     400fea <initialize_target+0x82>
  400fe1:	83 3d 20 45 20 00 00 	cmpl   $0x0,0x204520(%rip)        # 605508 <is_checker>
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
  401022:	48 8d 15 37 41 20 00 	lea    0x204137(%rip),%rdx        # 605160 <host_table>
  401029:	48 8b 3c c2          	mov    (%rdx,%rax,8),%rdi
  40102d:	48 85 ff             	test   %rdi,%rdi
  401030:	74 27                	je     401059 <initialize_target+0xf1>
  401032:	48 89 e6             	mov    %rsp,%rsi
  401035:	e8 a6 fb ff ff       	callq  400be0 <strcasecmp@plt>
  40103a:	85 c0                	test   %eax,%eax
  40103c:	74 1b                	je     401059 <initialize_target+0xf1>
  40103e:	83 c3 01             	add    $0x1,%ebx
  401041:	eb dc                	jmp    40101f <initialize_target+0xb7>
  401043:	48 8d 3d 8e 1d 00 00 	lea    0x1d8e(%rip),%rdi        # 402dd8 <_IO_stdin_used+0xe8>
  40104a:	e8 e1 fb ff ff       	callq  400c30 <puts@plt>
  40104f:	bf 08 00 00 00       	mov    $0x8,%edi
  401054:	e8 57 fd ff ff       	callq  400db0 <exit@plt>
  401059:	48 8d bc 24 00 01 00 	lea    0x100(%rsp),%rdi
  401060:	00 
  401061:	e8 6f 19 00 00       	callq  4029d5 <init_driver>
  401066:	85 c0                	test   %eax,%eax
  401068:	79 80                	jns    400fea <initialize_target+0x82>
  40106a:	48 8d b4 24 00 01 00 	lea    0x100(%rsp),%rsi
  401071:	00 
  401072:	48 8d 3d 97 1d 00 00 	lea    0x1d97(%rip),%rdi        # 402e10 <_IO_stdin_used+0x120>
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
  40109b:	48 c7 c6 7b 1d 40 00 	mov    $0x401d7b,%rsi
  4010a2:	bf 0b 00 00 00       	mov    $0xb,%edi
  4010a7:	e8 04 fc ff ff       	callq  400cb0 <signal@plt>
  4010ac:	48 c7 c6 27 1d 40 00 	mov    $0x401d27,%rsi
  4010b3:	bf 07 00 00 00       	mov    $0x7,%edi
  4010b8:	e8 f3 fb ff ff       	callq  400cb0 <signal@plt>
  4010bd:	48 c7 c6 cf 1d 40 00 	mov    $0x401dcf,%rsi
  4010c4:	bf 04 00 00 00       	mov    $0x4,%edi
  4010c9:	e8 e2 fb ff ff       	callq  400cb0 <signal@plt>
  4010ce:	83 3d 33 44 20 00 00 	cmpl   $0x0,0x204433(%rip)        # 605508 <is_checker>
  4010d5:	75 58                	jne    40112f <main+0xa2>
  4010d7:	48 8d 2d f7 1d 00 00 	lea    0x1df7(%rip),%rbp        # 402ed5 <_IO_stdin_used+0x1e5>
  4010de:	48 8b 05 bb 43 20 00 	mov    0x2043bb(%rip),%rax        # 6054a0 <stdin@@GLIBC_2.2.5>
  4010e5:	48 89 05 04 44 20 00 	mov    %rax,0x204404(%rip)        # 6054f0 <infile>
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
  40111f:	48 8d 15 fa 1d 00 00 	lea    0x1dfa(%rip),%rdx        # 402f20 <_IO_stdin_used+0x230>
  401126:	48 63 04 82          	movslq (%rdx,%rax,4),%rax
  40112a:	48 01 d0             	add    %rdx,%rax
  40112d:	ff e0                	jmpq   *%rax
  40112f:	48 c7 c6 23 1e 40 00 	mov    $0x401e23,%rsi
  401136:	bf 0e 00 00 00       	mov    $0xe,%edi
  40113b:	e8 70 fb ff ff       	callq  400cb0 <signal@plt>
  401140:	bf 05 00 00 00       	mov    $0x5,%edi
  401145:	e8 36 fb ff ff       	callq  400c80 <alarm@plt>
  40114a:	48 8d 2d 89 1d 00 00 	lea    0x1d89(%rip),%rbp        # 402eda <_IO_stdin_used+0x1ea>
  401151:	eb 8b                	jmp    4010de <main+0x51>
  401153:	48 8b 3b             	mov    (%rbx),%rdi
  401156:	e8 7b fd ff ff       	callq  400ed6 <usage>
  40115b:	48 8d 35 03 20 00 00 	lea    0x2003(%rip),%rsi        # 403165 <_IO_stdin_used+0x475>
  401162:	48 8b 3d 3f 43 20 00 	mov    0x20433f(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  401169:	e8 f2 fb ff ff       	callq  400d60 <fopen@plt>
  40116e:	48 89 05 7b 43 20 00 	mov    %rax,0x20437b(%rip)        # 6054f0 <infile>
  401175:	48 85 c0             	test   %rax,%rax
  401178:	0f 85 7a ff ff ff    	jne    4010f8 <main+0x6b>
  40117e:	48 8b 15 23 43 20 00 	mov    0x204323(%rip),%rdx        # 6054a8 <optarg@@GLIBC_2.2.5>
  401185:	48 8d 35 56 1d 00 00 	lea    0x1d56(%rip),%rsi        # 402ee2 <_IO_stdin_used+0x1f2>
  40118c:	48 8b 3d 2d 43 20 00 	mov    0x20432d(%rip),%rdi        # 6054c0 <stderr@@GLIBC_2.2.5>
  401193:	e8 38 fb ff ff       	callq  400cd0 <fprintf@plt>
  401198:	b8 01 00 00 00       	mov    $0x1,%eax
  40119d:	e9 c9 00 00 00       	jmpq   40126b <main+0x1de>
  4011a2:	ba 10 00 00 00       	mov    $0x10,%edx
  4011a7:	be 00 00 00 00       	mov    $0x0,%esi
  4011ac:	48 8b 3d f5 42 20 00 	mov    0x2042f5(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  4011b3:	e8 c8 fb ff ff       	callq  400d80 <strtoul@plt>
  4011b8:	41 89 c6             	mov    %eax,%r14d
  4011bb:	e9 38 ff ff ff       	jmpq   4010f8 <main+0x6b>
  4011c0:	ba 0a 00 00 00       	mov    $0xa,%edx
  4011c5:	be 00 00 00 00       	mov    $0x0,%esi
  4011ca:	48 8b 3d d7 42 20 00 	mov    0x2042d7(%rip),%rdi        # 6054a8 <optarg@@GLIBC_2.2.5>
  4011d1:	e8 0a fb ff ff       	callq  400ce0 <strtol@plt>
  4011d6:	41 89 c5             	mov    %eax,%r13d
  4011d9:	e9 1a ff ff ff       	jmpq   4010f8 <main+0x6b>
  4011de:	c7 05 a0 42 20 00 00 	movl   $0x0,0x2042a0(%rip)        # 605488 <notify>
  4011e5:	00 00 00 
  4011e8:	e9 0b ff ff ff       	jmpq   4010f8 <main+0x6b>
  4011ed:	48 8d 3d 0b 1d 00 00 	lea    0x1d0b(%rip),%rdi        # 402eff <_IO_stdin_used+0x20f>
  4011f4:	b8 00 00 00 00       	mov    $0x0,%eax
  4011f9:	e8 62 fa ff ff       	callq  400c60 <printf@plt>
  4011fe:	48 8b 3b             	mov    (%rbx),%rdi
  401201:	e8 d0 fc ff ff       	callq  400ed6 <usage>
  401206:	be 01 00 00 00       	mov    $0x1,%esi
  40120b:	44 89 ef             	mov    %r13d,%edi
  40120e:	e8 55 fd ff ff       	callq  400f68 <initialize_target>
  401213:	83 3d ee 42 20 00 00 	cmpl   $0x0,0x2042ee(%rip)        # 605508 <is_checker>
  40121a:	74 27                	je     401243 <main+0x1b6>
  40121c:	44 3b 35 dd 42 20 00 	cmp    0x2042dd(%rip),%r14d        # 605500 <authkey>
  401223:	74 1e                	je     401243 <main+0x1b6>
  401225:	44 89 f6             	mov    %r14d,%esi
  401228:	48 8d 3d 09 1c 00 00 	lea    0x1c09(%rip),%rdi        # 402e38 <_IO_stdin_used+0x148>
  40122f:	b8 00 00 00 00       	mov    $0x0,%eax
  401234:	e8 27 fa ff ff       	callq  400c60 <printf@plt>
  401239:	b8 00 00 00 00       	mov    $0x0,%eax
  40123e:	e8 b4 07 00 00       	callq  4019f7 <check_fail>
  401243:	8b 35 bb 42 20 00    	mov    0x2042bb(%rip),%esi        # 605504 <cookie>
  401249:	48 8d 3d c2 1c 00 00 	lea    0x1cc2(%rip),%rdi        # 402f12 <_IO_stdin_used+0x222>
  401250:	b8 00 00 00 00       	mov    $0x0,%eax
  401255:	e8 06 fa ff ff       	callq  400c60 <printf@plt>
  40125a:	48 8b 3d 1f 42 20 00 	mov    0x20421f(%rip),%rdi        # 605480 <buf_offset>
  401261:	e8 0f 0c 00 00       	callq  401e75 <launch>
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
  4016bf:	e8 66 03 00 00       	callq  401a2a <Gets>
  4016c4:	b8 01 00 00 00       	mov    $0x1,%eax
  4016c9:	48 83 c4 38          	add    $0x38,%rsp
  4016cd:	c3                   	retq   

00000000004016ce <touch1>:
  4016ce:	48 83 ec 08          	sub    $0x8,%rsp
  4016d2:	c7 05 20 3e 20 00 01 	movl   $0x1,0x203e20(%rip)        # 6054fc <vlevel>
  4016d9:	00 00 00 
  4016dc:	48 8d 3d d8 18 00 00 	lea    0x18d8(%rip),%rdi        # 402fbb <_IO_stdin_used+0x2cb>
  4016e3:	e8 48 f5 ff ff       	callq  400c30 <puts@plt>
  4016e8:	bf 01 00 00 00       	mov    $0x1,%edi
  4016ed:	e8 4f 05 00 00       	callq  401c41 <validate>
  4016f2:	bf 00 00 00 00       	mov    $0x0,%edi
  4016f7:	e8 b4 f6 ff ff       	callq  400db0 <exit@plt>

00000000004016fc <touch2>:
  4016fc:	48 83 ec 08          	sub    $0x8,%rsp
  401700:	89 fe                	mov    %edi,%esi
  401702:	c7 05 f0 3d 20 00 02 	movl   $0x2,0x203df0(%rip)        # 6054fc <vlevel>
  401709:	00 00 00 
  40170c:	39 3d f2 3d 20 00    	cmp    %edi,0x203df2(%rip)        # 605504 <cookie>
  401712:	74 25                	je     401739 <touch2+0x3d>
  401714:	48 8d 3d ed 18 00 00 	lea    0x18ed(%rip),%rdi        # 403008 <_IO_stdin_used+0x318>
  40171b:	b8 00 00 00 00       	mov    $0x0,%eax
  401720:	e8 3b f5 ff ff       	callq  400c60 <printf@plt>
  401725:	bf 02 00 00 00       	mov    $0x2,%edi
  40172a:	e8 d0 05 00 00       	callq  401cff <fail>
  40172f:	bf 00 00 00 00       	mov    $0x0,%edi
  401734:	e8 77 f6 ff ff       	callq  400db0 <exit@plt>
  401739:	48 8d 3d a0 18 00 00 	lea    0x18a0(%rip),%rdi        # 402fe0 <_IO_stdin_used+0x2f0>
  401740:	b8 00 00 00 00       	mov    $0x0,%eax
  401745:	e8 16 f5 ff ff       	callq  400c60 <printf@plt>
  40174a:	bf 02 00 00 00       	mov    $0x2,%edi
  40174f:	e8 ed 04 00 00       	callq  401c41 <validate>
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
  4017a2:	48 8d 35 2f 18 00 00 	lea    0x182f(%rip),%rsi        # 402fd8 <_IO_stdin_used+0x2e8>
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
  4017db:	c7 05 17 3d 20 00 03 	movl   $0x3,0x203d17(%rip)        # 6054fc <vlevel>
  4017e2:	00 00 00 
  4017e5:	48 89 fe             	mov    %rdi,%rsi
  4017e8:	8b 3d 16 3d 20 00    	mov    0x203d16(%rip),%edi        # 605504 <cookie>
  4017ee:	e8 63 ff ff ff       	callq  401756 <hexmatch>
  4017f3:	85 c0                	test   %eax,%eax
  4017f5:	74 28                	je     40181f <touch3+0x48>
  4017f7:	48 89 de             	mov    %rbx,%rsi
  4017fa:	48 8d 3d 2f 18 00 00 	lea    0x182f(%rip),%rdi        # 403030 <_IO_stdin_used+0x340>
  401801:	b8 00 00 00 00       	mov    $0x0,%eax
  401806:	e8 55 f4 ff ff       	callq  400c60 <printf@plt>
  40180b:	bf 03 00 00 00       	mov    $0x3,%edi
  401810:	e8 2c 04 00 00       	callq  401c41 <validate>
  401815:	bf 00 00 00 00       	mov    $0x0,%edi
  40181a:	e8 91 f5 ff ff       	callq  400db0 <exit@plt>
  40181f:	48 89 de             	mov    %rbx,%rsi
  401822:	48 8d 3d 2f 18 00 00 	lea    0x182f(%rip),%rdi        # 403058 <_IO_stdin_used+0x368>
  401829:	b8 00 00 00 00       	mov    $0x0,%eax
  40182e:	e8 2d f4 ff ff       	callq  400c60 <printf@plt>
  401833:	bf 03 00 00 00       	mov    $0x3,%edi
  401838:	e8 c2 04 00 00       	callq  401cff <fail>
  40183d:	eb d6                	jmp    401815 <touch3+0x3e>

000000000040183f <test>:
  40183f:	48 83 ec 08          	sub    $0x8,%rsp
  401843:	b8 00 00 00 00       	mov    $0x0,%eax
  401848:	e8 6b fe ff ff       	callq  4016b8 <getbuf>
  40184d:	89 c6                	mov    %eax,%esi
  40184f:	48 8d 3d 2a 18 00 00 	lea    0x182a(%rip),%rdi        # 403080 <_IO_stdin_used+0x390>
  401856:	b8 00 00 00 00       	mov    $0x0,%eax
  40185b:	e8 00 f4 ff ff       	callq  400c60 <printf@plt>
  401860:	48 83 c4 08          	add    $0x8,%rsp
  401864:	c3                   	retq   

0000000000401865 <start_farm>:
  401865:	b8 01 00 00 00       	mov    $0x1,%eax
  40186a:	c3                   	retq   

000000000040186b <setval_123>:
  40186b:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  401871:	c3                   	retq   

0000000000401872 <getval_140>:
  401872:	b8 64 ff 58 c3       	mov    $0xc358ff64,%eax
  401877:	c3                   	retq   

0000000000401878 <setval_295>:
  401878:	c7 07 31 00 58 90    	movl   $0x90580031,(%rdi)
  40187e:	c3                   	retq   

000000000040187f <setval_343>:
  40187f:	c7 07 48 89 c7 c3    	movl   $0xc3c78948,(%rdi)
  401885:	c3                   	retq   

0000000000401886 <addval_490>:
  401886:	8d 87 4a 89 c7 c3    	lea    -0x3c3876b6(%rdi),%eax
  40188c:	c3                   	retq   

000000000040188d <addval_248>:
  40188d:	8d 87 48 90 90 c3    	lea    -0x3c6f6fb8(%rdi),%eax
  401893:	c3                   	retq   

0000000000401894 <getval_194>:
  401894:	b8 58 90 94 c3       	mov    $0xc3949058,%eax
  401899:	c3                   	retq   

000000000040189a <getval_379>:
  40189a:	b8 48 89 c7 c1       	mov    $0xc1c78948,%eax
  40189f:	c3                   	retq   

00000000004018a0 <mid_farm>:
  4018a0:	b8 01 00 00 00       	mov    $0x1,%eax
  4018a5:	c3                   	retq   

00000000004018a6 <add_xy>:
  4018a6:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  4018aa:	c3                   	retq   

00000000004018ab <setval_317>:
  4018ab:	c7 07 8d c2 84 c0    	movl   $0xc084c28d,(%rdi)
  4018b1:	c3                   	retq   

00000000004018b2 <getval_149>:
  4018b2:	b8 89 d1 92 c3       	mov    $0xc392d189,%eax
  4018b7:	c3                   	retq   

00000000004018b8 <getval_232>:
  4018b8:	b8 89 d1 92 90       	mov    $0x9092d189,%eax
  4018bd:	c3                   	retq   

00000000004018be <getval_122>:
  4018be:	b8 89 c2 20 c9       	mov    $0xc920c289,%eax
  4018c3:	c3                   	retq   

00000000004018c4 <setval_209>:
  4018c4:	c7 07 1e bb c9 ce    	movl   $0xcec9bb1e,(%rdi)
  4018ca:	c3                   	retq   

00000000004018cb <getval_182>:
  4018cb:	b8 e7 81 c2 90       	mov    $0x90c281e7,%eax
  4018d0:	c3                   	retq   

00000000004018d1 <addval_474>:
  4018d1:	8d 87 89 c2 90 c3    	lea    -0x3c6f3d77(%rdi),%eax
  4018d7:	c3                   	retq   

00000000004018d8 <getval_488>:
  4018d8:	b8 89 d1 92 90       	mov    $0x9092d189,%eax
  4018dd:	c3                   	retq   

00000000004018de <getval_378>:
  4018de:	b8 48 89 e0 c3       	mov    $0xc3e08948,%eax
  4018e3:	c3                   	retq   

00000000004018e4 <getval_399>:
  4018e4:	b8 48 89 e0 91       	mov    $0x91e08948,%eax
  4018e9:	c3                   	retq   

00000000004018ea <addval_280>:
  4018ea:	8d 87 89 c2 c4 d2    	lea    -0x2d3b3d77(%rdi),%eax
  4018f0:	c3                   	retq   

00000000004018f1 <setval_205>:
  4018f1:	c7 07 48 89 e0 c3    	movl   $0xc3e08948,(%rdi)
  4018f7:	c3                   	retq   

00000000004018f8 <addval_422>:
  4018f8:	8d 87 89 ce a4 c0    	lea    -0x3f5b3177(%rdi),%eax
  4018fe:	c3                   	retq   

00000000004018ff <addval_131>:
  4018ff:	8d 87 fc a9 c2 90    	lea    -0x6f3d5604(%rdi),%eax
  401905:	c3                   	retq   

0000000000401906 <setval_150>:
  401906:	c7 07 99 ce 38 c0    	movl   $0xc038ce99,(%rdi)
  40190c:	c3                   	retq   

000000000040190d <setval_367>:
  40190d:	c7 07 58 89 e0 90    	movl   $0x90e08958,(%rdi)
  401913:	c3                   	retq   

0000000000401914 <addval_281>:
  401914:	8d 87 f0 48 81 e0    	lea    -0x1f7eb710(%rdi),%eax
  40191a:	c3                   	retq   

000000000040191b <setval_441>:
  40191b:	c7 07 89 d1 08 db    	movl   $0xdb08d189,(%rdi)
  401921:	c3                   	retq   

0000000000401922 <setval_100>:
  401922:	c7 07 c8 89 e0 c3    	movl   $0xc3e089c8,(%rdi)
  401928:	c3                   	retq   

0000000000401929 <addval_109>:
  401929:	8d 87 89 d1 90 c1    	lea    -0x3e6f2e77(%rdi),%eax
  40192f:	c3                   	retq   

0000000000401930 <addval_402>:
  401930:	8d 87 48 89 e0 c2    	lea    -0x3d1f76b8(%rdi),%eax
  401936:	c3                   	retq   

0000000000401937 <addval_259>:
  401937:	8d 87 89 c2 28 d2    	lea    -0x2dd73d77(%rdi),%eax
  40193d:	c3                   	retq   

000000000040193e <addval_102>:
  40193e:	8d 87 81 d1 84 d2    	lea    -0x2d7b2e7f(%rdi),%eax
  401944:	c3                   	retq   

0000000000401945 <setval_360>:
  401945:	c7 07 88 c2 20 d2    	movl   $0xd220c288,(%rdi)
  40194b:	c3                   	retq   

000000000040194c <setval_338>:
  40194c:	c7 07 48 89 e0 c7    	movl   $0xc7e08948,(%rdi)
  401952:	c3                   	retq   

0000000000401953 <setval_492>:
  401953:	c7 07 89 ce c7 f6    	movl   $0xf6c7ce89,(%rdi)
  401959:	c3                   	retq   

000000000040195a <getval_414>:
  40195a:	b8 a9 d1 c3 9b       	mov    $0x9bc3d1a9,%eax
  40195f:	c3                   	retq   

0000000000401960 <setval_121>:
  401960:	c7 07 88 ce 38 db    	movl   $0xdb38ce88,(%rdi)
  401966:	c3                   	retq   

0000000000401967 <addval_442>:
  401967:	8d 87 89 d1 90 90    	lea    -0x6f6f2e77(%rdi),%eax
  40196d:	c3                   	retq   

000000000040196e <getval_391>:
  40196e:	b8 89 ce 00 db       	mov    $0xdb00ce89,%eax
  401973:	c3                   	retq   

0000000000401974 <addval_466>:
  401974:	8d 87 89 ce 90 c3    	lea    -0x3c6f3177(%rdi),%eax
  40197a:	c3                   	retq   

000000000040197b <getval_287>:
  40197b:	b8 81 89 ce 90       	mov    $0x90ce8981,%eax
  401980:	c3                   	retq   

0000000000401981 <end_farm>:
  401981:	b8 01 00 00 00       	mov    $0x1,%eax
  401986:	c3                   	retq   

0000000000401987 <save_char>:
  401987:	8b 05 97 47 20 00    	mov    0x204797(%rip),%eax        # 606124 <gets_cnt>
  40198d:	3d ff 03 00 00       	cmp    $0x3ff,%eax
  401992:	7f 4a                	jg     4019de <save_char+0x57>
  401994:	8d 14 40             	lea    (%rax,%rax,2),%edx
  401997:	89 f9                	mov    %edi,%ecx
  401999:	c0 e9 04             	shr    $0x4,%cl
  40199c:	4c 8d 05 fd 19 00 00 	lea    0x19fd(%rip),%r8        # 4033a0 <trans_char>
  4019a3:	83 e1 0f             	and    $0xf,%ecx
  4019a6:	45 0f b6 0c 08       	movzbl (%r8,%rcx,1),%r9d
  4019ab:	48 8d 0d 6e 3b 20 00 	lea    0x203b6e(%rip),%rcx        # 605520 <gets_buf>
  4019b2:	48 63 f2             	movslq %edx,%rsi
  4019b5:	44 88 0c 31          	mov    %r9b,(%rcx,%rsi,1)
  4019b9:	8d 72 01             	lea    0x1(%rdx),%esi
  4019bc:	83 e7 0f             	and    $0xf,%edi
  4019bf:	41 0f b6 3c 38       	movzbl (%r8,%rdi,1),%edi
  4019c4:	48 63 f6             	movslq %esi,%rsi
  4019c7:	40 88 3c 31          	mov    %dil,(%rcx,%rsi,1)
  4019cb:	83 c2 02             	add    $0x2,%edx
  4019ce:	48 63 d2             	movslq %edx,%rdx
  4019d1:	c6 04 11 20          	movb   $0x20,(%rcx,%rdx,1)
  4019d5:	83 c0 01             	add    $0x1,%eax
  4019d8:	89 05 46 47 20 00    	mov    %eax,0x204746(%rip)        # 606124 <gets_cnt>
  4019de:	f3 c3                	repz retq 

00000000004019e0 <save_term>:
  4019e0:	8b 05 3e 47 20 00    	mov    0x20473e(%rip),%eax        # 606124 <gets_cnt>
  4019e6:	8d 04 40             	lea    (%rax,%rax,2),%eax
  4019e9:	48 98                	cltq   
  4019eb:	48 8d 15 2e 3b 20 00 	lea    0x203b2e(%rip),%rdx        # 605520 <gets_buf>
  4019f2:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
  4019f6:	c3                   	retq   

00000000004019f7 <check_fail>:
  4019f7:	48 83 ec 08          	sub    $0x8,%rsp
  4019fb:	0f be 35 26 47 20 00 	movsbl 0x204726(%rip),%esi        # 606128 <target_prefix>
  401a02:	48 8d 0d 17 3b 20 00 	lea    0x203b17(%rip),%rcx        # 605520 <gets_buf>
  401a09:	8b 15 e9 3a 20 00    	mov    0x203ae9(%rip),%edx        # 6054f8 <check_level>
  401a0f:	48 8d 3d 8d 16 00 00 	lea    0x168d(%rip),%rdi        # 4030a3 <_IO_stdin_used+0x3b3>
  401a16:	b8 00 00 00 00       	mov    $0x0,%eax
  401a1b:	e8 40 f2 ff ff       	callq  400c60 <printf@plt>
  401a20:	bf 01 00 00 00       	mov    $0x1,%edi
  401a25:	e8 86 f3 ff ff       	callq  400db0 <exit@plt>

0000000000401a2a <Gets>:
  401a2a:	41 54                	push   %r12
  401a2c:	55                   	push   %rbp
  401a2d:	53                   	push   %rbx
  401a2e:	49 89 fc             	mov    %rdi,%r12
  401a31:	c7 05 e9 46 20 00 00 	movl   $0x0,0x2046e9(%rip)        # 606124 <gets_cnt>
  401a38:	00 00 00 
  401a3b:	48 89 fb             	mov    %rdi,%rbx
  401a3e:	eb 11                	jmp    401a51 <Gets+0x27>
  401a40:	48 8d 6b 01          	lea    0x1(%rbx),%rbp
  401a44:	88 03                	mov    %al,(%rbx)
  401a46:	0f b6 f8             	movzbl %al,%edi
  401a49:	e8 39 ff ff ff       	callq  401987 <save_char>
  401a4e:	48 89 eb             	mov    %rbp,%rbx
  401a51:	48 8b 3d 98 3a 20 00 	mov    0x203a98(%rip),%rdi        # 6054f0 <infile>
  401a58:	e8 c3 f2 ff ff       	callq  400d20 <_IO_getc@plt>
  401a5d:	83 f8 ff             	cmp    $0xffffffff,%eax
  401a60:	74 05                	je     401a67 <Gets+0x3d>
  401a62:	83 f8 0a             	cmp    $0xa,%eax
  401a65:	75 d9                	jne    401a40 <Gets+0x16>
  401a67:	c6 03 00             	movb   $0x0,(%rbx)
  401a6a:	b8 00 00 00 00       	mov    $0x0,%eax
  401a6f:	e8 6c ff ff ff       	callq  4019e0 <save_term>
  401a74:	4c 89 e0             	mov    %r12,%rax
  401a77:	5b                   	pop    %rbx
  401a78:	5d                   	pop    %rbp
  401a79:	41 5c                	pop    %r12
  401a7b:	c3                   	retq   

0000000000401a7c <notify_server>:
  401a7c:	83 3d 85 3a 20 00 00 	cmpl   $0x0,0x203a85(%rip)        # 605508 <is_checker>
  401a83:	0f 85 de 00 00 00    	jne    401b67 <notify_server+0xeb>
  401a89:	55                   	push   %rbp
  401a8a:	53                   	push   %rbx
  401a8b:	48 81 ec 08 40 00 00 	sub    $0x4008,%rsp
  401a92:	89 fb                	mov    %edi,%ebx
  401a94:	8b 05 8a 46 20 00    	mov    0x20468a(%rip),%eax        # 606124 <gets_cnt>
  401a9a:	83 c0 64             	add    $0x64,%eax
  401a9d:	3d 00 20 00 00       	cmp    $0x2000,%eax
  401aa2:	0f 8f c1 00 00 00    	jg     401b69 <notify_server+0xed>
  401aa8:	44 0f be 0d 78 46 20 	movsbl 0x204678(%rip),%r9d        # 606128 <target_prefix>
  401aaf:	00 
  401ab0:	83 3d d1 39 20 00 00 	cmpl   $0x0,0x2039d1(%rip)        # 605488 <notify>
  401ab7:	0f 84 c7 00 00 00    	je     401b84 <notify_server+0x108>
  401abd:	44 8b 05 3c 3a 20 00 	mov    0x203a3c(%rip),%r8d        # 605500 <authkey>
  401ac4:	85 db                	test   %ebx,%ebx
  401ac6:	0f 84 c3 00 00 00    	je     401b8f <notify_server+0x113>
  401acc:	48 8d 2d e6 15 00 00 	lea    0x15e6(%rip),%rbp        # 4030b9 <_IO_stdin_used+0x3c9>
  401ad3:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  401ada:	00 
  401adb:	48 8d 05 3e 3a 20 00 	lea    0x203a3e(%rip),%rax        # 605520 <gets_buf>
  401ae2:	50                   	push   %rax
  401ae3:	56                   	push   %rsi
  401ae4:	48 89 e9             	mov    %rbp,%rcx
  401ae7:	8b 15 43 36 20 00    	mov    0x203643(%rip),%edx        # 605130 <target_id>
  401aed:	48 8d 35 cf 15 00 00 	lea    0x15cf(%rip),%rsi        # 4030c3 <_IO_stdin_used+0x3d3>
  401af4:	b8 00 00 00 00       	mov    $0x0,%eax
  401af9:	e8 a2 f2 ff ff       	callq  400da0 <sprintf@plt>
  401afe:	48 83 c4 10          	add    $0x10,%rsp
  401b02:	83 3d 7f 39 20 00 00 	cmpl   $0x0,0x20397f(%rip)        # 605488 <notify>
  401b09:	0f 84 b8 00 00 00    	je     401bc7 <notify_server+0x14b>
  401b0f:	85 db                	test   %ebx,%ebx
  401b11:	0f 84 a2 00 00 00    	je     401bb9 <notify_server+0x13d>
  401b17:	48 8d 8c 24 00 20 00 	lea    0x2000(%rsp),%rcx
  401b1e:	00 
  401b1f:	49 89 e1             	mov    %rsp,%r9
  401b22:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401b28:	48 8b 15 19 36 20 00 	mov    0x203619(%rip),%rdx        # 605148 <lab>
  401b2f:	48 8b 35 1a 36 20 00 	mov    0x20361a(%rip),%rsi        # 605150 <course>
  401b36:	48 8b 3d 03 36 20 00 	mov    0x203603(%rip),%rdi        # 605140 <user_id>
  401b3d:	e8 6e 10 00 00       	callq  402bb0 <driver_post>
  401b42:	85 c0                	test   %eax,%eax
  401b44:	78 55                	js     401b9b <notify_server+0x11f>
  401b46:	48 8d 3d bb 16 00 00 	lea    0x16bb(%rip),%rdi        # 403208 <_IO_stdin_used+0x518>
  401b4d:	e8 de f0 ff ff       	callq  400c30 <puts@plt>
  401b52:	48 8d 3d 92 15 00 00 	lea    0x1592(%rip),%rdi        # 4030eb <_IO_stdin_used+0x3fb>
  401b59:	e8 d2 f0 ff ff       	callq  400c30 <puts@plt>
  401b5e:	48 81 c4 08 40 00 00 	add    $0x4008,%rsp
  401b65:	5b                   	pop    %rbx
  401b66:	5d                   	pop    %rbp
  401b67:	f3 c3                	repz retq 
  401b69:	48 8d 3d 68 16 00 00 	lea    0x1668(%rip),%rdi        # 4031d8 <_IO_stdin_used+0x4e8>
  401b70:	b8 00 00 00 00       	mov    $0x0,%eax
  401b75:	e8 e6 f0 ff ff       	callq  400c60 <printf@plt>
  401b7a:	bf 01 00 00 00       	mov    $0x1,%edi
  401b7f:	e8 2c f2 ff ff       	callq  400db0 <exit@plt>
  401b84:	41 b8 ff ff ff ff    	mov    $0xffffffff,%r8d
  401b8a:	e9 35 ff ff ff       	jmpq   401ac4 <notify_server+0x48>
  401b8f:	48 8d 2d 28 15 00 00 	lea    0x1528(%rip),%rbp        # 4030be <_IO_stdin_used+0x3ce>
  401b96:	e9 38 ff ff ff       	jmpq   401ad3 <notify_server+0x57>
  401b9b:	48 89 e6             	mov    %rsp,%rsi
  401b9e:	48 8d 3d 3a 15 00 00 	lea    0x153a(%rip),%rdi        # 4030df <_IO_stdin_used+0x3ef>
  401ba5:	b8 00 00 00 00       	mov    $0x0,%eax
  401baa:	e8 b1 f0 ff ff       	callq  400c60 <printf@plt>
  401baf:	bf 01 00 00 00       	mov    $0x1,%edi
  401bb4:	e8 f7 f1 ff ff       	callq  400db0 <exit@plt>
  401bb9:	48 8d 3d 35 15 00 00 	lea    0x1535(%rip),%rdi        # 4030f5 <_IO_stdin_used+0x405>
  401bc0:	e8 6b f0 ff ff       	callq  400c30 <puts@plt>
  401bc5:	eb 97                	jmp    401b5e <notify_server+0xe2>
  401bc7:	48 89 ee             	mov    %rbp,%rsi
  401bca:	48 8d 3d 6f 16 00 00 	lea    0x166f(%rip),%rdi        # 403240 <_IO_stdin_used+0x550>
  401bd1:	b8 00 00 00 00       	mov    $0x0,%eax
  401bd6:	e8 85 f0 ff ff       	callq  400c60 <printf@plt>
  401bdb:	48 8b 35 5e 35 20 00 	mov    0x20355e(%rip),%rsi        # 605140 <user_id>
  401be2:	48 8d 3d 13 15 00 00 	lea    0x1513(%rip),%rdi        # 4030fc <_IO_stdin_used+0x40c>
  401be9:	b8 00 00 00 00       	mov    $0x0,%eax
  401bee:	e8 6d f0 ff ff       	callq  400c60 <printf@plt>
  401bf3:	48 8b 35 56 35 20 00 	mov    0x203556(%rip),%rsi        # 605150 <course>
  401bfa:	48 8d 3d 08 15 00 00 	lea    0x1508(%rip),%rdi        # 403109 <_IO_stdin_used+0x419>
  401c01:	b8 00 00 00 00       	mov    $0x0,%eax
  401c06:	e8 55 f0 ff ff       	callq  400c60 <printf@plt>
  401c0b:	48 8b 35 36 35 20 00 	mov    0x203536(%rip),%rsi        # 605148 <lab>
  401c12:	48 8d 3d fc 14 00 00 	lea    0x14fc(%rip),%rdi        # 403115 <_IO_stdin_used+0x425>
  401c19:	b8 00 00 00 00       	mov    $0x0,%eax
  401c1e:	e8 3d f0 ff ff       	callq  400c60 <printf@plt>
  401c23:	48 8d b4 24 00 20 00 	lea    0x2000(%rsp),%rsi
  401c2a:	00 
  401c2b:	48 8d 3d ec 14 00 00 	lea    0x14ec(%rip),%rdi        # 40311e <_IO_stdin_used+0x42e>
  401c32:	b8 00 00 00 00       	mov    $0x0,%eax
  401c37:	e8 24 f0 ff ff       	callq  400c60 <printf@plt>
  401c3c:	e9 1d ff ff ff       	jmpq   401b5e <notify_server+0xe2>

0000000000401c41 <validate>:
  401c41:	53                   	push   %rbx
  401c42:	89 fb                	mov    %edi,%ebx
  401c44:	83 3d bd 38 20 00 00 	cmpl   $0x0,0x2038bd(%rip)        # 605508 <is_checker>
  401c4b:	74 68                	je     401cb5 <validate+0x74>
  401c4d:	39 3d a9 38 20 00    	cmp    %edi,0x2038a9(%rip)        # 6054fc <vlevel>
  401c53:	75 2d                	jne    401c82 <validate+0x41>
  401c55:	8b 35 9d 38 20 00    	mov    0x20389d(%rip),%esi        # 6054f8 <check_level>
  401c5b:	39 f7                	cmp    %esi,%edi
  401c5d:	75 39                	jne    401c98 <validate+0x57>
  401c5f:	0f be 35 c2 44 20 00 	movsbl 0x2044c2(%rip),%esi        # 606128 <target_prefix>
  401c66:	48 8d 0d b3 38 20 00 	lea    0x2038b3(%rip),%rcx        # 605520 <gets_buf>
  401c6d:	89 fa                	mov    %edi,%edx
  401c6f:	48 8d 3d d2 14 00 00 	lea    0x14d2(%rip),%rdi        # 403148 <_IO_stdin_used+0x458>
  401c76:	b8 00 00 00 00       	mov    $0x0,%eax
  401c7b:	e8 e0 ef ff ff       	callq  400c60 <printf@plt>
  401c80:	5b                   	pop    %rbx
  401c81:	c3                   	retq   
  401c82:	48 8d 3d a1 14 00 00 	lea    0x14a1(%rip),%rdi        # 40312a <_IO_stdin_used+0x43a>
  401c89:	e8 a2 ef ff ff       	callq  400c30 <puts@plt>
  401c8e:	b8 00 00 00 00       	mov    $0x0,%eax
  401c93:	e8 5f fd ff ff       	callq  4019f7 <check_fail>
  401c98:	89 fa                	mov    %edi,%edx
  401c9a:	48 8d 3d c7 15 00 00 	lea    0x15c7(%rip),%rdi        # 403268 <_IO_stdin_used+0x578>
  401ca1:	b8 00 00 00 00       	mov    $0x0,%eax
  401ca6:	e8 b5 ef ff ff       	callq  400c60 <printf@plt>
  401cab:	b8 00 00 00 00       	mov    $0x0,%eax
  401cb0:	e8 42 fd ff ff       	callq  4019f7 <check_fail>
  401cb5:	3b 3d 41 38 20 00    	cmp    0x203841(%rip),%edi        # 6054fc <vlevel>
  401cbb:	74 1a                	je     401cd7 <validate+0x96>
  401cbd:	48 8d 3d 66 14 00 00 	lea    0x1466(%rip),%rdi        # 40312a <_IO_stdin_used+0x43a>
  401cc4:	e8 67 ef ff ff       	callq  400c30 <puts@plt>
  401cc9:	89 de                	mov    %ebx,%esi
  401ccb:	bf 00 00 00 00       	mov    $0x0,%edi
  401cd0:	e8 a7 fd ff ff       	callq  401a7c <notify_server>
  401cd5:	eb a9                	jmp    401c80 <validate+0x3f>
  401cd7:	0f be 15 4a 44 20 00 	movsbl 0x20444a(%rip),%edx        # 606128 <target_prefix>
  401cde:	89 fe                	mov    %edi,%esi
  401ce0:	48 8d 3d a9 15 00 00 	lea    0x15a9(%rip),%rdi        # 403290 <_IO_stdin_used+0x5a0>
  401ce7:	b8 00 00 00 00       	mov    $0x0,%eax
  401cec:	e8 6f ef ff ff       	callq  400c60 <printf@plt>
  401cf1:	89 de                	mov    %ebx,%esi
  401cf3:	bf 01 00 00 00       	mov    $0x1,%edi
  401cf8:	e8 7f fd ff ff       	callq  401a7c <notify_server>
  401cfd:	eb 81                	jmp    401c80 <validate+0x3f>

0000000000401cff <fail>:
  401cff:	48 83 ec 08          	sub    $0x8,%rsp
  401d03:	83 3d fe 37 20 00 00 	cmpl   $0x0,0x2037fe(%rip)        # 605508 <is_checker>
  401d0a:	75 11                	jne    401d1d <fail+0x1e>
  401d0c:	89 fe                	mov    %edi,%esi
  401d0e:	bf 00 00 00 00       	mov    $0x0,%edi
  401d13:	e8 64 fd ff ff       	callq  401a7c <notify_server>
  401d18:	48 83 c4 08          	add    $0x8,%rsp
  401d1c:	c3                   	retq   
  401d1d:	b8 00 00 00 00       	mov    $0x0,%eax
  401d22:	e8 d0 fc ff ff       	callq  4019f7 <check_fail>

0000000000401d27 <bushandler>:
  401d27:	48 83 ec 08          	sub    $0x8,%rsp
  401d2b:	83 3d d6 37 20 00 00 	cmpl   $0x0,0x2037d6(%rip)        # 605508 <is_checker>
  401d32:	74 16                	je     401d4a <bushandler+0x23>
  401d34:	48 8d 3d 22 14 00 00 	lea    0x1422(%rip),%rdi        # 40315d <_IO_stdin_used+0x46d>
  401d3b:	e8 f0 ee ff ff       	callq  400c30 <puts@plt>
  401d40:	b8 00 00 00 00       	mov    $0x0,%eax
  401d45:	e8 ad fc ff ff       	callq  4019f7 <check_fail>
  401d4a:	48 8d 3d 77 15 00 00 	lea    0x1577(%rip),%rdi        # 4032c8 <_IO_stdin_used+0x5d8>
  401d51:	e8 da ee ff ff       	callq  400c30 <puts@plt>
  401d56:	48 8d 3d 0a 14 00 00 	lea    0x140a(%rip),%rdi        # 403167 <_IO_stdin_used+0x477>
  401d5d:	e8 ce ee ff ff       	callq  400c30 <puts@plt>
  401d62:	be 00 00 00 00       	mov    $0x0,%esi
  401d67:	bf 00 00 00 00       	mov    $0x0,%edi
  401d6c:	e8 0b fd ff ff       	callq  401a7c <notify_server>
  401d71:	bf 01 00 00 00       	mov    $0x1,%edi
  401d76:	e8 35 f0 ff ff       	callq  400db0 <exit@plt>

0000000000401d7b <seghandler>:
  401d7b:	48 83 ec 08          	sub    $0x8,%rsp
  401d7f:	83 3d 82 37 20 00 00 	cmpl   $0x0,0x203782(%rip)        # 605508 <is_checker>
  401d86:	74 16                	je     401d9e <seghandler+0x23>
  401d88:	48 8d 3d ee 13 00 00 	lea    0x13ee(%rip),%rdi        # 40317d <_IO_stdin_used+0x48d>
  401d8f:	e8 9c ee ff ff       	callq  400c30 <puts@plt>
  401d94:	b8 00 00 00 00       	mov    $0x0,%eax
  401d99:	e8 59 fc ff ff       	callq  4019f7 <check_fail>
  401d9e:	48 8d 3d 43 15 00 00 	lea    0x1543(%rip),%rdi        # 4032e8 <_IO_stdin_used+0x5f8>
  401da5:	e8 86 ee ff ff       	callq  400c30 <puts@plt>
  401daa:	48 8d 3d b6 13 00 00 	lea    0x13b6(%rip),%rdi        # 403167 <_IO_stdin_used+0x477>
  401db1:	e8 7a ee ff ff       	callq  400c30 <puts@plt>
  401db6:	be 00 00 00 00       	mov    $0x0,%esi
  401dbb:	bf 00 00 00 00       	mov    $0x0,%edi
  401dc0:	e8 b7 fc ff ff       	callq  401a7c <notify_server>
  401dc5:	bf 01 00 00 00       	mov    $0x1,%edi
  401dca:	e8 e1 ef ff ff       	callq  400db0 <exit@plt>

0000000000401dcf <illegalhandler>:
  401dcf:	48 83 ec 08          	sub    $0x8,%rsp
  401dd3:	83 3d 2e 37 20 00 00 	cmpl   $0x0,0x20372e(%rip)        # 605508 <is_checker>
  401dda:	74 16                	je     401df2 <illegalhandler+0x23>
  401ddc:	48 8d 3d ad 13 00 00 	lea    0x13ad(%rip),%rdi        # 403190 <_IO_stdin_used+0x4a0>
  401de3:	e8 48 ee ff ff       	callq  400c30 <puts@plt>
  401de8:	b8 00 00 00 00       	mov    $0x0,%eax
  401ded:	e8 05 fc ff ff       	callq  4019f7 <check_fail>
  401df2:	48 8d 3d 17 15 00 00 	lea    0x1517(%rip),%rdi        # 403310 <_IO_stdin_used+0x620>
  401df9:	e8 32 ee ff ff       	callq  400c30 <puts@plt>
  401dfe:	48 8d 3d 62 13 00 00 	lea    0x1362(%rip),%rdi        # 403167 <_IO_stdin_used+0x477>
  401e05:	e8 26 ee ff ff       	callq  400c30 <puts@plt>
  401e0a:	be 00 00 00 00       	mov    $0x0,%esi
  401e0f:	bf 00 00 00 00       	mov    $0x0,%edi
  401e14:	e8 63 fc ff ff       	callq  401a7c <notify_server>
  401e19:	bf 01 00 00 00       	mov    $0x1,%edi
  401e1e:	e8 8d ef ff ff       	callq  400db0 <exit@plt>

0000000000401e23 <sigalrmhandler>:
  401e23:	48 83 ec 08          	sub    $0x8,%rsp
  401e27:	83 3d da 36 20 00 00 	cmpl   $0x0,0x2036da(%rip)        # 605508 <is_checker>
  401e2e:	74 16                	je     401e46 <sigalrmhandler+0x23>
  401e30:	48 8d 3d 6d 13 00 00 	lea    0x136d(%rip),%rdi        # 4031a4 <_IO_stdin_used+0x4b4>
  401e37:	e8 f4 ed ff ff       	callq  400c30 <puts@plt>
  401e3c:	b8 00 00 00 00       	mov    $0x0,%eax
  401e41:	e8 b1 fb ff ff       	callq  4019f7 <check_fail>
  401e46:	be 05 00 00 00       	mov    $0x5,%esi
  401e4b:	48 8d 3d ee 14 00 00 	lea    0x14ee(%rip),%rdi        # 403340 <_IO_stdin_used+0x650>
  401e52:	b8 00 00 00 00       	mov    $0x0,%eax
  401e57:	e8 04 ee ff ff       	callq  400c60 <printf@plt>
  401e5c:	be 00 00 00 00       	mov    $0x0,%esi
  401e61:	bf 00 00 00 00       	mov    $0x0,%edi
  401e66:	e8 11 fc ff ff       	callq  401a7c <notify_server>
  401e6b:	bf 01 00 00 00       	mov    $0x1,%edi
  401e70:	e8 3b ef ff ff       	callq  400db0 <exit@plt>

0000000000401e75 <launch>:
  401e75:	55                   	push   %rbp
  401e76:	48 89 e5             	mov    %rsp,%rbp
  401e79:	48 89 fa             	mov    %rdi,%rdx
  401e7c:	48 8d 47 1e          	lea    0x1e(%rdi),%rax
  401e80:	48 83 e0 f0          	and    $0xfffffffffffffff0,%rax
  401e84:	48 29 c4             	sub    %rax,%rsp
  401e87:	48 8d 7c 24 0f       	lea    0xf(%rsp),%rdi
  401e8c:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
  401e90:	be f4 00 00 00       	mov    $0xf4,%esi
  401e95:	e8 d6 ed ff ff       	callq  400c70 <memset@plt>
  401e9a:	48 8b 05 ff 35 20 00 	mov    0x2035ff(%rip),%rax        # 6054a0 <stdin@@GLIBC_2.2.5>
  401ea1:	48 39 05 48 36 20 00 	cmp    %rax,0x203648(%rip)        # 6054f0 <infile>
  401ea8:	74 2b                	je     401ed5 <launch+0x60>
  401eaa:	c7 05 48 36 20 00 00 	movl   $0x0,0x203648(%rip)        # 6054fc <vlevel>
  401eb1:	00 00 00 
  401eb4:	b8 00 00 00 00       	mov    $0x0,%eax
  401eb9:	e8 81 f9 ff ff       	callq  40183f <test>
  401ebe:	83 3d 43 36 20 00 00 	cmpl   $0x0,0x203643(%rip)        # 605508 <is_checker>
  401ec5:	75 21                	jne    401ee8 <launch+0x73>
  401ec7:	48 8d 3d f6 12 00 00 	lea    0x12f6(%rip),%rdi        # 4031c4 <_IO_stdin_used+0x4d4>
  401ece:	e8 5d ed ff ff       	callq  400c30 <puts@plt>
  401ed3:	c9                   	leaveq 
  401ed4:	c3                   	retq   
  401ed5:	48 8d 3d d0 12 00 00 	lea    0x12d0(%rip),%rdi        # 4031ac <_IO_stdin_used+0x4bc>
  401edc:	b8 00 00 00 00       	mov    $0x0,%eax
  401ee1:	e8 7a ed ff ff       	callq  400c60 <printf@plt>
  401ee6:	eb c2                	jmp    401eaa <launch+0x35>
  401ee8:	48 8d 3d ca 12 00 00 	lea    0x12ca(%rip),%rdi        # 4031b9 <_IO_stdin_used+0x4c9>
  401eef:	e8 3c ed ff ff       	callq  400c30 <puts@plt>
  401ef4:	b8 00 00 00 00       	mov    $0x0,%eax
  401ef9:	e8 f9 fa ff ff       	callq  4019f7 <check_fail>

0000000000401efe <stable_launch>:
  401efe:	53                   	push   %rbx
  401eff:	48 89 3d e2 35 20 00 	mov    %rdi,0x2035e2(%rip)        # 6054e8 <global_offset>
  401f06:	41 b9 00 00 00 00    	mov    $0x0,%r9d
  401f0c:	41 b8 00 00 00 00    	mov    $0x0,%r8d
  401f12:	b9 32 01 00 00       	mov    $0x132,%ecx
  401f17:	ba 07 00 00 00       	mov    $0x7,%edx
  401f1c:	be 00 00 10 00       	mov    $0x100000,%esi
  401f21:	bf 00 60 58 55       	mov    $0x55586000,%edi
  401f26:	e8 25 ed ff ff       	callq  400c50 <mmap@plt>
  401f2b:	48 89 c3             	mov    %rax,%rbx
  401f2e:	48 3d 00 60 58 55    	cmp    $0x55586000,%rax
  401f34:	75 43                	jne    401f79 <stable_launch+0x7b>
  401f36:	48 8d 90 f8 ff 0f 00 	lea    0xffff8(%rax),%rdx
  401f3d:	48 89 15 ec 41 20 00 	mov    %rdx,0x2041ec(%rip)        # 606130 <stack_top>
  401f44:	48 89 e0             	mov    %rsp,%rax
  401f47:	48 89 d4             	mov    %rdx,%rsp
  401f4a:	48 89 c2             	mov    %rax,%rdx
  401f4d:	48 89 15 8c 35 20 00 	mov    %rdx,0x20358c(%rip)        # 6054e0 <global_save_stack>
  401f54:	48 8b 3d 8d 35 20 00 	mov    0x20358d(%rip),%rdi        # 6054e8 <global_offset>
  401f5b:	e8 15 ff ff ff       	callq  401e75 <launch>
  401f60:	48 8b 05 79 35 20 00 	mov    0x203579(%rip),%rax        # 6054e0 <global_save_stack>
  401f67:	48 89 c4             	mov    %rax,%rsp
  401f6a:	be 00 00 10 00       	mov    $0x100000,%esi
  401f6f:	48 89 df             	mov    %rbx,%rdi
  401f72:	e8 c9 ed ff ff       	callq  400d40 <munmap@plt>
  401f77:	5b                   	pop    %rbx
  401f78:	c3                   	retq   
  401f79:	be 00 00 10 00       	mov    $0x100000,%esi
  401f7e:	48 89 c7             	mov    %rax,%rdi
  401f81:	e8 ba ed ff ff       	callq  400d40 <munmap@plt>
  401f86:	ba 00 60 58 55       	mov    $0x55586000,%edx
  401f8b:	48 8d 35 e6 13 00 00 	lea    0x13e6(%rip),%rsi        # 403378 <_IO_stdin_used+0x688>
  401f92:	48 8b 3d 27 35 20 00 	mov    0x203527(%rip),%rdi        # 6054c0 <stderr@@GLIBC_2.2.5>
  401f99:	b8 00 00 00 00       	mov    $0x0,%eax
  401f9e:	e8 2d ed ff ff       	callq  400cd0 <fprintf@plt>
  401fa3:	bf 01 00 00 00       	mov    $0x1,%edi
  401fa8:	e8 03 ee ff ff       	callq  400db0 <exit@plt>

0000000000401fad <rio_readinitb>:
  401fad:	89 37                	mov    %esi,(%rdi)
  401faf:	c7 47 04 00 00 00 00 	movl   $0x0,0x4(%rdi)
  401fb6:	48 8d 47 10          	lea    0x10(%rdi),%rax
  401fba:	48 89 47 08          	mov    %rax,0x8(%rdi)
  401fbe:	c3                   	retq   

0000000000401fbf <sigalrm_handler>:
  401fbf:	48 83 ec 08          	sub    $0x8,%rsp
  401fc3:	ba 00 00 00 00       	mov    $0x0,%edx
  401fc8:	48 8d 35 e1 13 00 00 	lea    0x13e1(%rip),%rsi        # 4033b0 <trans_char+0x10>
  401fcf:	48 8b 3d ea 34 20 00 	mov    0x2034ea(%rip),%rdi        # 6054c0 <stderr@@GLIBC_2.2.5>
  401fd6:	b8 00 00 00 00       	mov    $0x0,%eax
  401fdb:	e8 f0 ec ff ff       	callq  400cd0 <fprintf@plt>
  401fe0:	bf 01 00 00 00       	mov    $0x1,%edi
  401fe5:	e8 c6 ed ff ff       	callq  400db0 <exit@plt>

0000000000401fea <urlencode>:
  401fea:	41 54                	push   %r12
  401fec:	55                   	push   %rbp
  401fed:	53                   	push   %rbx
  401fee:	48 83 ec 10          	sub    $0x10,%rsp
  401ff2:	48 89 fb             	mov    %rdi,%rbx
  401ff5:	48 89 f5             	mov    %rsi,%rbp
  401ff8:	b8 00 00 00 00       	mov    $0x0,%eax
  401ffd:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402004:	f2 ae                	repnz scas %es:(%rdi),%al
  402006:	48 f7 d1             	not    %rcx
  402009:	8d 41 ff             	lea    -0x1(%rcx),%eax
  40200c:	eb 0e                	jmp    40201c <urlencode+0x32>
  40200e:	88 55 00             	mov    %dl,0x0(%rbp)
  402011:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  402015:	48 83 c3 01          	add    $0x1,%rbx
  402019:	44 89 e0             	mov    %r12d,%eax
  40201c:	44 8d 60 ff          	lea    -0x1(%rax),%r12d
  402020:	85 c0                	test   %eax,%eax
  402022:	0f 84 95 00 00 00    	je     4020bd <urlencode+0xd3>
  402028:	0f b6 13             	movzbl (%rbx),%edx
  40202b:	80 fa 2a             	cmp    $0x2a,%dl
  40202e:	0f 94 c1             	sete   %cl
  402031:	80 fa 2d             	cmp    $0x2d,%dl
  402034:	0f 94 c0             	sete   %al
  402037:	08 c1                	or     %al,%cl
  402039:	75 d3                	jne    40200e <urlencode+0x24>
  40203b:	80 fa 2e             	cmp    $0x2e,%dl
  40203e:	74 ce                	je     40200e <urlencode+0x24>
  402040:	80 fa 5f             	cmp    $0x5f,%dl
  402043:	74 c9                	je     40200e <urlencode+0x24>
  402045:	8d 42 d0             	lea    -0x30(%rdx),%eax
  402048:	3c 09                	cmp    $0x9,%al
  40204a:	76 c2                	jbe    40200e <urlencode+0x24>
  40204c:	8d 42 bf             	lea    -0x41(%rdx),%eax
  40204f:	3c 19                	cmp    $0x19,%al
  402051:	76 bb                	jbe    40200e <urlencode+0x24>
  402053:	8d 42 9f             	lea    -0x61(%rdx),%eax
  402056:	3c 19                	cmp    $0x19,%al
  402058:	76 b4                	jbe    40200e <urlencode+0x24>
  40205a:	80 fa 20             	cmp    $0x20,%dl
  40205d:	74 4c                	je     4020ab <urlencode+0xc1>
  40205f:	8d 42 e0             	lea    -0x20(%rdx),%eax
  402062:	3c 5f                	cmp    $0x5f,%al
  402064:	0f 96 c1             	setbe  %cl
  402067:	80 fa 09             	cmp    $0x9,%dl
  40206a:	0f 94 c0             	sete   %al
  40206d:	08 c1                	or     %al,%cl
  40206f:	74 47                	je     4020b8 <urlencode+0xce>
  402071:	0f b6 d2             	movzbl %dl,%edx
  402074:	48 8d 7c 24 08       	lea    0x8(%rsp),%rdi
  402079:	48 8d 35 c8 13 00 00 	lea    0x13c8(%rip),%rsi        # 403448 <trans_char+0xa8>
  402080:	b8 00 00 00 00       	mov    $0x0,%eax
  402085:	e8 16 ed ff ff       	callq  400da0 <sprintf@plt>
  40208a:	0f b6 44 24 08       	movzbl 0x8(%rsp),%eax
  40208f:	88 45 00             	mov    %al,0x0(%rbp)
  402092:	0f b6 44 24 09       	movzbl 0x9(%rsp),%eax
  402097:	88 45 01             	mov    %al,0x1(%rbp)
  40209a:	0f b6 44 24 0a       	movzbl 0xa(%rsp),%eax
  40209f:	88 45 02             	mov    %al,0x2(%rbp)
  4020a2:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  4020a6:	e9 6a ff ff ff       	jmpq   402015 <urlencode+0x2b>
  4020ab:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  4020af:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  4020b3:	e9 5d ff ff ff       	jmpq   402015 <urlencode+0x2b>
  4020b8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4020bd:	48 83 c4 10          	add    $0x10,%rsp
  4020c1:	5b                   	pop    %rbx
  4020c2:	5d                   	pop    %rbp
  4020c3:	41 5c                	pop    %r12
  4020c5:	c3                   	retq   

00000000004020c6 <rio_writen>:
  4020c6:	41 55                	push   %r13
  4020c8:	41 54                	push   %r12
  4020ca:	55                   	push   %rbp
  4020cb:	53                   	push   %rbx
  4020cc:	48 83 ec 08          	sub    $0x8,%rsp
  4020d0:	41 89 fc             	mov    %edi,%r12d
  4020d3:	49 89 d5             	mov    %rdx,%r13
  4020d6:	48 89 f5             	mov    %rsi,%rbp
  4020d9:	48 89 d3             	mov    %rdx,%rbx
  4020dc:	eb 06                	jmp    4020e4 <rio_writen+0x1e>
  4020de:	48 29 c3             	sub    %rax,%rbx
  4020e1:	48 01 c5             	add    %rax,%rbp
  4020e4:	48 85 db             	test   %rbx,%rbx
  4020e7:	74 24                	je     40210d <rio_writen+0x47>
  4020e9:	48 89 da             	mov    %rbx,%rdx
  4020ec:	48 89 ee             	mov    %rbp,%rsi
  4020ef:	44 89 e7             	mov    %r12d,%edi
  4020f2:	e8 49 eb ff ff       	callq  400c40 <write@plt>
  4020f7:	48 85 c0             	test   %rax,%rax
  4020fa:	7f e2                	jg     4020de <rio_writen+0x18>
  4020fc:	e8 ef ea ff ff       	callq  400bf0 <__errno_location@plt>
  402101:	83 38 04             	cmpl   $0x4,(%rax)
  402104:	75 15                	jne    40211b <rio_writen+0x55>
  402106:	b8 00 00 00 00       	mov    $0x0,%eax
  40210b:	eb d1                	jmp    4020de <rio_writen+0x18>
  40210d:	4c 89 e8             	mov    %r13,%rax
  402110:	48 83 c4 08          	add    $0x8,%rsp
  402114:	5b                   	pop    %rbx
  402115:	5d                   	pop    %rbp
  402116:	41 5c                	pop    %r12
  402118:	41 5d                	pop    %r13
  40211a:	c3                   	retq   
  40211b:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  402122:	eb ec                	jmp    402110 <rio_writen+0x4a>

0000000000402124 <rio_read>:
  402124:	41 55                	push   %r13
  402126:	41 54                	push   %r12
  402128:	55                   	push   %rbp
  402129:	53                   	push   %rbx
  40212a:	48 83 ec 08          	sub    $0x8,%rsp
  40212e:	48 89 fb             	mov    %rdi,%rbx
  402131:	49 89 f5             	mov    %rsi,%r13
  402134:	49 89 d4             	mov    %rdx,%r12
  402137:	eb 0a                	jmp    402143 <rio_read+0x1f>
  402139:	e8 b2 ea ff ff       	callq  400bf0 <__errno_location@plt>
  40213e:	83 38 04             	cmpl   $0x4,(%rax)
  402141:	75 5c                	jne    40219f <rio_read+0x7b>
  402143:	8b 6b 04             	mov    0x4(%rbx),%ebp
  402146:	85 ed                	test   %ebp,%ebp
  402148:	7f 24                	jg     40216e <rio_read+0x4a>
  40214a:	48 8d 6b 10          	lea    0x10(%rbx),%rbp
  40214e:	ba 00 20 00 00       	mov    $0x2000,%edx
  402153:	48 89 ee             	mov    %rbp,%rsi
  402156:	8b 3b                	mov    (%rbx),%edi
  402158:	e8 43 eb ff ff       	callq  400ca0 <read@plt>
  40215d:	89 43 04             	mov    %eax,0x4(%rbx)
  402160:	85 c0                	test   %eax,%eax
  402162:	78 d5                	js     402139 <rio_read+0x15>
  402164:	85 c0                	test   %eax,%eax
  402166:	74 40                	je     4021a8 <rio_read+0x84>
  402168:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  40216c:	eb d5                	jmp    402143 <rio_read+0x1f>
  40216e:	89 e8                	mov    %ebp,%eax
  402170:	49 39 c4             	cmp    %rax,%r12
  402173:	77 03                	ja     402178 <rio_read+0x54>
  402175:	44 89 e5             	mov    %r12d,%ebp
  402178:	4c 63 e5             	movslq %ebp,%r12
  40217b:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  40217f:	4c 89 e2             	mov    %r12,%rdx
  402182:	4c 89 ef             	mov    %r13,%rdi
  402185:	e8 66 eb ff ff       	callq  400cf0 <memcpy@plt>
  40218a:	4c 01 63 08          	add    %r12,0x8(%rbx)
  40218e:	29 6b 04             	sub    %ebp,0x4(%rbx)
  402191:	4c 89 e0             	mov    %r12,%rax
  402194:	48 83 c4 08          	add    $0x8,%rsp
  402198:	5b                   	pop    %rbx
  402199:	5d                   	pop    %rbp
  40219a:	41 5c                	pop    %r12
  40219c:	41 5d                	pop    %r13
  40219e:	c3                   	retq   
  40219f:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  4021a6:	eb ec                	jmp    402194 <rio_read+0x70>
  4021a8:	b8 00 00 00 00       	mov    $0x0,%eax
  4021ad:	eb e5                	jmp    402194 <rio_read+0x70>

00000000004021af <rio_readlineb>:
  4021af:	41 55                	push   %r13
  4021b1:	41 54                	push   %r12
  4021b3:	55                   	push   %rbp
  4021b4:	53                   	push   %rbx
  4021b5:	48 83 ec 18          	sub    $0x18,%rsp
  4021b9:	49 89 fd             	mov    %rdi,%r13
  4021bc:	49 89 d4             	mov    %rdx,%r12
  4021bf:	48 89 f5             	mov    %rsi,%rbp
  4021c2:	bb 01 00 00 00       	mov    $0x1,%ebx
  4021c7:	4c 39 e3             	cmp    %r12,%rbx
  4021ca:	73 47                	jae    402213 <rio_readlineb+0x64>
  4021cc:	48 8d 74 24 0f       	lea    0xf(%rsp),%rsi
  4021d1:	ba 01 00 00 00       	mov    $0x1,%edx
  4021d6:	4c 89 ef             	mov    %r13,%rdi
  4021d9:	e8 46 ff ff ff       	callq  402124 <rio_read>
  4021de:	83 f8 01             	cmp    $0x1,%eax
  4021e1:	75 1c                	jne    4021ff <rio_readlineb+0x50>
  4021e3:	48 8d 45 01          	lea    0x1(%rbp),%rax
  4021e7:	0f b6 54 24 0f       	movzbl 0xf(%rsp),%edx
  4021ec:	88 55 00             	mov    %dl,0x0(%rbp)
  4021ef:	80 7c 24 0f 0a       	cmpb   $0xa,0xf(%rsp)
  4021f4:	74 1a                	je     402210 <rio_readlineb+0x61>
  4021f6:	48 83 c3 01          	add    $0x1,%rbx
  4021fa:	48 89 c5             	mov    %rax,%rbp
  4021fd:	eb c8                	jmp    4021c7 <rio_readlineb+0x18>
  4021ff:	85 c0                	test   %eax,%eax
  402201:	75 22                	jne    402225 <rio_readlineb+0x76>
  402203:	48 83 fb 01          	cmp    $0x1,%rbx
  402207:	75 0a                	jne    402213 <rio_readlineb+0x64>
  402209:	b8 00 00 00 00       	mov    $0x0,%eax
  40220e:	eb 0a                	jmp    40221a <rio_readlineb+0x6b>
  402210:	48 89 c5             	mov    %rax,%rbp
  402213:	c6 45 00 00          	movb   $0x0,0x0(%rbp)
  402217:	48 89 d8             	mov    %rbx,%rax
  40221a:	48 83 c4 18          	add    $0x18,%rsp
  40221e:	5b                   	pop    %rbx
  40221f:	5d                   	pop    %rbp
  402220:	41 5c                	pop    %r12
  402222:	41 5d                	pop    %r13
  402224:	c3                   	retq   
  402225:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  40222c:	eb ec                	jmp    40221a <rio_readlineb+0x6b>

000000000040222e <submitr>:
  40222e:	41 57                	push   %r15
  402230:	41 56                	push   %r14
  402232:	41 55                	push   %r13
  402234:	41 54                	push   %r12
  402236:	55                   	push   %rbp
  402237:	53                   	push   %rbx
  402238:	48 81 ec 58 a0 00 00 	sub    $0xa058,%rsp
  40223f:	49 89 fd             	mov    %rdi,%r13
  402242:	89 74 24 14          	mov    %esi,0x14(%rsp)
  402246:	49 89 d7             	mov    %rdx,%r15
  402249:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  40224e:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  402253:	4d 89 ce             	mov    %r9,%r14
  402256:	48 8b 9c 24 90 a0 00 	mov    0xa090(%rsp),%rbx
  40225d:	00 
  40225e:	c7 84 24 2c 20 00 00 	movl   $0x0,0x202c(%rsp)
  402265:	00 00 00 00 
  402269:	ba 00 00 00 00       	mov    $0x0,%edx
  40226e:	be 01 00 00 00       	mov    $0x1,%esi
  402273:	bf 02 00 00 00       	mov    $0x2,%edi
  402278:	e8 53 eb ff ff       	callq  400dd0 <socket@plt>
  40227d:	85 c0                	test   %eax,%eax
  40227f:	0f 88 ca 01 00 00    	js     40244f <submitr+0x221>
  402285:	89 c5                	mov    %eax,%ebp
  402287:	4c 89 ef             	mov    %r13,%rdi
  40228a:	e8 31 ea ff ff       	callq  400cc0 <gethostbyname@plt>
  40228f:	48 85 c0             	test   %rax,%rax
  402292:	0f 84 05 02 00 00    	je     40249d <submitr+0x26f>
  402298:	4c 8d a4 24 40 a0 00 	lea    0xa040(%rsp),%r12
  40229f:	00 
  4022a0:	48 c7 84 24 40 a0 00 	movq   $0x0,0xa040(%rsp)
  4022a7:	00 00 00 00 00 
  4022ac:	48 c7 84 24 48 a0 00 	movq   $0x0,0xa048(%rsp)
  4022b3:	00 00 00 00 00 
  4022b8:	66 c7 84 24 40 a0 00 	movw   $0x2,0xa040(%rsp)
  4022bf:	00 02 00 
  4022c2:	48 8b 48 18          	mov    0x18(%rax),%rcx
  4022c6:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4022ca:	48 8d b4 24 44 a0 00 	lea    0xa044(%rsp),%rsi
  4022d1:	00 
  4022d2:	48 8b 39             	mov    (%rcx),%rdi
  4022d5:	e8 76 ea ff ff       	callq  400d50 <bcopy@plt>
  4022da:	0f b7 44 24 14       	movzwl 0x14(%rsp),%eax
  4022df:	66 c1 c8 08          	ror    $0x8,%ax
  4022e3:	66 89 84 24 42 a0 00 	mov    %ax,0xa042(%rsp)
  4022ea:	00 
  4022eb:	ba 10 00 00 00       	mov    $0x10,%edx
  4022f0:	4c 89 e6             	mov    %r12,%rsi
  4022f3:	89 ef                	mov    %ebp,%edi
  4022f5:	e8 c6 ea ff ff       	callq  400dc0 <connect@plt>
  4022fa:	85 c0                	test   %eax,%eax
  4022fc:	0f 88 02 02 00 00    	js     402504 <submitr+0x2d6>
  402302:	48 c7 c6 ff ff ff ff 	mov    $0xffffffffffffffff,%rsi
  402309:	b8 00 00 00 00       	mov    $0x0,%eax
  40230e:	48 89 f1             	mov    %rsi,%rcx
  402311:	4c 89 f7             	mov    %r14,%rdi
  402314:	f2 ae                	repnz scas %es:(%rdi),%al
  402316:	48 f7 d1             	not    %rcx
  402319:	48 89 ca             	mov    %rcx,%rdx
  40231c:	48 89 f1             	mov    %rsi,%rcx
  40231f:	4c 89 ff             	mov    %r15,%rdi
  402322:	f2 ae                	repnz scas %es:(%rdi),%al
  402324:	48 f7 d1             	not    %rcx
  402327:	49 89 c8             	mov    %rcx,%r8
  40232a:	48 89 f1             	mov    %rsi,%rcx
  40232d:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  402332:	f2 ae                	repnz scas %es:(%rdi),%al
  402334:	48 f7 d1             	not    %rcx
  402337:	4d 8d 44 08 fe       	lea    -0x2(%r8,%rcx,1),%r8
  40233c:	48 89 f1             	mov    %rsi,%rcx
  40233f:	48 8b 7c 24 18       	mov    0x18(%rsp),%rdi
  402344:	f2 ae                	repnz scas %es:(%rdi),%al
  402346:	48 89 c8             	mov    %rcx,%rax
  402349:	48 f7 d0             	not    %rax
  40234c:	49 8d 4c 00 ff       	lea    -0x1(%r8,%rax,1),%rcx
  402351:	48 8d 44 52 fd       	lea    -0x3(%rdx,%rdx,2),%rax
  402356:	48 8d 84 01 80 00 00 	lea    0x80(%rcx,%rax,1),%rax
  40235d:	00 
  40235e:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  402364:	0f 87 f3 01 00 00    	ja     40255d <submitr+0x32f>
  40236a:	48 8d b4 24 30 40 00 	lea    0x4030(%rsp),%rsi
  402371:	00 
  402372:	b9 00 04 00 00       	mov    $0x400,%ecx
  402377:	b8 00 00 00 00       	mov    $0x0,%eax
  40237c:	48 89 f7             	mov    %rsi,%rdi
  40237f:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  402382:	4c 89 f7             	mov    %r14,%rdi
  402385:	e8 60 fc ff ff       	callq  401fea <urlencode>
  40238a:	85 c0                	test   %eax,%eax
  40238c:	0f 88 3d 02 00 00    	js     4025cf <submitr+0x3a1>
  402392:	4c 8d a4 24 30 60 00 	lea    0x6030(%rsp),%r12
  402399:	00 
  40239a:	4d 89 e9             	mov    %r13,%r9
  40239d:	4c 8d 84 24 30 40 00 	lea    0x4030(%rsp),%r8
  4023a4:	00 
  4023a5:	4c 89 f9             	mov    %r15,%rcx
  4023a8:	48 8b 54 24 08       	mov    0x8(%rsp),%rdx
  4023ad:	48 8d 35 24 10 00 00 	lea    0x1024(%rip),%rsi        # 4033d8 <trans_char+0x38>
  4023b4:	4c 89 e7             	mov    %r12,%rdi
  4023b7:	b8 00 00 00 00       	mov    $0x0,%eax
  4023bc:	e8 df e9 ff ff       	callq  400da0 <sprintf@plt>
  4023c1:	b8 00 00 00 00       	mov    $0x0,%eax
  4023c6:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  4023cd:	4c 89 e7             	mov    %r12,%rdi
  4023d0:	f2 ae                	repnz scas %es:(%rdi),%al
  4023d2:	48 f7 d1             	not    %rcx
  4023d5:	48 8d 51 ff          	lea    -0x1(%rcx),%rdx
  4023d9:	4c 89 e6             	mov    %r12,%rsi
  4023dc:	89 ef                	mov    %ebp,%edi
  4023de:	e8 e3 fc ff ff       	callq  4020c6 <rio_writen>
  4023e3:	48 85 c0             	test   %rax,%rax
  4023e6:	0f 88 6d 02 00 00    	js     402659 <submitr+0x42b>
  4023ec:	4c 8d a4 24 30 80 00 	lea    0x8030(%rsp),%r12
  4023f3:	00 
  4023f4:	89 ee                	mov    %ebp,%esi
  4023f6:	4c 89 e7             	mov    %r12,%rdi
  4023f9:	e8 af fb ff ff       	callq  401fad <rio_readinitb>
  4023fe:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402405:	00 
  402406:	ba 00 20 00 00       	mov    $0x2000,%edx
  40240b:	4c 89 e7             	mov    %r12,%rdi
  40240e:	e8 9c fd ff ff       	callq  4021af <rio_readlineb>
  402413:	48 85 c0             	test   %rax,%rax
  402416:	0f 8e ab 02 00 00    	jle    4026c7 <submitr+0x499>
  40241c:	48 8d 8c 24 2c 20 00 	lea    0x202c(%rsp),%rcx
  402423:	00 
  402424:	48 8d 94 24 30 20 00 	lea    0x2030(%rsp),%rdx
  40242b:	00 
  40242c:	48 8d bc 24 30 60 00 	lea    0x6030(%rsp),%rdi
  402433:	00 
  402434:	4c 8d 44 24 20       	lea    0x20(%rsp),%r8
  402439:	48 8d 35 0f 10 00 00 	lea    0x100f(%rip),%rsi        # 40344f <trans_char+0xaf>
  402440:	b8 00 00 00 00       	mov    $0x0,%eax
  402445:	e8 e6 e8 ff ff       	callq  400d30 <__isoc99_sscanf@plt>
  40244a:	e9 9f 03 00 00       	jmpq   4027ee <submitr+0x5c0>
  40244f:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402456:	3a 20 43 
  402459:	48 89 03             	mov    %rax,(%rbx)
  40245c:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402463:	20 75 6e 
  402466:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40246a:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402471:	74 6f 20 
  402474:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402478:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  40247f:	65 20 73 
  402482:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402486:	c7 43 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbx)
  40248d:	66 c7 43 24 74 00    	movw   $0x74,0x24(%rbx)
  402493:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402498:	e9 18 03 00 00       	jmpq   4027b5 <submitr+0x587>
  40249d:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  4024a4:	3a 20 44 
  4024a7:	48 89 03             	mov    %rax,(%rbx)
  4024aa:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  4024b1:	20 75 6e 
  4024b4:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4024b8:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4024bf:	74 6f 20 
  4024c2:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4024c6:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  4024cd:	76 65 20 
  4024d0:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4024d4:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4024db:	72 20 61 
  4024de:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4024e2:	c7 43 28 64 64 72 65 	movl   $0x65726464,0x28(%rbx)
  4024e9:	66 c7 43 2c 73 73    	movw   $0x7373,0x2c(%rbx)
  4024ef:	c6 43 2e 00          	movb   $0x0,0x2e(%rbx)
  4024f3:	89 ef                	mov    %ebp,%edi
  4024f5:	e8 96 e7 ff ff       	callq  400c90 <close@plt>
  4024fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4024ff:	e9 b1 02 00 00       	jmpq   4027b5 <submitr+0x587>
  402504:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  40250b:	3a 20 55 
  40250e:	48 89 03             	mov    %rax,(%rbx)
  402511:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402518:	20 74 6f 
  40251b:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40251f:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402526:	65 63 74 
  402529:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40252d:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  402534:	68 65 20 
  402537:	48 89 43 18          	mov    %rax,0x18(%rbx)
  40253b:	c7 43 20 73 65 72 76 	movl   $0x76726573,0x20(%rbx)
  402542:	66 c7 43 24 65 72    	movw   $0x7265,0x24(%rbx)
  402548:	c6 43 26 00          	movb   $0x0,0x26(%rbx)
  40254c:	89 ef                	mov    %ebp,%edi
  40254e:	e8 3d e7 ff ff       	callq  400c90 <close@plt>
  402553:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402558:	e9 58 02 00 00       	jmpq   4027b5 <submitr+0x587>
  40255d:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  402564:	3a 20 52 
  402567:	48 89 03             	mov    %rax,(%rbx)
  40256a:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402571:	20 73 74 
  402574:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402578:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  40257f:	74 6f 6f 
  402582:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402586:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  40258d:	65 2e 20 
  402590:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402594:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  40259b:	61 73 65 
  40259e:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4025a2:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  4025a9:	49 54 52 
  4025ac:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4025b0:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  4025b7:	55 46 00 
  4025ba:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4025be:	89 ef                	mov    %ebp,%edi
  4025c0:	e8 cb e6 ff ff       	callq  400c90 <close@plt>
  4025c5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4025ca:	e9 e6 01 00 00       	jmpq   4027b5 <submitr+0x587>
  4025cf:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  4025d6:	3a 20 52 
  4025d9:	48 89 03             	mov    %rax,(%rbx)
  4025dc:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  4025e3:	20 73 74 
  4025e6:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4025ea:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  4025f1:	63 6f 6e 
  4025f4:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4025f8:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  4025ff:	20 61 6e 
  402602:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402606:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  40260d:	67 61 6c 
  402610:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402614:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  40261b:	6e 70 72 
  40261e:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402622:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  402629:	6c 65 20 
  40262c:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402630:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  402637:	63 74 65 
  40263a:	48 89 43 38          	mov    %rax,0x38(%rbx)
  40263e:	66 c7 43 40 72 2e    	movw   $0x2e72,0x40(%rbx)
  402644:	c6 43 42 00          	movb   $0x0,0x42(%rbx)
  402648:	89 ef                	mov    %ebp,%edi
  40264a:	e8 41 e6 ff ff       	callq  400c90 <close@plt>
  40264f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402654:	e9 5c 01 00 00       	jmpq   4027b5 <submitr+0x587>
  402659:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402660:	3a 20 43 
  402663:	48 89 03             	mov    %rax,(%rbx)
  402666:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40266d:	20 75 6e 
  402670:	48 89 43 08          	mov    %rax,0x8(%rbx)
  402674:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40267b:	74 6f 20 
  40267e:	48 89 43 10          	mov    %rax,0x10(%rbx)
  402682:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  402689:	20 74 6f 
  40268c:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402690:	48 b8 20 74 68 65 20 	movabs $0x7365722065687420,%rax
  402697:	72 65 73 
  40269a:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40269e:	48 b8 75 6c 74 20 73 	movabs $0x7672657320746c75,%rax
  4026a5:	65 72 76 
  4026a8:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4026ac:	66 c7 43 30 65 72    	movw   $0x7265,0x30(%rbx)
  4026b2:	c6 43 32 00          	movb   $0x0,0x32(%rbx)
  4026b6:	89 ef                	mov    %ebp,%edi
  4026b8:	e8 d3 e5 ff ff       	callq  400c90 <close@plt>
  4026bd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4026c2:	e9 ee 00 00 00       	jmpq   4027b5 <submitr+0x587>
  4026c7:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4026ce:	3a 20 43 
  4026d1:	48 89 03             	mov    %rax,(%rbx)
  4026d4:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4026db:	20 75 6e 
  4026de:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4026e2:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4026e9:	74 6f 20 
  4026ec:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4026f0:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  4026f7:	66 69 72 
  4026fa:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4026fe:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  402705:	61 64 65 
  402708:	48 89 43 20          	mov    %rax,0x20(%rbx)
  40270c:	48 b8 72 20 66 72 6f 	movabs $0x72206d6f72662072,%rax
  402713:	6d 20 72 
  402716:	48 89 43 28          	mov    %rax,0x28(%rbx)
  40271a:	48 b8 65 73 75 6c 74 	movabs $0x657320746c757365,%rax
  402721:	20 73 65 
  402724:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402728:	c7 43 38 72 76 65 72 	movl   $0x72657672,0x38(%rbx)
  40272f:	c6 43 3c 00          	movb   $0x0,0x3c(%rbx)
  402733:	89 ef                	mov    %ebp,%edi
  402735:	e8 56 e5 ff ff       	callq  400c90 <close@plt>
  40273a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40273f:	eb 74                	jmp    4027b5 <submitr+0x587>
  402741:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402748:	3a 20 43 
  40274b:	48 89 03             	mov    %rax,(%rbx)
  40274e:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402755:	20 75 6e 
  402758:	48 89 43 08          	mov    %rax,0x8(%rbx)
  40275c:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402763:	74 6f 20 
  402766:	48 89 43 10          	mov    %rax,0x10(%rbx)
  40276a:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402771:	68 65 61 
  402774:	48 89 43 18          	mov    %rax,0x18(%rbx)
  402778:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  40277f:	66 72 6f 
  402782:	48 89 43 20          	mov    %rax,0x20(%rbx)
  402786:	48 b8 6d 20 74 68 65 	movabs $0x657220656874206d,%rax
  40278d:	20 72 65 
  402790:	48 89 43 28          	mov    %rax,0x28(%rbx)
  402794:	48 b8 73 75 6c 74 20 	movabs $0x72657320746c7573,%rax
  40279b:	73 65 72 
  40279e:	48 89 43 30          	mov    %rax,0x30(%rbx)
  4027a2:	c7 43 38 76 65 72 00 	movl   $0x726576,0x38(%rbx)
  4027a9:	89 ef                	mov    %ebp,%edi
  4027ab:	e8 e0 e4 ff ff       	callq  400c90 <close@plt>
  4027b0:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4027b5:	48 81 c4 58 a0 00 00 	add    $0xa058,%rsp
  4027bc:	5b                   	pop    %rbx
  4027bd:	5d                   	pop    %rbp
  4027be:	41 5c                	pop    %r12
  4027c0:	41 5d                	pop    %r13
  4027c2:	41 5e                	pop    %r14
  4027c4:	41 5f                	pop    %r15
  4027c6:	c3                   	retq   
  4027c7:	85 c0                	test   %eax,%eax
  4027c9:	74 51                	je     40281c <submitr+0x5ee>
  4027cb:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  4027d2:	00 
  4027d3:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  4027da:	00 
  4027db:	ba 00 20 00 00       	mov    $0x2000,%edx
  4027e0:	e8 ca f9 ff ff       	callq  4021af <rio_readlineb>
  4027e5:	48 85 c0             	test   %rax,%rax
  4027e8:	0f 8e 53 ff ff ff    	jle    402741 <submitr+0x513>
  4027ee:	0f b6 94 24 30 60 00 	movzbl 0x6030(%rsp),%edx
  4027f5:	00 
  4027f6:	b8 0d 00 00 00       	mov    $0xd,%eax
  4027fb:	29 d0                	sub    %edx,%eax
  4027fd:	75 c8                	jne    4027c7 <submitr+0x599>
  4027ff:	0f b6 94 24 31 60 00 	movzbl 0x6031(%rsp),%edx
  402806:	00 
  402807:	b8 0a 00 00 00       	mov    $0xa,%eax
  40280c:	29 d0                	sub    %edx,%eax
  40280e:	75 b7                	jne    4027c7 <submitr+0x599>
  402810:	0f b6 84 24 32 60 00 	movzbl 0x6032(%rsp),%eax
  402817:	00 
  402818:	f7 d8                	neg    %eax
  40281a:	eb ab                	jmp    4027c7 <submitr+0x599>
  40281c:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402823:	00 
  402824:	48 8d bc 24 30 80 00 	lea    0x8030(%rsp),%rdi
  40282b:	00 
  40282c:	ba 00 20 00 00       	mov    $0x2000,%edx
  402831:	e8 79 f9 ff ff       	callq  4021af <rio_readlineb>
  402836:	48 85 c0             	test   %rax,%rax
  402839:	7e 67                	jle    4028a2 <submitr+0x674>
  40283b:	8b 94 24 2c 20 00 00 	mov    0x202c(%rsp),%edx
  402842:	81 fa c8 00 00 00    	cmp    $0xc8,%edx
  402848:	0f 85 d7 00 00 00    	jne    402925 <submitr+0x6f7>
  40284e:	48 8d b4 24 30 60 00 	lea    0x6030(%rsp),%rsi
  402855:	00 
  402856:	48 89 df             	mov    %rbx,%rdi
  402859:	e8 c2 e3 ff ff       	callq  400c20 <strcpy@plt>
  40285e:	89 ef                	mov    %ebp,%edi
  402860:	e8 2b e4 ff ff       	callq  400c90 <close@plt>
  402865:	0f b6 03             	movzbl (%rbx),%eax
  402868:	ba 4f 00 00 00       	mov    $0x4f,%edx
  40286d:	29 c2                	sub    %eax,%edx
  40286f:	0f 85 da 00 00 00    	jne    40294f <submitr+0x721>
  402875:	0f b6 4b 01          	movzbl 0x1(%rbx),%ecx
  402879:	b8 4b 00 00 00       	mov    $0x4b,%eax
  40287e:	29 c8                	sub    %ecx,%eax
  402880:	0f 85 cb 00 00 00    	jne    402951 <submitr+0x723>
  402886:	0f b6 4b 02          	movzbl 0x2(%rbx),%ecx
  40288a:	b8 0a 00 00 00       	mov    $0xa,%eax
  40288f:	29 c8                	sub    %ecx,%eax
  402891:	0f 85 ba 00 00 00    	jne    402951 <submitr+0x723>
  402897:	0f b6 43 03          	movzbl 0x3(%rbx),%eax
  40289b:	f7 d8                	neg    %eax
  40289d:	e9 af 00 00 00       	jmpq   402951 <submitr+0x723>
  4028a2:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  4028a9:	3a 20 43 
  4028ac:	48 89 03             	mov    %rax,(%rbx)
  4028af:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4028b6:	20 75 6e 
  4028b9:	48 89 43 08          	mov    %rax,0x8(%rbx)
  4028bd:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4028c4:	74 6f 20 
  4028c7:	48 89 43 10          	mov    %rax,0x10(%rbx)
  4028cb:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  4028d2:	73 74 61 
  4028d5:	48 89 43 18          	mov    %rax,0x18(%rbx)
  4028d9:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  4028e0:	65 73 73 
  4028e3:	48 89 43 20          	mov    %rax,0x20(%rbx)
  4028e7:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  4028ee:	72 6f 6d 
  4028f1:	48 89 43 28          	mov    %rax,0x28(%rbx)
  4028f5:	48 b8 20 72 65 73 75 	movabs $0x20746c7573657220,%rax
  4028fc:	6c 74 20 
  4028ff:	48 89 43 30          	mov    %rax,0x30(%rbx)
  402903:	c7 43 38 73 65 72 76 	movl   $0x76726573,0x38(%rbx)
  40290a:	66 c7 43 3c 65 72    	movw   $0x7265,0x3c(%rbx)
  402910:	c6 43 3e 00          	movb   $0x0,0x3e(%rbx)
  402914:	89 ef                	mov    %ebp,%edi
  402916:	e8 75 e3 ff ff       	callq  400c90 <close@plt>
  40291b:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402920:	e9 90 fe ff ff       	jmpq   4027b5 <submitr+0x587>
  402925:	48 8d 4c 24 20       	lea    0x20(%rsp),%rcx
  40292a:	48 8d 35 e7 0a 00 00 	lea    0xae7(%rip),%rsi        # 403418 <trans_char+0x78>
  402931:	48 89 df             	mov    %rbx,%rdi
  402934:	b8 00 00 00 00       	mov    $0x0,%eax
  402939:	e8 62 e4 ff ff       	callq  400da0 <sprintf@plt>
  40293e:	89 ef                	mov    %ebp,%edi
  402940:	e8 4b e3 ff ff       	callq  400c90 <close@plt>
  402945:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40294a:	e9 66 fe ff ff       	jmpq   4027b5 <submitr+0x587>
  40294f:	89 d0                	mov    %edx,%eax
  402951:	f7 d8                	neg    %eax
  402953:	0f 84 5c fe ff ff    	je     4027b5 <submitr+0x587>
  402959:	b9 05 00 00 00       	mov    $0x5,%ecx
  40295e:	48 8d 3d fb 0a 00 00 	lea    0xafb(%rip),%rdi        # 403460 <trans_char+0xc0>
  402965:	48 89 de             	mov    %rbx,%rsi
  402968:	f3 a6                	repz cmpsb %es:(%rdi),%ds:(%rsi)
  40296a:	0f 97 c0             	seta   %al
  40296d:	0f 92 c1             	setb   %cl
  402970:	29 c8                	sub    %ecx,%eax
  402972:	0f be c0             	movsbl %al,%eax
  402975:	85 c0                	test   %eax,%eax
  402977:	0f 84 38 fe ff ff    	je     4027b5 <submitr+0x587>
  40297d:	85 d2                	test   %edx,%edx
  40297f:	75 13                	jne    402994 <submitr+0x766>
  402981:	0f b6 43 01          	movzbl 0x1(%rbx),%eax
  402985:	ba 4b 00 00 00       	mov    $0x4b,%edx
  40298a:	29 c2                	sub    %eax,%edx
  40298c:	75 06                	jne    402994 <submitr+0x766>
  40298e:	0f b6 53 02          	movzbl 0x2(%rbx),%edx
  402992:	f7 da                	neg    %edx
  402994:	89 d0                	mov    %edx,%eax
  402996:	f7 d8                	neg    %eax
  402998:	0f 84 17 fe ff ff    	je     4027b5 <submitr+0x587>
  40299e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4029a3:	e9 0d fe ff ff       	jmpq   4027b5 <submitr+0x587>

00000000004029a8 <init_timeout>:
  4029a8:	85 ff                	test   %edi,%edi
  4029aa:	74 20                	je     4029cc <init_timeout+0x24>
  4029ac:	53                   	push   %rbx
  4029ad:	89 fb                	mov    %edi,%ebx
  4029af:	85 ff                	test   %edi,%edi
  4029b1:	78 1b                	js     4029ce <init_timeout+0x26>
  4029b3:	48 8d 35 05 f6 ff ff 	lea    -0x9fb(%rip),%rsi        # 401fbf <sigalrm_handler>
  4029ba:	bf 0e 00 00 00       	mov    $0xe,%edi
  4029bf:	e8 ec e2 ff ff       	callq  400cb0 <signal@plt>
  4029c4:	89 df                	mov    %ebx,%edi
  4029c6:	e8 b5 e2 ff ff       	callq  400c80 <alarm@plt>
  4029cb:	5b                   	pop    %rbx
  4029cc:	f3 c3                	repz retq 
  4029ce:	bb 00 00 00 00       	mov    $0x0,%ebx
  4029d3:	eb de                	jmp    4029b3 <init_timeout+0xb>

00000000004029d5 <init_driver>:
  4029d5:	41 54                	push   %r12
  4029d7:	55                   	push   %rbp
  4029d8:	53                   	push   %rbx
  4029d9:	48 83 ec 10          	sub    $0x10,%rsp
  4029dd:	48 89 fd             	mov    %rdi,%rbp
  4029e0:	be 01 00 00 00       	mov    $0x1,%esi
  4029e5:	bf 0d 00 00 00       	mov    $0xd,%edi
  4029ea:	e8 c1 e2 ff ff       	callq  400cb0 <signal@plt>
  4029ef:	be 01 00 00 00       	mov    $0x1,%esi
  4029f4:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4029f9:	e8 b2 e2 ff ff       	callq  400cb0 <signal@plt>
  4029fe:	be 01 00 00 00       	mov    $0x1,%esi
  402a03:	bf 1d 00 00 00       	mov    $0x1d,%edi
  402a08:	e8 a3 e2 ff ff       	callq  400cb0 <signal@plt>
  402a0d:	ba 00 00 00 00       	mov    $0x0,%edx
  402a12:	be 01 00 00 00       	mov    $0x1,%esi
  402a17:	bf 02 00 00 00       	mov    $0x2,%edi
  402a1c:	e8 af e3 ff ff       	callq  400dd0 <socket@plt>
  402a21:	85 c0                	test   %eax,%eax
  402a23:	0f 88 80 00 00 00    	js     402aa9 <init_driver+0xd4>
  402a29:	89 c3                	mov    %eax,%ebx
  402a2b:	48 8d 3d 33 0a 00 00 	lea    0xa33(%rip),%rdi        # 403465 <trans_char+0xc5>
  402a32:	e8 89 e2 ff ff       	callq  400cc0 <gethostbyname@plt>
  402a37:	48 85 c0             	test   %rax,%rax
  402a3a:	0f 84 b5 00 00 00    	je     402af5 <init_driver+0x120>
  402a40:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  402a47:	00 
  402a48:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  402a4f:	00 00 
  402a51:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  402a57:	48 8b 48 18          	mov    0x18(%rax),%rcx
  402a5b:	48 63 50 14          	movslq 0x14(%rax),%rdx
  402a5f:	48 8d 74 24 04       	lea    0x4(%rsp),%rsi
  402a64:	48 8b 39             	mov    (%rcx),%rdi
  402a67:	e8 e4 e2 ff ff       	callq  400d50 <bcopy@plt>
  402a6c:	66 c7 44 24 02 3c a4 	movw   $0xa43c,0x2(%rsp)
  402a73:	ba 10 00 00 00       	mov    $0x10,%edx
  402a78:	48 89 e6             	mov    %rsp,%rsi
  402a7b:	89 df                	mov    %ebx,%edi
  402a7d:	e8 3e e3 ff ff       	callq  400dc0 <connect@plt>
  402a82:	85 c0                	test   %eax,%eax
  402a84:	0f 88 d3 00 00 00    	js     402b5d <init_driver+0x188>
  402a8a:	89 df                	mov    %ebx,%edi
  402a8c:	e8 ff e1 ff ff       	callq  400c90 <close@plt>
  402a91:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  402a97:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402a9b:	b8 00 00 00 00       	mov    $0x0,%eax
  402aa0:	48 83 c4 10          	add    $0x10,%rsp
  402aa4:	5b                   	pop    %rbx
  402aa5:	5d                   	pop    %rbp
  402aa6:	41 5c                	pop    %r12
  402aa8:	c3                   	retq   
  402aa9:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402ab0:	3a 20 43 
  402ab3:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402ab7:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  402abe:	20 75 6e 
  402ac1:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402ac5:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402acc:	74 6f 20 
  402acf:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402ad3:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  402ada:	65 20 73 
  402add:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402ae1:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402ae8:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  402aee:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402af3:	eb ab                	jmp    402aa0 <init_driver+0xcb>
  402af5:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402afc:	3a 20 44 
  402aff:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402b03:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  402b0a:	20 75 6e 
  402b0d:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402b11:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402b18:	74 6f 20 
  402b1b:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402b1f:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  402b26:	76 65 20 
  402b29:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402b2d:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  402b34:	72 20 61 
  402b37:	48 89 45 20          	mov    %rax,0x20(%rbp)
  402b3b:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  402b42:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  402b48:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  402b4c:	89 df                	mov    %ebx,%edi
  402b4e:	e8 3d e1 ff ff       	callq  400c90 <close@plt>
  402b53:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402b58:	e9 43 ff ff ff       	jmpq   402aa0 <init_driver+0xcb>
  402b5d:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  402b64:	3a 20 55 
  402b67:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402b6b:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  402b72:	20 74 6f 
  402b75:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402b79:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  402b80:	65 63 74 
  402b83:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402b87:	48 b8 20 74 6f 20 73 	movabs $0x76726573206f7420,%rax
  402b8e:	65 72 76 
  402b91:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402b95:	66 c7 45 20 65 72    	movw   $0x7265,0x20(%rbp)
  402b9b:	c6 45 22 00          	movb   $0x0,0x22(%rbp)
  402b9f:	89 df                	mov    %ebx,%edi
  402ba1:	e8 ea e0 ff ff       	callq  400c90 <close@plt>
  402ba6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402bab:	e9 f0 fe ff ff       	jmpq   402aa0 <init_driver+0xcb>

0000000000402bb0 <driver_post>:
  402bb0:	53                   	push   %rbx
  402bb1:	4c 89 cb             	mov    %r9,%rbx
  402bb4:	45 85 c0             	test   %r8d,%r8d
  402bb7:	75 18                	jne    402bd1 <driver_post+0x21>
  402bb9:	48 85 ff             	test   %rdi,%rdi
  402bbc:	74 05                	je     402bc3 <driver_post+0x13>
  402bbe:	80 3f 00             	cmpb   $0x0,(%rdi)
  402bc1:	75 32                	jne    402bf5 <driver_post+0x45>
  402bc3:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402bc8:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402bcc:	44 89 c0             	mov    %r8d,%eax
  402bcf:	5b                   	pop    %rbx
  402bd0:	c3                   	retq   
  402bd1:	48 89 ce             	mov    %rcx,%rsi
  402bd4:	48 8d 3d 98 08 00 00 	lea    0x898(%rip),%rdi        # 403473 <trans_char+0xd3>
  402bdb:	b8 00 00 00 00       	mov    $0x0,%eax
  402be0:	e8 7b e0 ff ff       	callq  400c60 <printf@plt>
  402be5:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  402bea:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  402bee:	b8 00 00 00 00       	mov    $0x0,%eax
  402bf3:	eb da                	jmp    402bcf <driver_post+0x1f>
  402bf5:	48 83 ec 08          	sub    $0x8,%rsp
  402bf9:	41 51                	push   %r9
  402bfb:	49 89 c9             	mov    %rcx,%r9
  402bfe:	49 89 d0             	mov    %rdx,%r8
  402c01:	48 89 f9             	mov    %rdi,%rcx
  402c04:	48 89 f2             	mov    %rsi,%rdx
  402c07:	be a4 3c 00 00       	mov    $0x3ca4,%esi
  402c0c:	48 8d 3d 52 08 00 00 	lea    0x852(%rip),%rdi        # 403465 <trans_char+0xc5>
  402c13:	e8 16 f6 ff ff       	callq  40222e <submitr>
  402c18:	48 83 c4 10          	add    $0x10,%rsp
  402c1c:	eb b1                	jmp    402bcf <driver_post+0x1f>

0000000000402c1e <check>:
  402c1e:	89 f8                	mov    %edi,%eax
  402c20:	c1 e8 1c             	shr    $0x1c,%eax
  402c23:	85 c0                	test   %eax,%eax
  402c25:	74 1d                	je     402c44 <check+0x26>
  402c27:	b9 00 00 00 00       	mov    $0x0,%ecx
  402c2c:	83 f9 1f             	cmp    $0x1f,%ecx
  402c2f:	7f 0d                	jg     402c3e <check+0x20>
  402c31:	89 f8                	mov    %edi,%eax
  402c33:	d3 e8                	shr    %cl,%eax
  402c35:	3c 0a                	cmp    $0xa,%al
  402c37:	74 11                	je     402c4a <check+0x2c>
  402c39:	83 c1 08             	add    $0x8,%ecx
  402c3c:	eb ee                	jmp    402c2c <check+0xe>
  402c3e:	b8 01 00 00 00       	mov    $0x1,%eax
  402c43:	c3                   	retq   
  402c44:	b8 00 00 00 00       	mov    $0x0,%eax
  402c49:	c3                   	retq   
  402c4a:	b8 00 00 00 00       	mov    $0x0,%eax
  402c4f:	c3                   	retq   

0000000000402c50 <gencookie>:
  402c50:	53                   	push   %rbx
  402c51:	83 c7 01             	add    $0x1,%edi
  402c54:	e8 a7 df ff ff       	callq  400c00 <srandom@plt>
  402c59:	e8 b2 e0 ff ff       	callq  400d10 <random@plt>
  402c5e:	89 c3                	mov    %eax,%ebx
  402c60:	89 c7                	mov    %eax,%edi
  402c62:	e8 b7 ff ff ff       	callq  402c1e <check>
  402c67:	85 c0                	test   %eax,%eax
  402c69:	74 ee                	je     402c59 <gencookie+0x9>
  402c6b:	89 d8                	mov    %ebx,%eax
  402c6d:	5b                   	pop    %rbx
  402c6e:	c3                   	retq   
  402c6f:	90                   	nop

0000000000402c70 <__libc_csu_init>:
  402c70:	41 57                	push   %r15
  402c72:	41 56                	push   %r14
  402c74:	41 89 ff             	mov    %edi,%r15d
  402c77:	41 55                	push   %r13
  402c79:	41 54                	push   %r12
  402c7b:	4c 8d 25 86 21 20 00 	lea    0x202186(%rip),%r12        # 604e08 <__frame_dummy_init_array_entry>
  402c82:	55                   	push   %rbp
  402c83:	48 8d 2d 86 21 20 00 	lea    0x202186(%rip),%rbp        # 604e10 <__init_array_end>
  402c8a:	53                   	push   %rbx
  402c8b:	49 89 f6             	mov    %rsi,%r14
  402c8e:	49 89 d5             	mov    %rdx,%r13
  402c91:	4c 29 e5             	sub    %r12,%rbp
  402c94:	48 83 ec 08          	sub    $0x8,%rsp
  402c98:	48 c1 fd 03          	sar    $0x3,%rbp
  402c9c:	e8 0f df ff ff       	callq  400bb0 <_init>
  402ca1:	48 85 ed             	test   %rbp,%rbp
  402ca4:	74 20                	je     402cc6 <__libc_csu_init+0x56>
  402ca6:	31 db                	xor    %ebx,%ebx
  402ca8:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  402caf:	00 
  402cb0:	4c 89 ea             	mov    %r13,%rdx
  402cb3:	4c 89 f6             	mov    %r14,%rsi
  402cb6:	44 89 ff             	mov    %r15d,%edi
  402cb9:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  402cbd:	48 83 c3 01          	add    $0x1,%rbx
  402cc1:	48 39 dd             	cmp    %rbx,%rbp
  402cc4:	75 ea                	jne    402cb0 <__libc_csu_init+0x40>
  402cc6:	48 83 c4 08          	add    $0x8,%rsp
  402cca:	5b                   	pop    %rbx
  402ccb:	5d                   	pop    %rbp
  402ccc:	41 5c                	pop    %r12
  402cce:	41 5d                	pop    %r13
  402cd0:	41 5e                	pop    %r14
  402cd2:	41 5f                	pop    %r15
  402cd4:	c3                   	retq   
  402cd5:	90                   	nop
  402cd6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  402cdd:	00 00 00 

0000000000402ce0 <__libc_csu_fini>:
  402ce0:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402ce4 <_fini>:
  402ce4:	48 83 ec 08          	sub    $0x8,%rsp
  402ce8:	48 83 c4 08          	add    $0x8,%rsp
  402cec:	c3                   	retq   
