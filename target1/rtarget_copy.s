
00000000004017a8 <getbuf>:
  4017a8:	48 83 ec 28          	sub    $0x28,%rsp
  4017ac:	48 89 e7             	mov    %rsp,%rdi
  4017af:	e8 ac 03 00 00       	callq  401b60 <Gets>
  4017b4:	b8 01 00 00 00       	mov    $0x1,%eax
  4017b9:	48 83 c4 28          	add    $0x28,%rsp
  4017bd:	c3                   	retq   
  4017be:	90                   	nop
  4017bf:	90                   	nop

00000000004017c0 <touch1>:
  4017c0:	48 83 ec 08          	sub    $0x8,%rsp
  4017c4:	c7 05 0e 3d 20 00 01 	movl   $0x1,0x203d0e(%rip)        # 6054dc <vlevel>
  4017cb:	00 00 00 
  4017ce:	bf e5 31 40 00       	mov    $0x4031e5,%edi
  4017d3:	e8 e8 f4 ff ff       	callq  400cc0 <puts@plt>
  4017d8:	bf 01 00 00 00       	mov    $0x1,%edi
  4017dd:	e8 cb 05 00 00       	callq  401dad <validate>
  4017e2:	bf 00 00 00 00       	mov    $0x0,%edi
  4017e7:	e8 54 f6 ff ff       	callq  400e40 <exit@plt>

00000000004017ec <touch2>:
  4017ec:	48 83 ec 08          	sub    $0x8,%rsp
  4017f0:	89 fa                	mov    %edi,%edx
  4017f2:	c7 05 e0 3c 20 00 02 	movl   $0x2,0x203ce0(%rip)        # 6054dc <vlevel>
  4017f9:	00 00 00 
  4017fc:	3b 3d e2 3c 20 00    	cmp    0x203ce2(%rip),%edi        # 6054e4 <cookie>
  401802:	75 20                	jne    401824 <touch2+0x38>
  401804:	be 08 32 40 00       	mov    $0x403208,%esi
  401809:	bf 01 00 00 00       	mov    $0x1,%edi
  40180e:	b8 00 00 00 00       	mov    $0x0,%eax
  401813:	e8 d8 f5 ff ff       	callq  400df0 <__printf_chk@plt>
  401818:	bf 02 00 00 00       	mov    $0x2,%edi
  40181d:	e8 8b 05 00 00       	callq  401dad <validate>
  401822:	eb 1e                	jmp    401842 <touch2+0x56>
  401824:	be 30 32 40 00       	mov    $0x403230,%esi
  401829:	bf 01 00 00 00       	mov    $0x1,%edi
  40182e:	b8 00 00 00 00       	mov    $0x0,%eax
  401833:	e8 b8 f5 ff ff       	callq  400df0 <__printf_chk@plt>
  401838:	bf 02 00 00 00       	mov    $0x2,%edi
  40183d:	e8 2d 06 00 00       	callq  401e6f <fail>
  401842:	bf 00 00 00 00       	mov    $0x0,%edi
  401847:	e8 f4 f5 ff ff       	callq  400e40 <exit@plt>

