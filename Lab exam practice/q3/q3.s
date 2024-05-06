.global solve

solve:
    movq $1, %r8
    movq $0, %r9

loop:
    cmpq %rdi, %r8
    jg .end
    movq $0, %rdx
    movq $3, %r10
    movq %r8, %rax
    idivq %r10
    cmpq $0, %rdx
    je .div3
    movq $0, %rdx
    movq $5, %r10
    movq %r8, %rax
    idivq %r10
    cmpq $0, %rdx
    je .div5
    movq %r8, (%rsi, %r9, 8)
    incq %r9
    incq %r8
    jmp loop

.div3:
    movq $0, %rdx
    movq $5, %r10
    movq %r8, %rax
    idivq %r10
    cmpq $0, %rdx
    je .div35
    movq $-1, (%rsi, %r9, 8)
    incq %r9
    incq %r8
    jmp loop

.div5:
    movq $-2, (%rsi, %r9, 8)
    incq %r9
    incq %r8
    jmp loop

.div35:
    movq $-3, (%rsi, %r9, 8)
    incq %r9
    incq %r8
    jmp loop

.end:
    movq $0, %rax
    ret
