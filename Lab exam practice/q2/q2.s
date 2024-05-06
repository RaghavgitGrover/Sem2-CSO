.global solve

solve:
    movq $0, %r8

.calc:
    cmpq $0, %rdi
    je .done
    movq %rdi, %r9
    andq $1, %rdi
    cmpq $1, %rdi
    je .odd
    shrq $1, %r9
    movq %r9, %rdi
    jmp .calc

.odd:
    shrq $1, %r9
    movq %r9, %rdi
    incq %r8
    jmp .calc

.done:
    movq %r8, %rax
    andq $1, %rax
    ret