000000000040184c <hexmatch>:
  40184c:	41 54                	push   %r12
  40184e:	55                   	push   %rbp
  40184f:	53                   	push   %rbx
  401850:	48 83 c4 80          	add    $0xffffffffffffff80,%rsp
  401854:	41 89 fc             	mov    %edi,%r12d
  401857:	48 89 f5             	mov    %rsi,%rbp
  40185a:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401861:	00 00 
  401863:	48 89 44 24 78       	mov    %rax,0x78(%rsp)
  401868:	31 c0                	xor    %eax,%eax
  40186a:	e8 41 f5 ff ff       	callq  400db0 <random@plt>
  40186f:	48 89 c1             	mov    %rax,%rcx
  401872:	48 ba 0b d7 a3 70 3d 	movabs $0xa3d70a3d70a3d70b,%rdx
  401879:	0a d7 a3 
  40187c:	48 f7 ea             	imul   %rdx
  40187f:	48 01 ca             	add    %rcx,%rdx
  401882:	48 c1 fa 06          	sar    $0x6,%rdx
  401886:	48 89 c8             	mov    %rcx,%rax
  401889:	48 c1 f8 3f          	sar    $0x3f,%rax
  40188d:	48 29 c2             	sub    %rax,%rdx
  401890:	48 8d 04 92          	lea    (%rdx,%rdx,4),%rax
  401894:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401898:	48 c1 e0 02          	shl    $0x2,%rax
  40189c:	48 29 c1             	sub    %rax,%rcx
  40189f:	48 8d 1c 0c          	lea    (%rsp,%rcx,1),%rbx
  4018a3:	45 89 e0             	mov    %r12d,%r8d
  4018a6:	b9 02 32 40 00       	mov    $0x403202,%ecx
  4018ab:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  4018b2:	be 01 00 00 00       	mov    $0x1,%esi
  4018b7:	48 89 df             	mov    %rbx,%rdi
  4018ba:	b8 00 00 00 00       	mov    $0x0,%eax
  4018bf:	e8 ac f5 ff ff       	callq  400e70 <__sprintf_chk@plt>
  4018c4:	ba 09 00 00 00       	mov    $0x9,%edx
  4018c9:	48 89 de             	mov    %rbx,%rsi
  4018cc:	48 89 ef             	mov    %rbp,%rdi
  4018cf:	e8 cc f3 ff ff       	callq  400ca0 <strncmp@plt>
  4018d4:	85 c0                	test   %eax,%eax
  4018d6:	0f 94 c0             	sete   %al
  4018d9:	0f b6 c0             	movzbl %al,%eax
  4018dc:	48 8b 74 24 78       	mov    0x78(%rsp),%rsi
  4018e1:	64 48 33 34 25 28 00 	xor    %fs:0x28,%rsi
  4018e8:	00 00 
  4018ea:	74 05                	je     4018f1 <hexmatch+0xa5>
  4018ec:	e8 ef f3 ff ff       	callq  400ce0 <__stack_chk_fail@plt>
  4018f1:	48 83 ec 80          	sub    $0xffffffffffffff80,%rsp
  4018f5:	5b                   	pop    %rbx
  4018f6:	5d                   	pop    %rbp
  4018f7:	41 5c                	pop    %r12
  4018f9:	c3                   	retq   

00000000004018fa <touch3>:
  4018fa:	53                   	push   %rbx
  4018fb:	48 89 fb             	mov    %rdi,%rbx
  4018fe:	c7 05 d4 3b 20 00 03 	movl   $0x3,0x203bd4(%rip)        # 6054dc <vlevel>
  401905:	00 00 00 
  401908:	48 89 fe             	mov    %rdi,%rsi
  40190b:	8b 3d d3 3b 20 00    	mov    0x203bd3(%rip),%edi        # 6054e4 <cookie>
  401911:	e8 36 ff ff ff       	callq  40184c <hexmatch>
  401916:	85 c0                	test   %eax,%eax
  401918:	74 23                	je     40193d <touch3+0x43>
  40191a:	48 89 da             	mov    %rbx,%rdx
  40191d:	be 58 32 40 00       	mov    $0x403258,%esi
  401922:	bf 01 00 00 00       	mov    $0x1,%edi
  401927:	b8 00 00 00 00       	mov    $0x0,%eax
  40192c:	e8 bf f4 ff ff       	callq  400df0 <__printf_chk@plt>
  401931:	bf 03 00 00 00       	mov    $0x3,%edi
  401936:	e8 72 04 00 00       	callq  401dad <validate>
  40193b:	eb 21                	jmp    40195e <touch3+0x64>
  40193d:	48 89 da             	mov    %rbx,%rdx
  401940:	be 80 32 40 00       	mov    $0x403280,%esi
  401945:	bf 01 00 00 00       	mov    $0x1,%edi
  40194a:	b8 00 00 00 00       	mov    $0x0,%eax
  40194f:	e8 9c f4 ff ff       	callq  400df0 <__printf_chk@plt>
  401954:	bf 03 00 00 00       	mov    $0x3,%edi
  401959:	e8 11 05 00 00       	callq  401e6f <fail>
  40195e:	bf 00 00 00 00       	mov    $0x0,%edi
  401963:	e8 d8 f4 ff ff       	callq  400e40 <exit@plt>

