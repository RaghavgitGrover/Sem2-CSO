.global solve

solve:
    cmpq $0, %rdi
    je .end
    movq $0, %rdx
    movq %rsi, %rax
    idivq %rdi
    movq %rdi, %rsi
    movq %rdx, %rdi
    call solve

.end:
    movq %rsi, %rax
    ret
