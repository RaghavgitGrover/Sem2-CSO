.global solve

solve:
    movq $0, %r8
    movq $0, %rax
    jmp .loop

.loop:
    cmpq %rdi, %r8
    jge .sort
    movq (%rsi, %r8, 8), %r9
    cmpq $0, %r9
    je .zero
    cmpq $1, %r9
    je .one

.zero:
    addq %r8, %rax
    movq %rdi, %r10
    decq %r10
    subq %r8, %r10
    subq %r8, %r10
    movq %r10, (%rdx, %r8, 8)
    incq %r8
    jmp .loop

.one:
    movq %rdi, %r10
    decq %r10
    subq %r8, %r10
    addq %r10, %rax
    subq %r8, %r10
    negq %r10
    movq %r10, (%rdx, %r8, 8)
    incq %r8
    jmp .loop

.sort:
    movq $0, %r8
    movq %rdi, %r9
    decq %r9
    jmp .sort_loop

.sort_loop:
    cmpq %r9, %r8
    jge .update
    movq $0, %r10
    movq %r9, %r11
    subq %r8, %r11
    jmp .sort_inner_loop

.sort_inner_loop:
    cmpq %r11, %r10
    jge .movetoupper
    movq (%rdx, %r10, 8), %r12
    movq 8(%rdx, %r10, 8), %r13
    incq %r10
    cmpq %r12, %r13
    jle .sort_inner_loop
    decq %r10
    movq %r13, (%rdx, %r10, 8)
    movq %r12, 8(%rdx, %r10, 8)
    incq %r10
    jmp .sort_inner_loop

.movetoupper:
    incq %r8
    jmp .sort_loop

.update:
    movq $0, %r8
    jmp .update_loop

.update_loop:
    cmpq %rdi, %r8
    jg .end
    movq (%rdx, %r8, 8), %r9
    incq %r8
    cmpq $0, %r9
    movq %rax, (%rcx, %r8, 8)
    jle .update_loop    
    addq %r9, %rax
    movq %rax, (%rcx, %r8, 8)
    jmp .update_loop

.end:
    ret
