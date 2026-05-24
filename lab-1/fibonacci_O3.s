	.file	"fibonacci.cpp"
	.text
	.p2align 4
	.globl	_Z9fibonacciiPx
	.def	_Z9fibonacciiPx;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9fibonacciiPx
_Z9fibonacciiPx:
.LFB0:
	.seh_endprologue
	movl	%ecx, %r10d
	testl	%ecx, %ecx
	jle	.L1
	movq	$0, (%rdx)
	cmpl	$1, %ecx
	je	.L1
	movq	$1, 8(%rdx)
	cmpl	$2, %ecx
	je	.L1
	cmpl	$4, %ecx
	jle	.L6
	leal	-5(%rcx), %eax
	movl	$1, %r8d
	xorl	%ecx, %ecx
	shrl	%eax
	leal	3(%rax), %r11d
	movl	$4, %eax
	addq	%r11, %r11
	.p2align 5
	.p2align 4
	.p2align 3
.L4:
	addq	%r8, %rcx
	movq	%rax, %r9
	addq	%rcx, %r8
	movq	%rcx, -16(%rdx,%rax,8)
	movq	%r8, -8(%rdx,%rax,8)
	addq	$2, %rax
	cmpq	%r11, %rax
	jne	.L4
.L3:
	movslq	%r9d, %rax
	addl	$1, %r9d
	salq	$3, %rax
	leaq	-8(%rdx,%rax), %rcx
	movdqu	-8(%rcx), %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$8, %xmm1
	paddq	%xmm1, %xmm0
	movq	%xmm0, (%rdx,%rax)
	cmpl	%r9d, %r10d
	jle	.L1
	movdqu	(%rcx), %xmm0
	movdqa	%xmm0, %xmm1
	psrldq	$8, %xmm1
	paddq	%xmm1, %xmm0
	movq	%xmm0, 8(%rdx,%rax)
.L1:
	ret
.L6:
	movl	$2, %r9d
	jmp	.L3
	.seh_endproc
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r3) 14.2.0"
