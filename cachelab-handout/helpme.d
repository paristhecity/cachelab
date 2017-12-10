
csim-ref:     file format elf64-x86-64


Disassembly of section .init:

0000000000000a88 <_init>:
 a88:	48 83 ec 08          	sub    $0x8,%rsp
 a8c:	48 8b 05 05 25 20 00 	mov    0x202505(%rip),%rax        # 202f98 <__gmon_start__>
 a93:	48 85 c0             	test   %rax,%rax
 a96:	74 02                	je     a9a <_init+0x12>
 a98:	ff d0                	callq  *%rax
 a9a:	48 83 c4 08          	add    $0x8,%rsp
 a9e:	c3                   	retq   

Disassembly of section .plt:

0000000000000aa0 <.plt>:
 aa0:	ff 35 72 24 20 00    	pushq  0x202472(%rip)        # 202f18 <_GLOBAL_OFFSET_TABLE_+0x8>
 aa6:	ff 25 74 24 20 00    	jmpq   *0x202474(%rip)        # 202f20 <_GLOBAL_OFFSET_TABLE_+0x10>
 aac:	0f 1f 40 00          	nopl   0x0(%rax)

Disassembly of section .plt.got:

0000000000000ab0 <.plt.got>:
 ab0:	ff 25 72 24 20 00    	jmpq   *0x202472(%rip)        # 202f28 <free@GLIBC_2.2.5>
 ab6:	66 90                	xchg   %ax,%ax
 ab8:	ff 25 72 24 20 00    	jmpq   *0x202472(%rip)        # 202f30 <putchar@GLIBC_2.2.5>
 abe:	66 90                	xchg   %ax,%ax
 ac0:	ff 25 72 24 20 00    	jmpq   *0x202472(%rip)        # 202f38 <__errno_location@GLIBC_2.2.5>
 ac6:	66 90                	xchg   %ax,%ax
 ac8:	ff 25 7a 24 20 00    	jmpq   *0x20247a(%rip)        # 202f48 <puts@GLIBC_2.2.5>
 ace:	66 90                	xchg   %ax,%ax
 ad0:	ff 25 7a 24 20 00    	jmpq   *0x20247a(%rip)        # 202f50 <fclose@GLIBC_2.2.5>
 ad6:	66 90                	xchg   %ax,%ax
 ad8:	ff 25 7a 24 20 00    	jmpq   *0x20247a(%rip)        # 202f58 <__stack_chk_fail@GLIBC_2.4>
 ade:	66 90                	xchg   %ax,%ax
 ae0:	ff 25 7a 24 20 00    	jmpq   *0x20247a(%rip)        # 202f60 <printf@GLIBC_2.2.5>
 ae6:	66 90                	xchg   %ax,%ax
 ae8:	ff 25 7a 24 20 00    	jmpq   *0x20247a(%rip)        # 202f68 <__assert_fail@GLIBC_2.2.5>
 aee:	66 90                	xchg   %ax,%ax
 af0:	ff 25 7a 24 20 00    	jmpq   *0x20247a(%rip)        # 202f70 <pow@GLIBC_2.2.5>
 af6:	66 90                	xchg   %ax,%ax
 af8:	ff 25 82 24 20 00    	jmpq   *0x202482(%rip)        # 202f80 <srand@GLIBC_2.2.5>
 afe:	66 90                	xchg   %ax,%ax
 b00:	ff 25 82 24 20 00    	jmpq   *0x202482(%rip)        # 202f88 <fgets@GLIBC_2.2.5>
 b06:	66 90                	xchg   %ax,%ax
 b08:	ff 25 82 24 20 00    	jmpq   *0x202482(%rip)        # 202f90 <fprintf@GLIBC_2.2.5>
 b0e:	66 90                	xchg   %ax,%ax
 b10:	ff 25 8a 24 20 00    	jmpq   *0x20248a(%rip)        # 202fa0 <time@GLIBC_2.2.5>
 b16:	66 90                	xchg   %ax,%ax
 b18:	ff 25 8a 24 20 00    	jmpq   *0x20248a(%rip)        # 202fa8 <malloc@GLIBC_2.2.5>
 b1e:	66 90                	xchg   %ax,%ax
 b20:	ff 25 8a 24 20 00    	jmpq   *0x20248a(%rip)        # 202fb0 <__isoc99_sscanf@GLIBC_2.7>
 b26:	66 90                	xchg   %ax,%ax
 b28:	ff 25 8a 24 20 00    	jmpq   *0x20248a(%rip)        # 202fb8 <fopen@GLIBC_2.2.5>
 b2e:	66 90                	xchg   %ax,%ax
 b30:	ff 25 92 24 20 00    	jmpq   *0x202492(%rip)        # 202fc8 <getopt@GLIBC_2.2.5>
 b36:	66 90                	xchg   %ax,%ax
 b38:	ff 25 92 24 20 00    	jmpq   *0x202492(%rip)        # 202fd0 <atoi@GLIBC_2.2.5>
 b3e:	66 90                	xchg   %ax,%ax
 b40:	ff 25 92 24 20 00    	jmpq   *0x202492(%rip)        # 202fd8 <exit@GLIBC_2.2.5>
 b46:	66 90                	xchg   %ax,%ax
 b48:	ff 25 9a 24 20 00    	jmpq   *0x20249a(%rip)        # 202fe8 <strerror@GLIBC_2.2.5>
 b4e:	66 90                	xchg   %ax,%ax
 b50:	ff 25 9a 24 20 00    	jmpq   *0x20249a(%rip)        # 202ff0 <__cxa_finalize@GLIBC_2.2.5>
 b56:	66 90                	xchg   %ax,%ax
 b58:	ff 25 9a 24 20 00    	jmpq   *0x20249a(%rip)        # 202ff8 <rand@GLIBC_2.2.5>
 b5e:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000000b60 <_start>:
     b60:	31 ed                	xor    %ebp,%ebp
     b62:	49 89 d1             	mov    %rdx,%r9
     b65:	5e                   	pop    %rsi
     b66:	48 89 e2             	mov    %rsp,%rdx
     b69:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
     b6d:	50                   	push   %rax
     b6e:	54                   	push   %rsp
     b6f:	4c 8d 05 4a 0e 00 00 	lea    0xe4a(%rip),%r8        # 19c0 <__libc_csu_fini>
     b76:	48 8d 0d d3 0d 00 00 	lea    0xdd3(%rip),%rcx        # 1950 <__libc_csu_init>
     b7d:	48 8d 3d 0b 08 00 00 	lea    0x80b(%rip),%rdi        # 138f <main>
     b84:	ff 15 ee 23 20 00    	callq  *0x2023ee(%rip)        # 202f78 <__libc_start_main@GLIBC_2.2.5>
     b8a:	f4                   	hlt    
     b8b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000000000b90 <deregister_tm_clones>:
     b90:	48 8d 3d 81 24 20 00 	lea    0x202481(%rip),%rdi        # 203018 <__TMC_END__>
     b97:	48 8d 05 81 24 20 00 	lea    0x202481(%rip),%rax        # 20301f <__TMC_END__+0x7>
     b9e:	55                   	push   %rbp
     b9f:	48 29 f8             	sub    %rdi,%rax
     ba2:	48 89 e5             	mov    %rsp,%rbp
     ba5:	48 83 f8 0e          	cmp    $0xe,%rax
     ba9:	76 15                	jbe    bc0 <deregister_tm_clones+0x30>
     bab:	48 8b 05 8e 23 20 00 	mov    0x20238e(%rip),%rax        # 202f40 <_ITM_deregisterTMCloneTable>
     bb2:	48 85 c0             	test   %rax,%rax
     bb5:	74 09                	je     bc0 <deregister_tm_clones+0x30>
     bb7:	5d                   	pop    %rbp
     bb8:	ff e0                	jmpq   *%rax
     bba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
     bc0:	5d                   	pop    %rbp
     bc1:	c3                   	retq   
     bc2:	0f 1f 40 00          	nopl   0x0(%rax)
     bc6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     bcd:	00 00 00 

0000000000000bd0 <register_tm_clones>:
     bd0:	48 8d 3d 41 24 20 00 	lea    0x202441(%rip),%rdi        # 203018 <__TMC_END__>
     bd7:	48 8d 35 3a 24 20 00 	lea    0x20243a(%rip),%rsi        # 203018 <__TMC_END__>
     bde:	55                   	push   %rbp
     bdf:	48 29 fe             	sub    %rdi,%rsi
     be2:	48 89 e5             	mov    %rsp,%rbp
     be5:	48 c1 fe 03          	sar    $0x3,%rsi
     be9:	48 89 f0             	mov    %rsi,%rax
     bec:	48 c1 e8 3f          	shr    $0x3f,%rax
     bf0:	48 01 c6             	add    %rax,%rsi
     bf3:	48 d1 fe             	sar    %rsi
     bf6:	74 18                	je     c10 <register_tm_clones+0x40>
     bf8:	48 8b 05 e1 23 20 00 	mov    0x2023e1(%rip),%rax        # 202fe0 <_ITM_registerTMCloneTable>
     bff:	48 85 c0             	test   %rax,%rax
     c02:	74 0c                	je     c10 <register_tm_clones+0x40>
     c04:	5d                   	pop    %rbp
     c05:	ff e0                	jmpq   *%rax
     c07:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
     c0e:	00 00 
     c10:	5d                   	pop    %rbp
     c11:	c3                   	retq   
     c12:	0f 1f 40 00          	nopl   0x0(%rax)
     c16:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     c1d:	00 00 00 

