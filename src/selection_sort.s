.file    "selection_sort.c"
.text
.globl    selection_sort
.type    selection_sort, @function
selection_sort:
.LFB0:
.cfi_startproc
cmpl    $1, %esi
jle    .L11
pushq    %rbx
.cfi_def_cfa_offset 16
.cfi_offset 3, -16
leaq    8(%rdi), %r11
movl    %esi, %ebx
movl    $1, %r10d
jmp    .L3
.L5:
movslq    %edx, %r8
movq    (%rcx), %r9
cmpq    (%rdi,%r8,8), %r9
cmovb    %eax, %edx
addl    $1, %eax
addq    $8, %rcx
cmpl    %eax, %esi
jne    .L5
.L6:
movslq    %edx, %rdx
leaq    (%rdi,%rdx,8), %rax
movq    (%rax), %rdx
movq    (%rdx), %rdx
movq    -8(%r11), %rcx
movq    %rcx, (%rax)
movq    -8(%r11), %rax
movq    %rdx, (%rax)
addl    $1, %r10d
addq    $8, %r11
cmpl    %ebx, %r10d
je    .L1
.L3:
movl    %r10d, %eax
leal    -1(%r10), %edx
movq    %r11, %rcx
cmpl    %r10d, %esi
jg    .L5
jmp    .L6
.L1:
popq    %rbx
.cfi_def_cfa_offset 8
ret
.L11:
.cfi_restore 3
rep ret
.cfi_endproc
.LFE0:
.size    selection_sort, .-selection_sort
.ident    "GCC: (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0"
.section    .note.GNU-stack,"",@progbits