0000000000401968 <test>:
  401968:	48 83 ec 08          	sub    $0x8,%rsp
  40196c:	b8 00 00 00 00       	mov    $0x0,%eax
  401971:	e8 32 fe ff ff       	callq  4017a8 <getbuf>
  401976:	89 c2                	mov    %eax,%edx
  401978:	be a8 32 40 00       	mov    $0x4032a8,%esi
  40197d:	bf 01 00 00 00       	mov    $0x1,%edi
  401982:	b8 00 00 00 00       	mov    $0x0,%eax
  401987:	e8 64 f4 ff ff       	callq  400df0 <__printf_chk@plt>
  40198c:	48 83 c4 08          	add    $0x8,%rsp
  401990:	c3                   	retq   
  401991:	90                   	nop
  401992:	90                   	nop
  401993:	90                   	nop

0000000000401994 <start_farm>:
  401994:	b8 01 00 00 00       	mov    $0x1,%eax
  401999:	c3                   	retq   

000000000040199a <getval_142>:
  40199a:	b8 fb 78 90 90       	mov    $0x909078fb,%eax
  40199f:	c3                   	retq   

0000000019a0 <addval_273>:
  4019a0:	8d 87 48 89 c7 c3    	lea    -0x3c3876b8(%rdi),%eax
  4019a6:	c3                   	retq   

00000000004019a7 <addval_219>:
  4019a7:	8d 87 51 73 58 90    	lea    -0x6fa78caf(%rdi),%eax
  4019ad:	c3                   	retq   

00000000004019ae <setval_237>:
  4019ae:	c7 07 48 89 c7 c7    	movl   $0xc7c78948,(%rdi)
  4019b4:	c3                   	retq   

00000000004019b5 <setval_424>:
  4019b5:	c7 07 54 c2 58 92    	movl   $0x9258c254,(%rdi)
  4019bb:	c3                   	retq   

00000000004019bc <setval_470>:
  4019bc:	c7 07 63 48 8d c7    	movl   $0xc78d4863,(%rdi)
  4019c2:	c3                   	retq   

00000000004019c3 <setval_426>:
  4019c3:	c7 07 48 89 c7 90    	movl   $0x90c78948,(%rdi)
  4019c9:	c3                   	retq   

00000000004019ca <getval_280>:
  4019ca:	b8 29 58 90 c3       	mov    $0xc3905829,%eax
  4019cf:	c3                   	retq   

00000000004019d0 <mid_farm>:
  4019d0:	b8 01 00 00 00       	mov    $0x1,%eax
  4019d5:	c3                   	retq   

00000000004019d6 <add_xy>:
  4019d6:	48 8d 04 37          	lea    (%rdi,%rsi,1),%rax
  4019da:	c3                   	retq   

00000000004019db <getval_481>:
  4019db:	b8 5c 89 c2 90       	mov    $0x90c2895c,%eax
  4019e0:	c3                   	retq   

00000000004019e1 <setval_296>:
  4019e1:	c7 07 99 d1 90 90    	movl   $0x9090d199,(%rdi)
  4019e7:	c3                   	retq   

00000000004019e8 <addval_113>:
  4019e8:	8d 87 89 ce 78 c9    	lea    -0x36873177(%rdi),%eax
  4019ee:	c3                   	retq   

00000000004019ef <addval_490>:
  4019ef:	8d 87 8d d1 20 db    	lea    -0x24df2e73(%rdi),%eax
  4019f5:	c3                   	retq   

00000000004019f6 <getval_226>:
  4019f6:	b8 89 d1 48 c0       	mov    $0xc048d189,%eax
  4019fb:	c3                   	retq   

00000000004019fc <setval_384>:
  4019fc:	c7 07 81 d1 84 c0    	movl   $0xc084d181,(%rdi)
  401a02:	c3                   	retq   

0000000000401a03 <addval_190>:
  401a03:	8d 87 41 48 89 e0    	lea    -0x1f76b7bf(%rdi),%eax
  401a09:	c3                   	retq   

0000000000401a0a <setval_276>:
  401a0a:	c7 07 88 c2 08 c9    	movl   $0xc908c288,(%rdi)
  401a10:	c3                   	retq   

0000000000401a11 <addval_436>:
  401a11:	8d 87 89 ce 90 90    	lea    -0x6f6f3177(%rdi),%eax
  401a17:	c3                   	retq   

0000000000401a18 <getval_345>:
  401a18:	b8 48 89 e0 c1       	mov    $0xc1e08948,%eax
  401a1d:	c3                   	retq   