0000000000000c20 <__do_global_dtors_aux>:
     c20:	80 3d 21 24 20 00 00 	cmpb   $0x0,0x202421(%rip)        # 203048 <completed.7558>
     c27:	75 27                	jne    c50 <__do_global_dtors_aux+0x30>
     c29:	48 83 3d bf 23 20 00 	cmpq   $0x0,0x2023bf(%rip)        # 202ff0 <__cxa_finalize@GLIBC_2.2.5>
     c30:	00 
     c31:	55                   	push   %rbp
     c32:	48 89 e5             	mov    %rsp,%rbp
     c35:	74 0c                	je     c43 <__do_global_dtors_aux+0x23>
     c37:	48 8b 3d ca 23 20 00 	mov    0x2023ca(%rip),%rdi        # 203008 <__dso_handle>
     c3e:	e8 0d ff ff ff       	callq  b50 <.plt.got+0xa0>
     c43:	e8 48 ff ff ff       	callq  b90 <deregister_tm_clones>
     c48:	5d                   	pop    %rbp
     c49:	c6 05 f8 23 20 00 01 	movb   $0x1,0x2023f8(%rip)        # 203048 <completed.7558>
     c50:	f3 c3                	repz retq 
     c52:	0f 1f 40 00          	nopl   0x0(%rax)
     c56:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
     c5d:	00 00 00 

0000000000000c60 <frame_dummy>:
     c60:	48 8d 3d d1 20 20 00 	lea    0x2020d1(%rip),%rdi        # 202d38 <__JCR_END__>
     c67:	48 83 3f 00          	cmpq   $0x0,(%rdi)
     c6b:	75 0b                	jne    c78 <frame_dummy+0x18>
     c6d:	e9 5e ff ff ff       	jmpq   bd0 <register_tm_clones>
     c72:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
     c78:	48 8b 05 41 23 20 00 	mov    0x202341(%rip),%rax        # 202fc0 <_Jv_RegisterClasses>
     c7f:	48 85 c0             	test   %rax,%rax
     c82:	74 e9                	je     c6d <frame_dummy+0xd>
     c84:	55                   	push   %rbp
     c85:	48 89 e5             	mov    %rsp,%rbp
     c88:	ff d0                	callq  *%rax
     c8a:	5d                   	pop    %rbp
     c8b:	e9 40 ff ff ff       	jmpq   bd0 <register_tm_clones>

0000000000000c90 <initCache>:
     c90:	55                   	push   %rbp
     c91:	48 89 e5             	mov    %rsp,%rbp
     c94:	53                   	push   %rbx
     c95:	48 83 ec 28          	sub    $0x28,%rsp
     c99:	8b 05 e9 23 20 00    	mov    0x2023e9(%rip),%eax        # 203088 <S>
     c9f:	48 98                	cltq   
     ca1:	48 c1 e0 03          	shl    $0x3,%rax
     ca5:	48 89 c7             	mov    %rax,%rdi
     ca8:	e8 6b fe ff ff       	callq  b18 <.plt.got+0x68>
     cad:	48 89 05 cc 23 20 00 	mov    %rax,0x2023cc(%rip)        # 203080 <cache>
     cb4:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
     cbb:	e9 f3 00 00 00       	jmpq   db3 <initCache+0x123>
     cc0:	48 8b 05 b9 23 20 00 	mov    0x2023b9(%rip),%rax        # 203080 <cache>
     cc7:	8b 55 e8             	mov    -0x18(%rbp),%edx
     cca:	48 63 d2             	movslq %edx,%rdx
     ccd:	48 c1 e2 03          	shl    $0x3,%rdx
     cd1:	48 8d 1c 10          	lea    (%rax,%rdx,1),%rbx
     cd5:	8b 05 81 23 20 00    	mov    0x202381(%rip),%eax        # 20305c <E>
     cdb:	48 63 d0             	movslq %eax,%rdx
     cde:	48 89 d0             	mov    %rdx,%rax
     ce1:	48 01 c0             	add    %rax,%rax
     ce4:	48 01 d0             	add    %rdx,%rax
     ce7:	48 c1 e0 03          	shl    $0x3,%rax
     ceb:	48 89 c7             	mov    %rax,%rdi
     cee:	e8 25 fe ff ff       	callq  b18 <.plt.got+0x68>
     cf3:	48 89 03             	mov    %rax,(%rbx)
     cf6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%rbp)
     cfd:	e9 9e 00 00 00       	jmpq   da0 <initCache+0x110>
     d02:	48 8b 05 77 23 20 00 	mov    0x202377(%rip),%rax        # 203080 <cache>
     d09:	8b 55 e8             	mov    -0x18(%rbp),%edx
     d0c:	48 63 d2             	movslq %edx,%rdx
     d0f:	48 c1 e2 03          	shl    $0x3,%rdx
     d13:	48 01 d0             	add    %rdx,%rax
     d16:	48 8b 08             	mov    (%rax),%rcx
     d19:	8b 45 ec             	mov    -0x14(%rbp),%eax
     d1c:	48 63 d0             	movslq %eax,%rdx
     d1f:	48 89 d0             	mov    %rdx,%rax
     d22:	48 01 c0             	add    %rax,%rax
     d25:	48 01 d0             	add    %rdx,%rax
     d28:	48 c1 e0 03          	shl    $0x3,%rax
     d2c:	48 01 c8             	add    %rcx,%rax
     d2f:	c6 00 00             	movb   $0x0,(%rax)
     d32:	48 8b 05 47 23 20 00 	mov    0x202347(%rip),%rax        # 203080 <cache>
     d39:	8b 55 e8             	mov    -0x18(%rbp),%edx
     d3c:	48 63 d2             	movslq %edx,%rdx
     d3f:	48 c1 e2 03          	shl    $0x3,%rdx
     d43:	48 01 d0             	add    %rdx,%rax
     d46:	48 8b 08             	mov    (%rax),%rcx
     d49:	8b 45 ec             	mov    -0x14(%rbp),%eax
     d4c:	48 63 d0             	movslq %eax,%rdx
     d4f:	48 89 d0             	mov    %rdx,%rax
     d52:	48 01 c0             	add    %rax,%rax
     d55:	48 01 d0             	add    %rdx,%rax
     d58:	48 c1 e0 03          	shl    $0x3,%rax
     d5c:	48 01 c8             	add    %rcx,%rax
     d5f:	48 c7 40 08 00 00 00 	movq   $0x0,0x8(%rax)
     d66:	00 
     d67:	48 8b 05 12 23 20 00 	mov    0x202312(%rip),%rax        # 203080 <cache>
     d6e:	8b 55 e8             	mov    -0x18(%rbp),%edx
     d71:	48 63 d2             	movslq %edx,%rdx
     d74:	48 c1 e2 03          	shl    $0x3,%rdx
     d78:	48 01 d0             	add    %rdx,%rax
     d7b:	48 8b 08             	mov    (%rax),%rcx
     d7e:	8b 45 ec             	mov    -0x14(%rbp),%eax
     d81:	48 63 d0             	movslq %eax,%rdx
     d84:	48 89 d0             	mov    %rdx,%rax
     d87:	48 01 c0             	add    %rax,%rax
     d8a:	48 01 d0             	add    %rdx,%rax
     d8d:	48 c1 e0 03          	shl    $0x3,%rax
     d91:	48 01 c8             	add    %rcx,%rax
     d94:	48 c7 40 10 00 00 00 	movq   $0x0,0x10(%rax)
     d9b:	00 
     d9c:	83 45 ec 01          	addl   $0x1,-0x14(%rbp)
     da0:	8b 05 b6 22 20 00    	mov    0x2022b6(%rip),%eax        # 20305c <E>
     da6:	39 45 ec             	cmp    %eax,-0x14(%rbp)
     da9:	0f 8c 53 ff ff ff    	jl     d02 <initCache+0x72>
     daf:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
     db3:	8b 05 cf 22 20 00    	mov    0x2022cf(%rip),%eax        # 203088 <S>
     db9:	39 45 e8             	cmp    %eax,-0x18(%rbp)
     dbc:	0f 8c fe fe ff ff    	jl     cc0 <initCache+0x30>
     dc2:	8b 05 8c 22 20 00    	mov    0x20228c(%rip),%eax        # 203054 <s>
     dc8:	66 0f ef c0          	pxor   %xmm0,%xmm0
     dcc:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
     dd0:	48 8b 05 d1 0e 00 00 	mov    0xed1(%rip),%rax        # 1ca8 <_IO_stdin_used+0x2d8>
     dd7:	66 0f 28 c8          	movapd %xmm0,%xmm1
     ddb:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
     ddf:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
     de4:	e8 07 fd ff ff       	callq  af0 <.plt.got+0x40>
     de9:	66 0f 28 c8          	movapd %xmm0,%xmm1
     ded:	f2 0f 10 05 bb 0e 00 	movsd  0xebb(%rip),%xmm0        # 1cb0 <_IO_stdin_used+0x2e0>
     df4:	00 
     df5:	f2 0f 5c c8          	subsd  %xmm0,%xmm1
     df9:	66 0f 28 c1          	movapd %xmm1,%xmm0
     dfd:	66 0f 2e 05 b3 0e 00 	ucomisd 0xeb3(%rip),%xmm0        # 1cb8 <_IO_stdin_used+0x2e8>
     e04:	00 
     e05:	73 07                	jae    e0e <initCache+0x17e>
     e07:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
     e0c:	eb 1e                	jmp    e2c <initCache+0x19c>
     e0e:	f2 0f 10 0d a2 0e 00 	movsd  0xea2(%rip),%xmm1        # 1cb8 <_IO_stdin_used+0x2e8>
     e15:	00 
     e16:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
     e1a:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
     e1f:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
     e26:	00 00 80 
     e29:	48 31 d0             	xor    %rdx,%rax
     e2c:	48 89 05 5d 22 20 00 	mov    %rax,0x20225d(%rip)        # 203090 <set_index_mask>
     e33:	90                   	nop
     e34:	48 83 c4 28          	add    $0x28,%rsp
     e38:	5b                   	pop    %rbx
     e39:	5d                   	pop    %rbp
     e3a:	c3                   	retq   

