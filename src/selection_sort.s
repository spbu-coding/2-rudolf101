.file    "selection_sort.c"
.text
.p2align 4,,15
.globl    selection_sort
.type    selection_sort, @function
selection_sort:
.LFB0:
.cfi_startproc
cmpl    $1, %esi
jle    .L10
pushq    %r12
.cfi_def_cfa_offset 16
.cfi_offset 12, -16
leal    -2(%rsi), %r12d
pushq    %rbpß
.cfi_def_cfa_offset 24
.cfi_offset 6, -24
pushq    %rbx
.cfi_def_cfa_offset 32
.cfi_offset 3, -32
leaq    8(%rdi), %rbx
xorl    %r11d, %r11d
addq    $1, %r12
.p2align 4,,10
.p2align 3
.L5:
movq    -8(%rbx), %rbp
leal    1(%r11), %edx
movl    %r11d, %r10d
movq    %rbx, %rax
movq    %rbp, %r8
jmp    .L4
.p2align 4,,10
.p2align 3
.L15:
addl    $1, %edx
movslq    %r10d, %rcx
addq    $8, %rax
cmpl    %edx, %esi
leaq    (%rdi,%rcx,8), %r9
jle    .L14
.L4:
movq    (%rax), %rcx
movq    %rax, %r9
cmpq    %rcx, %r8
jle    .L15
movl    %edx, %r10d
addl    $1, %edx
addq    $8, %rax
cmpl    %edx, %esi
movq    %rcx, %r8
jg    .L4
.L14:
addq    $1, %r11
movq    %rbp, (%r9)
addq    $8, %rbx
movq    %r8, -16(%rbx)
cmpq    %r11, %r12
jne    .L5
popq    %rbx
.cfi_def_cfa_offset 24
popq    %rbp
.cfi_def_cfa_offset 16
popq    %r12
.cfi_def_cfa_offset 8
ret
.L10:
.cfi_restore 3
.cfi_restore 6
.cfi_restore 12
rep ret
.cfi_endproc
.LFE0:
.size    selection_sort, .-selection_sort
.ident    "GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
.section    .note.GNU-stack,"",@progbits
