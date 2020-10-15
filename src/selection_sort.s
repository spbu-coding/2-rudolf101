	.file	"selection_sort.c"
	.text
	.p2align 4
	.globl	selection_sort
	.type	selection_sort, @function
selection_sort:
.LFB0:
	.cfi_startproc
	endbr64
	cmpl	$1, %esi
	jle	.L11
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	8(%rdi), %r11
	leal	-2(%rsi), %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rdi, %rbx
	xorl	%edi, %edi
	.p2align 4,,10
	.p2align 3
.L5:
	movq	-8(%r11), %rbp
	leal	1(%rdi), %edx
	movl	%edi, %r10d
	movq	%r11, %rax
	movq	%rbp, %r8
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L16:
	movslq	%r10d, %rcx
	addl	$1, %edx
	addq	$8, %rax
	leaq	(%rbx,%rcx,8), %r9
	cmpl	%edx, %esi
	jle	.L15
.L4:
	movq	(%rax), %rcx
	movq	%rax, %r9
	cmpq	%rcx, %r8
	jle	.L16
	movl	%edx, %r10d
	addl	$1, %edx
	movq	%rcx, %r8
	addq	$8, %rax
	cmpl	%edx, %esi
	jg	.L4
.L15:
	movq	%r8, -8(%r11)
	leaq	1(%rdi), %rax
	addq	$8, %r11
	movq	%rbp, (%r9)
	cmpq	%r12, %rdi
	je	.L17
	movq	%rax, %rdi
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L17:
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
.L11:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
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