0000000000000e3b <freeCache>:
     e3b:	55                   	push   %rbp
     e3c:	48 89 e5             	mov    %rsp,%rbp
     e3f:	48 83 ec 10          	sub    $0x10,%rsp
     e43:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
     e4a:	eb 23                	jmp    e6f <freeCache+0x34>
     e4c:	48 8b 05 2d 22 20 00 	mov    0x20222d(%rip),%rax        # 203080 <cache>
     e53:	8b 55 fc             	mov    -0x4(%rbp),%edx
     e56:	48 63 d2             	movslq %edx,%rdx
     e59:	48 c1 e2 03          	shl    $0x3,%rdx
     e5d:	48 01 d0             	add    %rdx,%rax
     e60:	48 8b 00             	mov    (%rax),%rax
     e63:	48 89 c7             	mov    %rax,%rdi
     e66:	e8 45 fc ff ff       	callq  ab0 <.plt.got>
     e6b:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
     e6f:	8b 05 13 22 20 00    	mov    0x202213(%rip),%eax        # 203088 <S>
     e75:	39 45 fc             	cmp    %eax,-0x4(%rbp)
     e78:	7c d2                	jl     e4c <freeCache+0x11>
     e7a:	48 8b 05 ff 21 20 00 	mov    0x2021ff(%rip),%rax        # 203080 <cache>
     e81:	48 89 c7             	mov    %rax,%rdi
     e84:	e8 27 fc ff ff       	callq  ab0 <.plt.got>
     e89:	90                   	nop
     e8a:	c9                   	leaveq 
     e8b:	c3                   	retq   

0000000000000e8c <accessData>:
     e8c:	55                   	push   %rbp
     e8d:	48 89 e5             	mov    %rsp,%rbp
     e90:	48 83 ec 40          	sub    $0x40,%rsp
     e94:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
     e98:	48 c7 45 e0 ff ff ff 	movq   $0xffffffffffffffff,-0x20(%rbp)
     e9f:	ff 
     ea0:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%rbp)
     ea7:	8b 05 ab 21 20 00    	mov    0x2021ab(%rip),%eax        # 203058 <b>
     ead:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
     eb1:	89 c1                	mov    %eax,%ecx
     eb3:	48 d3 ea             	shr    %cl,%rdx
     eb6:	48 8b 05 d3 21 20 00 	mov    0x2021d3(%rip),%rax        # 203090 <set_index_mask>
     ebd:	48 21 d0             	and    %rdx,%rax
     ec0:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
     ec4:	8b 15 8a 21 20 00    	mov    0x20218a(%rip),%edx        # 203054 <s>
     eca:	8b 05 88 21 20 00    	mov    0x202188(%rip),%eax        # 203058 <b>
     ed0:	01 d0                	add    %edx,%eax
     ed2:	48 8b 55 c8          	mov    -0x38(%rbp),%rdx
     ed6:	89 c1                	mov    %eax,%ecx
     ed8:	48 d3 ea             	shr    %cl,%rdx
     edb:	48 89 d0             	mov    %rdx,%rax
     ede:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
     ee2:	48 8b 05 97 21 20 00 	mov    0x202197(%rip),%rax        # 203080 <cache>
     ee9:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
     eed:	48 c1 e2 03          	shl    $0x3,%rdx
     ef1:	48 01 d0             	add    %rdx,%rax
     ef4:	48 8b 00             	mov    (%rax),%rax
     ef7:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
     efb:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
     f02:	e9 b6 00 00 00       	jmpq   fbd <accessData+0x131>
     f07:	8b 45 d8             	mov    -0x28(%rbp),%eax
     f0a:	48 63 d0             	movslq %eax,%rdx
     f0d:	48 89 d0             	mov    %rdx,%rax
     f10:	48 01 c0             	add    %rax,%rax
     f13:	48 01 d0             	add    %rdx,%rax
     f16:	48 c1 e0 03          	shl    $0x3,%rax
     f1a:	48 89 c2             	mov    %rax,%rdx
     f1d:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f21:	48 01 d0             	add    %rdx,%rax
     f24:	48 8b 40 08          	mov    0x8(%rax),%rax
     f28:	48 3b 45 f0          	cmp    -0x10(%rbp),%rax
     f2c:	0f 85 87 00 00 00    	jne    fb9 <accessData+0x12d>
     f32:	8b 45 d8             	mov    -0x28(%rbp),%eax
     f35:	48 63 d0             	movslq %eax,%rdx
     f38:	48 89 d0             	mov    %rdx,%rax
     f3b:	48 01 c0             	add    %rax,%rax
     f3e:	48 01 d0             	add    %rdx,%rax
     f41:	48 c1 e0 03          	shl    $0x3,%rax
     f45:	48 89 c2             	mov    %rax,%rdx
     f48:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f4c:	48 01 d0             	add    %rdx,%rax
     f4f:	0f b6 00             	movzbl (%rax),%eax
     f52:	84 c0                	test   %al,%al
     f54:	74 63                	je     fb9 <accessData+0x12d>
     f56:	8b 05 10 21 20 00    	mov    0x202110(%rip),%eax        # 20306c <hit_count>
     f5c:	83 c0 01             	add    $0x1,%eax
     f5f:	89 05 07 21 20 00    	mov    %eax,0x202107(%rip)        # 20306c <hit_count>
     f65:	8b 05 e5 20 20 00    	mov    0x2020e5(%rip),%eax        # 203050 <verbosity>
     f6b:	85 c0                	test   %eax,%eax
     f6d:	74 11                	je     f80 <accessData+0xf4>
     f6f:	48 8d 3d 62 0a 00 00 	lea    0xa62(%rip),%rdi        # 19d8 <_IO_stdin_used+0x8>
     f76:	b8 00 00 00 00       	mov    $0x0,%eax
     f7b:	e8 60 fb ff ff       	callq  ae0 <.plt.got+0x30>
     f80:	8b 45 d8             	mov    -0x28(%rbp),%eax
     f83:	48 63 d0             	movslq %eax,%rdx
     f86:	48 89 d0             	mov    %rdx,%rax
     f89:	48 01 c0             	add    %rax,%rax
     f8c:	48 01 d0             	add    %rdx,%rax
     f8f:	48 c1 e0 03          	shl    $0x3,%rax
     f93:	48 89 c2             	mov    %rax,%rdx
     f96:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
     f9a:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
     f9e:	48 8b 05 6b 20 20 00 	mov    0x20206b(%rip),%rax        # 203010 <lru_counter>
     fa5:	48 8d 50 01          	lea    0x1(%rax),%rdx
     fa9:	48 89 15 60 20 20 00 	mov    %rdx,0x202060(%rip)        # 203010 <lru_counter>
     fb0:	48 89 41 10          	mov    %rax,0x10(%rcx)
     fb4:	e9 62 01 00 00       	jmpq   111b <accessData+0x28f>
     fb9:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
     fbd:	8b 05 99 20 20 00    	mov    0x202099(%rip),%eax        # 20305c <E>
     fc3:	39 45 d8             	cmp    %eax,-0x28(%rbp)
     fc6:	0f 8c 3b ff ff ff    	jl     f07 <accessData+0x7b>
     fcc:	8b 05 96 20 20 00    	mov    0x202096(%rip),%eax        # 203068 <miss_count>
     fd2:	83 c0 01             	add    $0x1,%eax
     fd5:	89 05 8d 20 20 00    	mov    %eax,0x20208d(%rip)        # 203068 <miss_count>
     fdb:	8b 05 6f 20 20 00    	mov    0x20206f(%rip),%eax        # 203050 <verbosity>
     fe1:	85 c0                	test   %eax,%eax
     fe3:	74 11                	je     ff6 <accessData+0x16a>
     fe5:	48 8d 3d f1 09 00 00 	lea    0x9f1(%rip),%rdi        # 19dd <_IO_stdin_used+0xd>
     fec:	b8 00 00 00 00       	mov    $0x0,%eax
     ff1:	e8 ea fa ff ff       	callq  ae0 <.plt.got+0x30>
     ff6:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%rbp)
     ffd:	eb 56                	jmp    1055 <accessData+0x1c9>
     fff:	8b 45 d8             	mov    -0x28(%rbp),%eax
    1002:	48 63 d0             	movslq %eax,%rdx
    1005:	48 89 d0             	mov    %rdx,%rax
    1008:	48 01 c0             	add    %rax,%rax
    100b:	48 01 d0             	add    %rdx,%rax
    100e:	48 c1 e0 03          	shl    $0x3,%rax
    1012:	48 89 c2             	mov    %rax,%rdx
    1015:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1019:	48 01 d0             	add    %rdx,%rax
    101c:	48 8b 40 10          	mov    0x10(%rax),%rax
    1020:	48 3b 45 e0          	cmp    -0x20(%rbp),%rax
    1024:	73 2b                	jae    1051 <accessData+0x1c5>
    1026:	8b 45 d8             	mov    -0x28(%rbp),%eax
    1029:	89 45 dc             	mov    %eax,-0x24(%rbp)
    102c:	8b 45 d8             	mov    -0x28(%rbp),%eax
    102f:	48 63 d0             	movslq %eax,%rdx
    1032:	48 89 d0             	mov    %rdx,%rax
    1035:	48 01 c0             	add    %rax,%rax
    1038:	48 01 d0             	add    %rdx,%rax
    103b:	48 c1 e0 03          	shl    $0x3,%rax
    103f:	48 89 c2             	mov    %rax,%rdx
    1042:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1046:	48 01 d0             	add    %rdx,%rax
    1049:	48 8b 40 10          	mov    0x10(%rax),%rax
    104d:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    1051:	83 45 d8 01          	addl   $0x1,-0x28(%rbp)
    1055:	8b 05 01 20 20 00    	mov    0x202001(%rip),%eax        # 20305c <E>
    105b:	39 45 d8             	cmp    %eax,-0x28(%rbp)
    105e:	7c 9f                	jl     fff <accessData+0x173>
    1060:	8b 55 dc             	mov    -0x24(%rbp),%edx
    1063:	48 89 d0             	mov    %rdx,%rax
    1066:	48 01 c0             	add    %rax,%rax
    1069:	48 01 d0             	add    %rdx,%rax
    106c:	48 c1 e0 03          	shl    $0x3,%rax
    1070:	48 89 c2             	mov    %rax,%rdx
    1073:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1077:	48 01 d0             	add    %rdx,%rax
    107a:	0f b6 00             	movzbl (%rax),%eax
    107d:	84 c0                	test   %al,%al
    107f:	74 2a                	je     10ab <accessData+0x21f>
    1081:	8b 05 e9 1f 20 00    	mov    0x201fe9(%rip),%eax        # 203070 <eviction_count>
    1087:	83 c0 01             	add    $0x1,%eax
    108a:	89 05 e0 1f 20 00    	mov    %eax,0x201fe0(%rip)        # 203070 <eviction_count>
    1090:	8b 05 ba 1f 20 00    	mov    0x201fba(%rip),%eax        # 203050 <verbosity>
    1096:	85 c0                	test   %eax,%eax
    1098:	74 11                	je     10ab <accessData+0x21f>
    109a:	48 8d 3d 42 09 00 00 	lea    0x942(%rip),%rdi        # 19e3 <_IO_stdin_used+0x13>
    10a1:	b8 00 00 00 00       	mov    $0x0,%eax
    10a6:	e8 35 fa ff ff       	callq  ae0 <.plt.got+0x30>
    10ab:	8b 55 dc             	mov    -0x24(%rbp),%edx
    10ae:	48 89 d0             	mov    %rdx,%rax
    10b1:	48 01 c0             	add    %rax,%rax
    10b4:	48 01 d0             	add    %rdx,%rax
    10b7:	48 c1 e0 03          	shl    $0x3,%rax
    10bb:	48 89 c2             	mov    %rax,%rdx
    10be:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    10c2:	48 01 d0             	add    %rdx,%rax
    10c5:	c6 00 01             	movb   $0x1,(%rax)
    10c8:	8b 55 dc             	mov    -0x24(%rbp),%edx
    10cb:	48 89 d0             	mov    %rdx,%rax
    10ce:	48 01 c0             	add    %rax,%rax
    10d1:	48 01 d0             	add    %rdx,%rax
    10d4:	48 c1 e0 03          	shl    $0x3,%rax
    10d8:	48 89 c2             	mov    %rax,%rdx
    10db:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    10df:	48 01 c2             	add    %rax,%rdx
    10e2:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    10e6:	48 89 42 08          	mov    %rax,0x8(%rdx)
    10ea:	8b 55 dc             	mov    -0x24(%rbp),%edx
    10ed:	48 89 d0             	mov    %rdx,%rax
    10f0:	48 01 c0             	add    %rax,%rax
    10f3:	48 01 d0             	add    %rdx,%rax
    10f6:	48 c1 e0 03          	shl    $0x3,%rax
    10fa:	48 89 c2             	mov    %rax,%rdx
    10fd:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1101:	48 8d 0c 02          	lea    (%rdx,%rax,1),%rcx
    1105:	48 8b 05 04 1f 20 00 	mov    0x201f04(%rip),%rax        # 203010 <lru_counter>
    110c:	48 8d 50 01          	lea    0x1(%rax),%rdx
    1110:	48 89 15 f9 1e 20 00 	mov    %rdx,0x201ef9(%rip)        # 203010 <lru_counter>
    1117:	48 89 41 10          	mov    %rax,0x10(%rcx)
    111b:	c9                   	leaveq 
    111c:	c3                   	retq   

000000000000111d <replayTrace>:
    111d:	55                   	push   %rbp
    111e:	48 89 e5             	mov    %rsp,%rbp
    1121:	48 81 ec 20 04 00 00 	sub    $0x420,%rsp
    1128:	48 89 bd e8 fb ff ff 	mov    %rdi,-0x418(%rbp)
    112f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
    1136:	00 00 
    1138:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    113c:	31 c0                	xor    %eax,%eax
    113e:	48 c7 85 00 fc ff ff 	movq   $0x0,-0x400(%rbp)
    1145:	00 00 00 00 
    1149:	c7 85 fc fb ff ff 00 	movl   $0x0,-0x404(%rbp)
    1150:	00 00 00 
    1153:	48 8b 85 e8 fb ff ff 	mov    -0x418(%rbp),%rax
    115a:	48 8d 35 8c 08 00 00 	lea    0x88c(%rip),%rsi        # 19ed <_IO_stdin_used+0x1d>
    1161:	48 89 c7             	mov    %rax,%rdi
    1164:	e8 bf f9 ff ff       	callq  b28 <.plt.got+0x78>
    1169:	48 89 85 08 fc ff ff 	mov    %rax,-0x3f8(%rbp)
    1170:	48 83 bd 08 fc ff ff 	cmpq   $0x0,-0x3f8(%rbp)
    1177:	00 
    1178:	0f 85 00 01 00 00    	jne    127e <replayTrace+0x161>
    117e:	e8 3d f9 ff ff       	callq  ac0 <.plt.got+0x10>
    1183:	8b 00                	mov    (%rax),%eax
    1185:	89 c7                	mov    %eax,%edi
    1187:	e8 bc f9 ff ff       	callq  b48 <.plt.got+0x98>
    118c:	48 89 c1             	mov    %rax,%rcx
    118f:	48 8b 05 aa 1e 20 00 	mov    0x201eaa(%rip),%rax        # 203040 <stderr@@GLIBC_2.2.5>
    1196:	48 8b 95 e8 fb ff ff 	mov    -0x418(%rbp),%rdx
    119d:	48 8d 35 4b 08 00 00 	lea    0x84b(%rip),%rsi        # 19ef <_IO_stdin_used+0x1f>
    11a4:	48 89 c7             	mov    %rax,%rdi
    11a7:	b8 00 00 00 00       	mov    $0x0,%eax
    11ac:	e8 57 f9 ff ff       	callq  b08 <.plt.got+0x58>
    11b1:	bf 01 00 00 00       	mov    $0x1,%edi
    11b6:	e8 85 f9 ff ff       	callq  b40 <.plt.got+0x90>
    11bb:	0f b6 85 11 fc ff ff 	movzbl -0x3ef(%rbp),%eax
    11c2:	3c 53                	cmp    $0x53,%al
    11c4:	74 1a                	je     11e0 <replayTrace+0xc3>
    11c6:	0f b6 85 11 fc ff ff 	movzbl -0x3ef(%rbp),%eax
    11cd:	3c 4c                	cmp    $0x4c,%al
    11cf:	74 0f                	je     11e0 <replayTrace+0xc3>
    11d1:	0f b6 85 11 fc ff ff 	movzbl -0x3ef(%rbp),%eax
    11d8:	3c 4d                	cmp    $0x4d,%al
    11da:	0f 85 9e 00 00 00    	jne    127e <replayTrace+0x161>
    11e0:	48 8d 85 10 fc ff ff 	lea    -0x3f0(%rbp),%rax
    11e7:	48 83 c0 03          	add    $0x3,%rax
    11eb:	48 8d 8d fc fb ff ff 	lea    -0x404(%rbp),%rcx
    11f2:	48 8d 95 00 fc ff ff 	lea    -0x400(%rbp),%rdx
    11f9:	48 8d 35 f7 07 00 00 	lea    0x7f7(%rip),%rsi        # 19f7 <_IO_stdin_used+0x27>
    1200:	48 89 c7             	mov    %rax,%rdi
    1203:	b8 00 00 00 00       	mov    $0x0,%eax
    1208:	e8 13 f9 ff ff       	callq  b20 <.plt.got+0x70>
    120d:	8b 05 3d 1e 20 00    	mov    0x201e3d(%rip),%eax        # 203050 <verbosity>
    1213:	85 c0                	test   %eax,%eax
    1215:	74 2a                	je     1241 <replayTrace+0x124>
    1217:	8b 8d fc fb ff ff    	mov    -0x404(%rbp),%ecx
    121d:	48 8b 95 00 fc ff ff 	mov    -0x400(%rbp),%rdx
    1224:	0f b6 85 11 fc ff ff 	movzbl -0x3ef(%rbp),%eax
    122b:	0f be c0             	movsbl %al,%eax
    122e:	89 c6                	mov    %eax,%esi
    1230:	48 8d 3d c8 07 00 00 	lea    0x7c8(%rip),%rdi        # 19ff <_IO_stdin_used+0x2f>
    1237:	b8 00 00 00 00       	mov    $0x0,%eax
    123c:	e8 9f f8 ff ff       	callq  ae0 <.plt.got+0x30>
    1241:	48 8b 85 00 fc ff ff 	mov    -0x400(%rbp),%rax
    1248:	48 89 c7             	mov    %rax,%rdi
    124b:	e8 3c fc ff ff       	callq  e8c <accessData>
    1250:	0f b6 85 11 fc ff ff 	movzbl -0x3ef(%rbp),%eax
    1257:	3c 4d                	cmp    $0x4d,%al
    1259:	75 0f                	jne    126a <replayTrace+0x14d>
    125b:	48 8b 85 00 fc ff ff 	mov    -0x400(%rbp),%rax
    1262:	48 89 c7             	mov    %rax,%rdi
    1265:	e8 22 fc ff ff       	callq  e8c <accessData>
    126a:	8b 05 e0 1d 20 00    	mov    0x201de0(%rip),%eax        # 203050 <verbosity>
    1270:	85 c0                	test   %eax,%eax
    1272:	74 0a                	je     127e <replayTrace+0x161>
    1274:	bf 0a 00 00 00       	mov    $0xa,%edi
    1279:	e8 3a f8 ff ff       	callq  ab8 <.plt.got+0x8>
    127e:	48 8b 95 08 fc ff ff 	mov    -0x3f8(%rbp),%rdx
    1285:	48 8d 85 10 fc ff ff 	lea    -0x3f0(%rbp),%rax
    128c:	be e8 03 00 00       	mov    $0x3e8,%esi
    1291:	48 89 c7             	mov    %rax,%rdi
    1294:	e8 67 f8 ff ff       	callq  b00 <.plt.got+0x50>
    1299:	48 85 c0             	test   %rax,%rax
    129c:	0f 85 19 ff ff ff    	jne    11bb <replayTrace+0x9e>
    12a2:	48 8b 85 08 fc ff ff 	mov    -0x3f8(%rbp),%rax
    12a9:	48 89 c7             	mov    %rax,%rdi
    12ac:	e8 1f f8 ff ff       	callq  ad0 <.plt.got+0x20>
    12b1:	90                   	nop
    12b2:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    12b6:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
    12bd:	00 00 
    12bf:	74 05                	je     12c6 <replayTrace+0x1a9>
    12c1:	e8 12 f8 ff ff       	callq  ad8 <.plt.got+0x28>
    12c6:	c9                   	leaveq 
    12c7:	c3                   	retq   

00000000000012c8 <printUsage>:
    12c8:	55                   	push   %rbp
    12c9:	48 89 e5             	mov    %rsp,%rbp
    12cc:	48 83 ec 10          	sub    $0x10,%rsp
    12d0:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    12d4:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    12d8:	48 8b 00             	mov    (%rax),%rax
    12db:	48 89 c6             	mov    %rax,%rsi
    12de:	48 8d 3d 2b 07 00 00 	lea    0x72b(%rip),%rdi        # 1a10 <_IO_stdin_used+0x40>
    12e5:	b8 00 00 00 00       	mov    $0x0,%eax
    12ea:	e8 f1 f7 ff ff       	callq  ae0 <.plt.got+0x30>
    12ef:	48 8d 3d 50 07 00 00 	lea    0x750(%rip),%rdi        # 1a46 <_IO_stdin_used+0x76>
    12f6:	e8 cd f7 ff ff       	callq  ac8 <.plt.got+0x18>
    12fb:	48 8d 3d 4e 07 00 00 	lea    0x74e(%rip),%rdi        # 1a50 <_IO_stdin_used+0x80>
    1302:	e8 c1 f7 ff ff       	callq  ac8 <.plt.got+0x18>
    1307:	48 8d 3d 6a 07 00 00 	lea    0x76a(%rip),%rdi        # 1a78 <_IO_stdin_used+0xa8>
    130e:	e8 b5 f7 ff ff       	callq  ac8 <.plt.got+0x18>
    1313:	48 8d 3d 86 07 00 00 	lea    0x786(%rip),%rdi        # 1aa0 <_IO_stdin_used+0xd0>
    131a:	e8 a9 f7 ff ff       	callq  ac8 <.plt.got+0x18>
    131f:	48 8d 3d a2 07 00 00 	lea    0x7a2(%rip),%rdi        # 1ac8 <_IO_stdin_used+0xf8>
    1326:	e8 9d f7 ff ff       	callq  ac8 <.plt.got+0x18>
    132b:	48 8d 3d be 07 00 00 	lea    0x7be(%rip),%rdi        # 1af0 <_IO_stdin_used+0x120>
    1332:	e8 91 f7 ff ff       	callq  ac8 <.plt.got+0x18>
    1337:	48 8d 3d dc 07 00 00 	lea    0x7dc(%rip),%rdi        # 1b1a <_IO_stdin_used+0x14a>
    133e:	e8 85 f7 ff ff       	callq  ac8 <.plt.got+0x18>
    1343:	48 8d 3d e9 07 00 00 	lea    0x7e9(%rip),%rdi        # 1b33 <_IO_stdin_used+0x163>
    134a:	e8 79 f7 ff ff       	callq  ac8 <.plt.got+0x18>
    134f:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1353:	48 8b 00             	mov    (%rax),%rax
    1356:	48 89 c6             	mov    %rax,%rsi
    1359:	48 8d 3d e0 07 00 00 	lea    0x7e0(%rip),%rdi        # 1b40 <_IO_stdin_used+0x170>
    1360:	b8 00 00 00 00       	mov    $0x0,%eax
    1365:	e8 76 f7 ff ff       	callq  ae0 <.plt.got+0x30>
    136a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    136e:	48 8b 00             	mov    (%rax),%rax
    1371:	48 89 c6             	mov    %rax,%rsi
    1374:	48 8d 3d f5 07 00 00 	lea    0x7f5(%rip),%rdi        # 1b70 <_IO_stdin_used+0x1a0>
    137b:	b8 00 00 00 00       	mov    $0x0,%eax
    1380:	e8 5b f7 ff ff       	callq  ae0 <.plt.got+0x30>
    1385:	bf 00 00 00 00       	mov    $0x0,%edi
    138a:	e8 b1 f7 ff ff       	callq  b40 <.plt.got+0x90>

