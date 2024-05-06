.global solve

solve:
    movq %rdi, %r15
    movq $0, %r14
    movq %rdi, %r8
    movq $10, %r9
    jmp .loop

.loop:
    cmpq $0, %r15
    je .end
    movq %r15, %rax
    movq $0, %rdx
    idivq %r9
    movq %rax, %r15
    movq %rdx, %r10
    imulq %r9, %r14
    addq %r10, %r14
    jmp .loop

.end:
    cmpq %r14, %rdi
    je .true
    movq $0, %rax
    ret

.true:
    movq $1, %rax
    ret
