	.file	"fibonacci.cpp"
	.text
	.globl	_Z9fibonacciiPx
	.def	_Z9fibonacciiPx;	.scl	2;	.type	32;	.endef
	.seh_proc	_Z9fibonacciiPx
_Z9fibonacciiPx:
.LFB0:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$16, %rsp
	.seh_stackalloc	16
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movq	%rdx, 24(%rbp)
	cmpl	$0, 16(%rbp)
	jle	.L7
	movq	24(%rbp), %rax
	movq	$0, (%rax)
	cmpl	$1, 16(%rbp)
	je	.L8
	movq	24(%rbp), %rax
	addq	$8, %rax
	movq	$1, (%rax)
	movl	$2, -4(%rbp)
	jmp	.L5
.L6:
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-8(%rax), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rcx
	movl	-4(%rbp), %eax
	cltq
	salq	$3, %rax
	leaq	-16(%rax), %rdx
	movq	24(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movl	-4(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %r8
	movq	24(%rbp), %rax
	addq	%r8, %rax
	addq	%rcx, %rdx
	movq	%rdx, (%rax)
	addl	$1, -4(%rbp)
.L5:
	movl	-4(%rbp), %eax
	cmpl	16(%rbp), %eax
	jl	.L6
	jmp	.L1
.L7:
	nop
	jmp	.L1
.L8:
	nop
.L1:
	addq	$16, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.ident	"GCC: (MinGW-W64 x86_64-ucrt-posix-seh, built by Brecht Sanders, r3) 14.2.0"