000000000000138f <main>:
    138f:	55                   	push   %rbp
    1390:	48 89 e5             	mov    %rsp,%rbp
    1393:	48 83 ec 30          	sub    $0x30,%rsp
    1397:	89 7d ec             	mov    %edi,-0x14(%rbp)
    139a:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    139e:	e9 c0 00 00 00       	jmpq   1463 <main+0xd4>
    13a3:	0f be 45 ff          	movsbl -0x1(%rbp),%eax
    13a7:	83 e8 45             	sub    $0x45,%eax
    13aa:	83 f8 31             	cmp    $0x31,%eax
    13ad:	0f 87 9a 00 00 00    	ja     144d <main+0xbe>
    13b3:	89 c0                	mov    %eax,%eax
    13b5:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    13bc:	00 
    13bd:	48 8d 05 18 08 00 00 	lea    0x818(%rip),%rax        # 1bdc <_IO_stdin_used+0x20c>
    13c4:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    13c7:	48 63 d0             	movslq %eax,%rdx
    13ca:	48 8d 05 0b 08 00 00 	lea    0x80b(%rip),%rax        # 1bdc <_IO_stdin_used+0x20c>
    13d1:	48 01 d0             	add    %rdx,%rax
    13d4:	ff e0                	jmpq   *%rax
    13d6:	48 8b 05 43 1c 20 00 	mov    0x201c43(%rip),%rax        # 203020 <optarg@@GLIBC_2.2.5>
    13dd:	48 89 c7             	mov    %rax,%rdi
    13e0:	e8 53 f7 ff ff       	callq  b38 <.plt.got+0x88>
    13e5:	89 05 69 1c 20 00    	mov    %eax,0x201c69(%rip)        # 203054 <s>
    13eb:	eb 76                	jmp    1463 <main+0xd4>
    13ed:	48 8b 05 2c 1c 20 00 	mov    0x201c2c(%rip),%rax        # 203020 <optarg@@GLIBC_2.2.5>
    13f4:	48 89 c7             	mov    %rax,%rdi
    13f7:	e8 3c f7 ff ff       	callq  b38 <.plt.got+0x88>
    13fc:	89 05 5a 1c 20 00    	mov    %eax,0x201c5a(%rip)        # 20305c <E>
    1402:	eb 5f                	jmp    1463 <main+0xd4>
    1404:	48 8b 05 15 1c 20 00 	mov    0x201c15(%rip),%rax        # 203020 <optarg@@GLIBC_2.2.5>
    140b:	48 89 c7             	mov    %rax,%rdi
    140e:	e8 25 f7 ff ff       	callq  b38 <.plt.got+0x88>
    1413:	89 05 3f 1c 20 00    	mov    %eax,0x201c3f(%rip)        # 203058 <b>
    1419:	eb 48                	jmp    1463 <main+0xd4>
    141b:	48 8b 05 fe 1b 20 00 	mov    0x201bfe(%rip),%rax        # 203020 <optarg@@GLIBC_2.2.5>
    1422:	48 89 05 37 1c 20 00 	mov    %rax,0x201c37(%rip)        # 203060 <trace_file>
    1429:	eb 38                	jmp    1463 <main+0xd4>
    142b:	c7 05 1b 1c 20 00 01 	movl   $0x1,0x201c1b(%rip)        # 203050 <verbosity>
    1432:	00 00 00 
    1435:	eb 2c                	jmp    1463 <main+0xd4>
    1437:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    143b:	48 89 c7             	mov    %rax,%rdi
    143e:	e8 85 fe ff ff       	callq  12c8 <printUsage>
    1443:	bf 00 00 00 00       	mov    $0x0,%edi
    1448:	e8 f3 f6 ff ff       	callq  b40 <.plt.got+0x90>
    144d:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1451:	48 89 c7             	mov    %rax,%rdi
    1454:	e8 6f fe ff ff       	callq  12c8 <printUsage>
    1459:	bf 01 00 00 00       	mov    $0x1,%edi
    145e:	e8 dd f6 ff ff       	callq  b40 <.plt.got+0x90>
    1463:	48 8b 4d e0          	mov    -0x20(%rbp),%rcx
    1467:	8b 45 ec             	mov    -0x14(%rbp),%eax
    146a:	48 8d 15 32 07 00 00 	lea    0x732(%rip),%rdx        # 1ba3 <_IO_stdin_used+0x1d3>
    1471:	48 89 ce             	mov    %rcx,%rsi
    1474:	89 c7                	mov    %eax,%edi
    1476:	e8 b5 f6 ff ff       	callq  b30 <.plt.got+0x80>
    147b:	88 45 ff             	mov    %al,-0x1(%rbp)
    147e:	80 7d ff ff          	cmpb   $0xff,-0x1(%rbp)
    1482:	0f 85 1b ff ff ff    	jne    13a3 <main+0x14>
    1488:	8b 05 c6 1b 20 00    	mov    0x201bc6(%rip),%eax        # 203054 <s>
    148e:	85 c0                	test   %eax,%eax
    1490:	74 20                	je     14b2 <main+0x123>
    1492:	8b 05 c4 1b 20 00    	mov    0x201bc4(%rip),%eax        # 20305c <E>
    1498:	85 c0                	test   %eax,%eax
    149a:	74 16                	je     14b2 <main+0x123>
    149c:	8b 05 b6 1b 20 00    	mov    0x201bb6(%rip),%eax        # 203058 <b>
    14a2:	85 c0                	test   %eax,%eax
    14a4:	74 0c                	je     14b2 <main+0x123>
    14a6:	48 8b 05 b3 1b 20 00 	mov    0x201bb3(%rip),%rax        # 203060 <trace_file>
    14ad:	48 85 c0             	test   %rax,%rax
    14b0:	75 31                	jne    14e3 <main+0x154>
    14b2:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    14b6:	48 8b 00             	mov    (%rax),%rax
    14b9:	48 89 c6             	mov    %rax,%rsi
    14bc:	48 8d 3d ed 06 00 00 	lea    0x6ed(%rip),%rdi        # 1bb0 <_IO_stdin_used+0x1e0>
    14c3:	b8 00 00 00 00       	mov    $0x0,%eax
    14c8:	e8 13 f6 ff ff       	callq  ae0 <.plt.got+0x30>
    14cd:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    14d1:	48 89 c7             	mov    %rax,%rdi
    14d4:	e8 ef fd ff ff       	callq  12c8 <printUsage>
    14d9:	bf 01 00 00 00       	mov    $0x1,%edi
    14de:	e8 5d f6 ff ff       	callq  b40 <.plt.got+0x90>
    14e3:	8b 05 6b 1b 20 00    	mov    0x201b6b(%rip),%eax        # 203054 <s>
    14e9:	66 0f ef c0          	pxor   %xmm0,%xmm0
    14ed:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
    14f1:	48 8b 05 b0 07 00 00 	mov    0x7b0(%rip),%rax        # 1ca8 <_IO_stdin_used+0x2d8>
    14f8:	66 0f 28 c8          	movapd %xmm0,%xmm1
    14fc:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    1500:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
    1505:	e8 e6 f5 ff ff       	callq  af0 <.plt.got+0x40>
    150a:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
    150f:	89 05 73 1b 20 00    	mov    %eax,0x201b73(%rip)        # 203088 <S>
    1515:	8b 05 3d 1b 20 00    	mov    0x201b3d(%rip),%eax        # 203058 <b>
    151b:	66 0f ef c0          	pxor   %xmm0,%xmm0
    151f:	f2 0f 2a c0          	cvtsi2sd %eax,%xmm0
    1523:	48 8b 05 7e 07 00 00 	mov    0x77e(%rip),%rax        # 1ca8 <_IO_stdin_used+0x2d8>
    152a:	66 0f 28 c8          	movapd %xmm0,%xmm1
    152e:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    1532:	f2 0f 10 45 d8       	movsd  -0x28(%rbp),%xmm0
    1537:	e8 b4 f5 ff ff       	callq  af0 <.plt.got+0x40>
    153c:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
    1541:	89 05 31 1b 20 00    	mov    %eax,0x201b31(%rip)        # 203078 <B>
    1547:	b8 00 00 00 00       	mov    $0x0,%eax
    154c:	e8 3f f7 ff ff       	callq  c90 <initCache>
    1551:	48 8b 05 08 1b 20 00 	mov    0x201b08(%rip),%rax        # 203060 <trace_file>
    1558:	48 89 c7             	mov    %rax,%rdi
    155b:	e8 bd fb ff ff       	callq  111d <replayTrace>
    1560:	b8 00 00 00 00       	mov    $0x0,%eax
    1565:	e8 d1 f8 ff ff       	callq  e3b <freeCache>
    156a:	8b 15 00 1b 20 00    	mov    0x201b00(%rip),%edx        # 203070 <eviction_count>
    1570:	8b 0d f2 1a 20 00    	mov    0x201af2(%rip),%ecx        # 203068 <miss_count>
    1576:	8b 05 f0 1a 20 00    	mov    0x201af0(%rip),%eax        # 20306c <hit_count>
    157c:	89 ce                	mov    %ecx,%esi
    157e:	89 c7                	mov    %eax,%edi
    1580:	e8 07 00 00 00       	callq  158c <printSummary>
    1585:	b8 00 00 00 00       	mov    $0x0,%eax
    158a:	c9                   	leaveq 
    158b:	c3                   	retq   

000000000000158c <printSummary>:
    158c:	55                   	push   %rbp
    158d:	48 89 e5             	mov    %rsp,%rbp
    1590:	48 83 ec 20          	sub    $0x20,%rsp
    1594:	89 7d ec             	mov    %edi,-0x14(%rbp)
    1597:	89 75 e8             	mov    %esi,-0x18(%rbp)
    159a:	89 55 e4             	mov    %edx,-0x1c(%rbp)
    159d:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
    15a0:	8b 55 e8             	mov    -0x18(%rbp),%edx
    15a3:	8b 45 ec             	mov    -0x14(%rbp),%eax
    15a6:	89 c6                	mov    %eax,%esi
    15a8:	48 8d 3d 11 07 00 00 	lea    0x711(%rip),%rdi        # 1cc0 <_IO_stdin_used+0x2f0>
    15af:	b8 00 00 00 00       	mov    $0x0,%eax
    15b4:	e8 27 f5 ff ff       	callq  ae0 <.plt.got+0x30>
    15b9:	48 8d 35 20 07 00 00 	lea    0x720(%rip),%rsi        # 1ce0 <_IO_stdin_used+0x310>
    15c0:	48 8d 3d 1b 07 00 00 	lea    0x71b(%rip),%rdi        # 1ce2 <_IO_stdin_used+0x312>
    15c7:	e8 5c f5 ff ff       	callq  b28 <.plt.got+0x78>
    15cc:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    15d0:	48 83 7d f8 00       	cmpq   $0x0,-0x8(%rbp)
    15d5:	75 1f                	jne    15f6 <printSummary+0x6a>
    15d7:	48 8d 0d 32 07 00 00 	lea    0x732(%rip),%rcx        # 1d10 <__PRETTY_FUNCTION__.2184>
    15de:	ba 15 00 00 00       	mov    $0x15,%edx
    15e3:	48 8d 35 06 07 00 00 	lea    0x706(%rip),%rsi        # 1cf0 <_IO_stdin_used+0x320>
    15ea:	48 8d 3d 0a 07 00 00 	lea    0x70a(%rip),%rdi        # 1cfb <_IO_stdin_used+0x32b>
    15f1:	e8 f2 f4 ff ff       	callq  ae8 <.plt.got+0x38>
    15f6:	8b 75 e4             	mov    -0x1c(%rbp),%esi
    15f9:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    15fc:	8b 55 ec             	mov    -0x14(%rbp),%edx
    15ff:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    1603:	41 89 f0             	mov    %esi,%r8d
    1606:	48 8d 35 f8 06 00 00 	lea    0x6f8(%rip),%rsi        # 1d05 <_IO_stdin_used+0x335>
    160d:	48 89 c7             	mov    %rax,%rdi
    1610:	b8 00 00 00 00       	mov    $0x0,%eax
    1615:	e8 ee f4 ff ff       	callq  b08 <.plt.got+0x58>
    161a:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
    161e:	48 89 c7             	mov    %rax,%rdi
    1621:	e8 aa f4 ff ff       	callq  ad0 <.plt.got+0x20>
    1626:	90                   	nop
    1627:	c9                   	leaveq 
    1628:	c3                   	retq   

