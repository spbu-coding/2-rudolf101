	.file	"selection_sort.c"
	.text
	.globl	selection_sort
	.type	selection_sort, @function
selection_sort:
.LFB0:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movq	%fs:40, %rax
	movq	%rax, -8(%rbp)
	xorl	%eax, %eax
	movl	%esi, %eax
	movq	%rsp, %rcx
	addq	%rax, %rax
	addq	$15, %rax
	shrq	$4, %rax
	salq	$4, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	subq	%rdx, %rcx
	movq	%rcx, %rdx
.L2:
	cmpq	%rdx, %rsp
	je	.L3
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L2
.L3:
	andl	$4095, %eax
	subq	%rax, %rsp
	testq	%rax, %rax
	je	.L4
	orq	$0, -8(%rsp,%rax)
.L4:
	movq	%rsp, %rcx
	xorl	%eax, %eax
.L5:
	cmpl	%eax, %esi
	jbe	.L22
	movw	$0, (%rcx,%rax,2)
	incq	%rax
	jmp	.L5
.L22:
	xorl	%eax, %eax
	leal	-1(%rsi), %r10d
.L7:
	movl	%eax, %edx
	cmpl	%eax, %r10d
	jbe	.L23
	leaq	1(%rax), %r9
	movq	%r9, %r8
.L8:
	cmpl	%r8d, %esi
	jbe	.L24
	movslq	%edx, %r11
	movq	(%rdi,%r11,8), %r11
	cmpq	%r11, (%rdi,%r8,8)
	cmovl	%r8d, %edx
	incq	%r8
	jmp	.L8
.L24:
	cmpl	%eax, %edx
	je	.L11
	movslq	%edx, %rdx
	incw	(%rcx,%rax,2)
	leaq	(%rdi,%rdx,8), %r8
	incw	(%rcx,%rdx,2)
	movq	(%r8), %rdx
	addq	(%rdi,%rax,8), %rdx
	movq	%rdx, (%rdi,%rax,8)
	subq	(%r8), %rdx
	movq	%rdx, (%r8)
	subq	%rdx, (%rdi,%rax,8)
.L11:
	movq	%r9, %rax
	jmp	.L7
.L23:
	xorl	%eax, %eax
	xorl	%r8d, %r8d
.L13:
	cmpl	%eax, %esi
	jbe	.L25
	cmpw	$0, (%rcx,%rax,2)
	jle	.L14
	incl	%r8d
.L14:
	incq	%rax
	jmp	.L13
.L25:
	movq	-8(%rbp), %rax
	xorq	%fs:40, %rax
	je	.L16
	call	__stack_chk_fail@PLT
.L16:
	leave
	.cfi_def_cfa 7, 8
	movl	%r8d, %eax
	ret
	.cfi_endproc
.LFE0:
	.size	selection_sort, .-selection_sort
	.ident	"GCC: (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4: