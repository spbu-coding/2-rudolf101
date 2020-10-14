	.file	"selection_sort.c"
	.text
	.globl	selection_sort
selection_sort:
	movl	$1, %eax
.L2:
	leal	-1(%rax), %r8d
	cmpl	%eax, %edx
	jle	.L8
	movq	%rax, %r9
.L4:
	movslq	%r8d, %r10
	movq	(%rcx,%r10,8), %r11
	cmpq	%r11, (%rcx,%r9,8)
	cmovl	%r9d, %r8d
	incq	%r9
	cmpl	%r9d, %edx
	jg	.L4
	movslq	%r8d, %r8
	movq	-8(%rcx,%rax,8), %r9
	leaq	(%rcx,%r8,8), %r8
	movq	(%r8), %r10
	movq	%r10, -8(%rcx,%rax,8)
	incq	%rax
	movq	%r9, (%r8)
	jmp	.L2
.L8:
	ret
	.ident	"GCC: (x86_64-posix-seh-rev0, Built by MinGW-W64 project) 8.1.0"