0000000000001629 <initMatrix>:
    1629:	55                   	push   %rbp
    162a:	48 89 e5             	mov    %rsp,%rbp
    162d:	41 55                	push   %r13
    162f:	41 54                	push   %r12
    1631:	53                   	push   %rbx
    1632:	48 83 ec 48          	sub    $0x48,%rsp
    1636:	89 7d bc             	mov    %edi,-0x44(%rbp)
    1639:	89 75 b8             	mov    %esi,-0x48(%rbp)
    163c:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
    1640:	48 89 4d a8          	mov    %rcx,-0x58(%rbp)
    1644:	8b 5d bc             	mov    -0x44(%rbp),%ebx
    1647:	48 63 c3             	movslq %ebx,%rax
    164a:	48 83 e8 01          	sub    $0x1,%rax
    164e:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
    1652:	48 63 c3             	movslq %ebx,%rax
    1655:	49 89 c2             	mov    %rax,%r10
    1658:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    165e:	44 8b 65 b8          	mov    -0x48(%rbp),%r12d
    1662:	49 63 c4             	movslq %r12d,%rax
    1665:	48 83 e8 01          	sub    $0x1,%rax
    1669:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    166d:	49 63 c4             	movslq %r12d,%rax
    1670:	49 89 c0             	mov    %rax,%r8
    1673:	41 b9 00 00 00 00    	mov    $0x0,%r9d
    1679:	bf 00 00 00 00       	mov    $0x0,%edi
    167e:	e8 8d f4 ff ff       	callq  b10 <.plt.got+0x60>
    1683:	89 c7                	mov    %eax,%edi
    1685:	e8 6e f4 ff ff       	callq  af8 <.plt.got+0x48>
    168a:	c7 45 c8 00 00 00 00 	movl   $0x0,-0x38(%rbp)
    1691:	eb 75                	jmp    1708 <initMatrix+0xdf>
    1693:	c7 45 cc 00 00 00 00 	movl   $0x0,-0x34(%rbp)
    169a:	eb 60                	jmp    16fc <initMatrix+0xd3>
    169c:	8b 45 c8             	mov    -0x38(%rbp),%eax
    169f:	48 63 d0             	movslq %eax,%rdx
    16a2:	48 63 c3             	movslq %ebx,%rax
    16a5:	48 0f af c2          	imul   %rdx,%rax
    16a9:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    16b0:	00 
    16b1:	48 8b 45 b0          	mov    -0x50(%rbp),%rax
    16b5:	4c 8d 2c 02          	lea    (%rdx,%rax,1),%r13
    16b9:	e8 9a f4 ff ff       	callq  b58 <.plt.got+0xa8>
    16be:	89 c2                	mov    %eax,%edx
    16c0:	8b 45 cc             	mov    -0x34(%rbp),%eax
    16c3:	48 98                	cltq   
    16c5:	41 89 54 85 00       	mov    %edx,0x0(%r13,%rax,4)
    16ca:	8b 45 cc             	mov    -0x34(%rbp),%eax
    16cd:	48 63 d0             	movslq %eax,%rdx
    16d0:	49 63 c4             	movslq %r12d,%rax
    16d3:	48 0f af c2          	imul   %rdx,%rax
    16d7:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    16de:	00 
    16df:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
    16e3:	4c 8d 2c 02          	lea    (%rdx,%rax,1),%r13
    16e7:	e8 6c f4 ff ff       	callq  b58 <.plt.got+0xa8>
    16ec:	89 c2                	mov    %eax,%edx
    16ee:	8b 45 c8             	mov    -0x38(%rbp),%eax
    16f1:	48 98                	cltq   
    16f3:	41 89 54 85 00       	mov    %edx,0x0(%r13,%rax,4)
    16f8:	83 45 cc 01          	addl   $0x1,-0x34(%rbp)
    16fc:	8b 45 cc             	mov    -0x34(%rbp),%eax
    16ff:	3b 45 bc             	cmp    -0x44(%rbp),%eax
    1702:	7c 98                	jl     169c <initMatrix+0x73>
    1704:	83 45 c8 01          	addl   $0x1,-0x38(%rbp)
    1708:	8b 45 c8             	mov    -0x38(%rbp),%eax
    170b:	3b 45 b8             	cmp    -0x48(%rbp),%eax
    170e:	7c 83                	jl     1693 <initMatrix+0x6a>
    1710:	90                   	nop
    1711:	48 83 c4 48          	add    $0x48,%rsp
    1715:	5b                   	pop    %rbx
    1716:	41 5c                	pop    %r12
    1718:	41 5d                	pop    %r13
    171a:	5d                   	pop    %rbp
    171b:	c3                   	retq   

000000000000171c <randMatrix>:
    171c:	55                   	push   %rbp
    171d:	48 89 e5             	mov    %rsp,%rbp
    1720:	41 54                	push   %r12
    1722:	53                   	push   %rbx
    1723:	48 83 ec 20          	sub    $0x20,%rsp
    1727:	89 7d dc             	mov    %edi,-0x24(%rbp)
    172a:	89 75 d8             	mov    %esi,-0x28(%rbp)
    172d:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
    1731:	8b 5d dc             	mov    -0x24(%rbp),%ebx
    1734:	48 63 c3             	movslq %ebx,%rax
    1737:	48 83 e8 01          	sub    $0x1,%rax
    173b:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
    173f:	48 63 c3             	movslq %ebx,%rax
    1742:	49 89 c0             	mov    %rax,%r8
    1745:	41 b9 00 00 00 00    	mov    $0x0,%r9d
    174b:	bf 00 00 00 00       	mov    $0x0,%edi
    1750:	e8 bb f3 ff ff       	callq  b10 <.plt.got+0x60>
    1755:	89 c7                	mov    %eax,%edi
    1757:	e8 9c f3 ff ff       	callq  af8 <.plt.got+0x48>
    175c:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%rbp)
    1763:	eb 46                	jmp    17ab <randMatrix+0x8f>
    1765:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    176c:	eb 31                	jmp    179f <randMatrix+0x83>
    176e:	8b 45 e0             	mov    -0x20(%rbp),%eax
    1771:	48 63 d0             	movslq %eax,%rdx
    1774:	48 63 c3             	movslq %ebx,%rax
    1777:	48 0f af c2          	imul   %rdx,%rax
    177b:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1782:	00 
    1783:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    1787:	4c 8d 24 02          	lea    (%rdx,%rax,1),%r12
    178b:	e8 c8 f3 ff ff       	callq  b58 <.plt.got+0xa8>
    1790:	89 c2                	mov    %eax,%edx
    1792:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    1795:	48 98                	cltq   
    1797:	41 89 14 84          	mov    %edx,(%r12,%rax,4)
    179b:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
    179f:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    17a2:	3b 45 dc             	cmp    -0x24(%rbp),%eax
    17a5:	7c c7                	jl     176e <randMatrix+0x52>
    17a7:	83 45 e0 01          	addl   $0x1,-0x20(%rbp)
    17ab:	8b 45 e0             	mov    -0x20(%rbp),%eax
    17ae:	3b 45 d8             	cmp    -0x28(%rbp),%eax
    17b1:	7c b2                	jl     1765 <randMatrix+0x49>
    17b3:	90                   	nop
    17b4:	48 83 c4 20          	add    $0x20,%rsp
    17b8:	5b                   	pop    %rbx
    17b9:	41 5c                	pop    %r12
    17bb:	5d                   	pop    %rbp
    17bc:	c3                   	retq   

