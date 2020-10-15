	.file	"selection_sort.c"
	.text
	.globl	selection_sort
	.type	selection_sort, @function
selection_sort:
.LFB0:
	.cfi_startproc
	endbr64
	movl	$1, %eax
.L2:
	leal	-1(%rax), %edx
	cmpl	%eax, %esi
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
	movq	-8(%rdi,%rax,8), %rcx
	leaq	(%rdi,%rdx,8), %rdx
	movq	(%rdx), %r8
	movq	%r8, -8(%rdi,%rax,8)
	incq	%rax
	movq	%rcx, (%rdx)
	jmp	.L2
.L8:
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