0000000000401a1e <addval_479>:
  401a1e:	8d 87 89 c2 00 c9    	lea    -0x36ff3d77(%rdi),%eax
  401a24:	c3                   	retq   

0000000000401a25 <addval_187>:
  401a25:	8d 87 89 ce 38 c0    	lea    -0x3fc73177(%rdi),%eax
  401a2b:	c3                   	retq   

0000000000401a2c <setval_248>:
  401a2c:	c7 07 81 ce 08 db    	movl   $0xdb08ce81,(%rdi)
  401a32:	c3                   	retq   

0000000000401a33 <getval_159>:
  401a33:	b8 89 d1 38 c9       	mov    $0xc938d189,%eax
  401a38:	c3                   	retq   

0000000000401a39 <addval_110>:
  401a39:	8d 87 c8 89 e0 c3    	lea    -0x3c1f7638(%rdi),%eax
  401a3f:	c3                   	retq   

0000000000401a40 <addval_487>:
  401a40:	8d 87 89 c2 84 c0    	lea    -0x3f7b3d77(%rdi),%eax
  401a46:	c3                   	retq   

0000000000401a47 <addval_201>:
  401a47:	8d 87 48 89 e0 c7    	lea    -0x381f76b8(%rdi),%eax
  401a4d:	c3                   	retq   

0000000000401a4e <getval_272>:
  401a4e:	b8 99 d1 08 d2       	mov    $0xd208d199,%eax
  401a53:	c3                   	retq   

0000000000401a54 <getval_155>:
  401a54:	b8 89 c2 c4 c9       	mov    $0xc9c4c289,%eax
  401a59:	c3                   	retq   

0000000000401a5a <setval_299>:
  401a5a:	c7 07 48 89 e0 91    	movl   $0x91e08948,(%rdi)
  401a60:	c3                   	retq   

0000000000401a61 <addval_404>:
  401a61:	8d 87 89 ce 92 c3    	lea    -0x3c6d3177(%rdi),%eax
  401a67:	c3                   	retq   

0000000000401a68 <getval_311>:
  401a68:	b8 89 d1 08 db       	mov    $0xdb08d189,%eax
  401a6d:	c3                   	retq   

0000000000401a6e <setval_167>:
  401a6e:	c7 07 89 d1 91 c3    	movl   $0xc391d189,(%rdi)
  401a74:	c3                   	retq   

0000000000401a75 <setval_328>:
  401a75:	c7 07 81 c2 38 d2    	movl   $0xd238c281,(%rdi)
  401a7b:	c3                   	retq   

0000000000401a7c <setval_450>:
  401a7c:	c7 07 09 ce 08 c9    	movl   $0xc908ce09,(%rdi)
  401a82:	c3                   	retq   

0000000000401a83 <addval_358>:
  401a83:	8d 87 08 89 e0 90    	lea    -0x6f1f76f8(%rdi),%eax
  401a89:	c3                   	retq   

0000000000401a8a <addval_124>:
  401a8a:	8d 87 89 c2 c7 3c    	lea    0x3cc7c289(%rdi),%eax
  401a90:	c3                   	retq   

0000000000401a91 <getval_169>:
  401a91:	b8 88 ce 20 c0       	mov    $0xc020ce88,%eax
  401a96:	c3                   	retq   

0000000000401a97 <setval_181>:
  401a97:	c7 07 48 89 e0 c2    	movl   $0xc2e08948,(%rdi)
  401a9d:	c3                   	retq   

0000000000401a9e <addval_184>:
  401a9e:	8d 87 89 c2 60 d2    	lea    -0x2d9f3d77(%rdi),%eax
  401aa4:	c3                   	retq   

0000000000401aa5 <getval_472>:
  401aa5:	b8 8d ce 20 d2       	mov    $0xd220ce8d,%eax
  401aaa:	c3                   	retq   

0000000000401aab <setval_350>:
  401aab:	c7 07 48 89 e0 90    	movl   $0x90e08948,(%rdi)
  401ab1:	c3                   	retq   

0000000000401ab2 <end_farm>:
  401ab2:	b8 01 00 00 00       	mov    $0x1,%eax
  401ab7:	c3                   	retq   
  401ab8:	90                   	nop
  401ab9:	90                   	nop
  401aba:	90                   	nop
  401abb:	90                   	nop
  401abc:	90                   	nop
  401abd:	90                   	nop
  401abe:	90                   	nop
  401abf:	90                   	nop