00000000000017bd <correctTrans>:
    17bd:	55                   	push   %rbp
    17be:	48 89 e5             	mov    %rsp,%rbp
    17c1:	89 7d dc             	mov    %edi,-0x24(%rbp)
    17c4:	89 75 d8             	mov    %esi,-0x28(%rbp)
    17c7:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
    17cb:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
    17cf:	8b 45 dc             	mov    -0x24(%rbp),%eax
    17d2:	48 63 d0             	movslq %eax,%rdx
    17d5:	48 83 ea 01          	sub    $0x1,%rdx
    17d9:	48 89 55 f0          	mov    %rdx,-0x10(%rbp)
    17dd:	48 63 d0             	movslq %eax,%rdx
    17e0:	49 89 d2             	mov    %rdx,%r10
    17e3:	41 bb 00 00 00 00    	mov    $0x0,%r11d
    17e9:	8b 55 d8             	mov    -0x28(%rbp),%edx
    17ec:	48 63 ca             	movslq %edx,%rcx
    17ef:	48 83 e9 01          	sub    $0x1,%rcx
    17f3:	48 89 4d f8          	mov    %rcx,-0x8(%rbp)
    17f7:	48 63 ca             	movslq %edx,%rcx
    17fa:	49 89 c8             	mov    %rcx,%r8
    17fd:	41 b9 00 00 00 00    	mov    $0x0,%r9d
    1803:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%rbp)
    180a:	eb 6a                	jmp    1876 <correctTrans+0xb9>
    180c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%rbp)
    1813:	eb 55                	jmp    186a <correctTrans+0xad>
    1815:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
    1818:	48 63 f1             	movslq %ecx,%rsi
    181b:	48 63 c8             	movslq %eax,%rcx
    181e:	48 0f af ce          	imul   %rsi,%rcx
    1822:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1829:	00 
    182a:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
    182e:	48 01 ce             	add    %rcx,%rsi
    1831:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    1834:	48 63 c9             	movslq %ecx,%rcx
    1837:	8b 0c 8e             	mov    (%rsi,%rcx,4),%ecx
    183a:	89 4d ec             	mov    %ecx,-0x14(%rbp)
    183d:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    1840:	48 63 f1             	movslq %ecx,%rsi
    1843:	48 63 ca             	movslq %edx,%rcx
    1846:	48 0f af ce          	imul   %rsi,%rcx
    184a:	48 8d 34 8d 00 00 00 	lea    0x0(,%rcx,4),%rsi
    1851:	00 
    1852:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
    1856:	48 8d 3c 0e          	lea    (%rsi,%rcx,1),%rdi
    185a:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
    185d:	48 63 c9             	movslq %ecx,%rcx
    1860:	8b 75 ec             	mov    -0x14(%rbp),%esi
    1863:	89 34 8f             	mov    %esi,(%rdi,%rcx,4)
    1866:	83 45 e8 01          	addl   $0x1,-0x18(%rbp)
    186a:	8b 4d e8             	mov    -0x18(%rbp),%ecx
    186d:	3b 4d dc             	cmp    -0x24(%rbp),%ecx
    1870:	7c a3                	jl     1815 <correctTrans+0x58>
    1872:	83 45 e4 01          	addl   $0x1,-0x1c(%rbp)
    1876:	8b 4d e4             	mov    -0x1c(%rbp),%ecx
    1879:	3b 4d d8             	cmp    -0x28(%rbp),%ecx
    187c:	7c 8e                	jl     180c <correctTrans+0x4f>
    187e:	90                   	nop
    187f:	5d                   	pop    %rbp
    1880:	c3                   	retq   

0000000000001881 <registerTransFunction>:
    1881:	55                   	push   %rbp
    1882:	48 89 e5             	mov    %rsp,%rbp
    1885:	48 89 7d f8          	mov    %rdi,-0x8(%rbp)
    1889:	48 89 75 f0          	mov    %rsi,-0x10(%rbp)
    188d:	8b 05 e1 17 20 00    	mov    0x2017e1(%rip),%eax        # 203074 <func_counter>
    1893:	48 98                	cltq   
    1895:	48 c1 e0 05          	shl    $0x5,%rax
    1899:	48 89 c1             	mov    %rax,%rcx
    189c:	48 8d 05 fd 17 20 00 	lea    0x2017fd(%rip),%rax        # 2030a0 <func_list>
    18a3:	48 8b 55 f8          	mov    -0x8(%rbp),%rdx
    18a7:	48 89 14 01          	mov    %rdx,(%rcx,%rax,1)
    18ab:	8b 05 c3 17 20 00    	mov    0x2017c3(%rip),%eax        # 203074 <func_counter>
    18b1:	48 98                	cltq   
    18b3:	48 c1 e0 05          	shl    $0x5,%rax
    18b7:	48 89 c1             	mov    %rax,%rcx
    18ba:	48 8d 05 e7 17 20 00 	lea    0x2017e7(%rip),%rax        # 2030a8 <func_list+0x8>
    18c1:	48 8b 55 f0          	mov    -0x10(%rbp),%rdx
    18c5:	48 89 14 01          	mov    %rdx,(%rcx,%rax,1)
    18c9:	8b 05 a5 17 20 00    	mov    0x2017a5(%rip),%eax        # 203074 <func_counter>
    18cf:	48 98                	cltq   
    18d1:	48 c1 e0 05          	shl    $0x5,%rax
    18d5:	48 89 c2             	mov    %rax,%rdx
    18d8:	48 8d 05 d1 17 20 00 	lea    0x2017d1(%rip),%rax        # 2030b0 <func_list+0x10>
    18df:	c6 04 02 00          	movb   $0x0,(%rdx,%rax,1)
    18e3:	8b 05 8b 17 20 00    	mov    0x20178b(%rip),%eax        # 203074 <func_counter>
    18e9:	48 98                	cltq   
    18eb:	48 c1 e0 05          	shl    $0x5,%rax
    18ef:	48 89 c2             	mov    %rax,%rdx
    18f2:	48 8d 05 bb 17 20 00 	lea    0x2017bb(%rip),%rax        # 2030b4 <func_list+0x14>
    18f9:	c7 04 02 00 00 00 00 	movl   $0x0,(%rdx,%rax,1)
    1900:	8b 05 6e 17 20 00    	mov    0x20176e(%rip),%eax        # 203074 <func_counter>
    1906:	48 98                	cltq   
    1908:	48 c1 e0 05          	shl    $0x5,%rax
    190c:	48 89 c2             	mov    %rax,%rdx
    190f:	48 8d 05 a2 17 20 00 	lea    0x2017a2(%rip),%rax        # 2030b8 <func_list+0x18>
    1916:	c7 04 02 00 00 00 00 	movl   $0x0,(%rdx,%rax,1)
    191d:	8b 05 51 17 20 00    	mov    0x201751(%rip),%eax        # 203074 <func_counter>
    1923:	48 98                	cltq   
    1925:	48 c1 e0 05          	shl    $0x5,%rax
    1929:	48 89 c2             	mov    %rax,%rdx
    192c:	48 8d 05 89 17 20 00 	lea    0x201789(%rip),%rax        # 2030bc <func_list+0x1c>
    1933:	c7 04 02 00 00 00 00 	movl   $0x0,(%rdx,%rax,1)
    193a:	8b 05 34 17 20 00    	mov    0x201734(%rip),%eax        # 203074 <func_counter>
    1940:	83 c0 01             	add    $0x1,%eax
    1943:	89 05 2b 17 20 00    	mov    %eax,0x20172b(%rip)        # 203074 <func_counter>
    1949:	90                   	nop
    194a:	5d                   	pop    %rbp
    194b:	c3                   	retq   
    194c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001950 <__libc_csu_init>:
    1950:	41 57                	push   %r15
    1952:	41 56                	push   %r14
    1954:	41 89 ff             	mov    %edi,%r15d
    1957:	41 55                	push   %r13
    1959:	41 54                	push   %r12
    195b:	4c 8d 25 c6 13 20 00 	lea    0x2013c6(%rip),%r12        # 202d28 <__frame_dummy_init_array_entry>
    1962:	55                   	push   %rbp
    1963:	48 8d 2d c6 13 20 00 	lea    0x2013c6(%rip),%rbp        # 202d30 <__init_array_end>
    196a:	53                   	push   %rbx
    196b:	49 89 f6             	mov    %rsi,%r14
    196e:	49 89 d5             	mov    %rdx,%r13
    1971:	4c 29 e5             	sub    %r12,%rbp
    1974:	48 83 ec 08          	sub    $0x8,%rsp
    1978:	48 c1 fd 03          	sar    $0x3,%rbp
    197c:	e8 07 f1 ff ff       	callq  a88 <_init>
    1981:	48 85 ed             	test   %rbp,%rbp
    1984:	74 20                	je     19a6 <__libc_csu_init+0x56>
    1986:	31 db                	xor    %ebx,%ebx
    1988:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
    198f:	00 
    1990:	4c 89 ea             	mov    %r13,%rdx
    1993:	4c 89 f6             	mov    %r14,%rsi
    1996:	44 89 ff             	mov    %r15d,%edi
    1999:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
    199d:	48 83 c3 01          	add    $0x1,%rbx
    19a1:	48 39 dd             	cmp    %rbx,%rbp
    19a4:	75 ea                	jne    1990 <__libc_csu_init+0x40>
    19a6:	48 83 c4 08          	add    $0x8,%rsp
    19aa:	5b                   	pop    %rbx
    19ab:	5d                   	pop    %rbp
    19ac:	41 5c                	pop    %r12
    19ae:	41 5d                	pop    %r13
    19b0:	41 5e                	pop    %r14
    19b2:	41 5f                	pop    %r15
    19b4:	c3                   	retq   
    19b5:	90                   	nop
    19b6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
    19bd:	00 00 00 

00000000000019c0 <__libc_csu_fini>:
    19c0:	f3 c3                	repz retq 

Disassembly of section .fini:

00000000000019c4 <_fini>:
    19c4:	48 83 ec 08          	sub    $0x8,%rsp
    19c8:	48 83 c4 08          	add    $0x8,%rsp
    19cc:	c3                   	retq   
