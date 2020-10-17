	.file	"selection_sort.c"
	.text
	.globl	selection_sort
	.type	selection_sort, @function
selection_sort:
.LFB0:
	.cfi_startproc
	movl	$1, %eax
.L2:
	cmpl	%eax, %esi
	leal	-1(%rax), %edx
	jle	.L8
	movq	%rax, %rcx
.L4:
	movslq	%edx, %r8
	movq	(%rdi,%r8,8), %r9
	cmpq	%r9, (%rdi,%rcx,8)
	cmovl	%ecx, %edx
	incq	%rcx
	cmpl	%ecx, %esi
	jg	.L4
	movslq	%edx, %rdx
	movq	-8(%rdi,%rax,8), %r8
	leaq	(%rdi,%rdx,8), %rdx
	movq	(%rdx), %rcx
	movq	%r8, (%rdx)
	movq	%rcx, -8(%rdi,%rax,8)
	incq	%rax
	jmp	.L2
.L8:
	ret
	.cfi_endproc
.LFE0:
	.size	selection_sort, .-selection_sort
	.ident	"GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",@progbits
