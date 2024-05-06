.global solve

solve:
    cmpq $1, %rdx
    je .madd
    cmpq $2, %rdx
    je .msub
    cmpq $3, %rdx
    je .mdiv
    cmpq $5, %rdx
    je .mmod
    cmpq $4, %rdx
    je .mexp

.madd:
    movq %rdi, %rax
    addq %rsi, %rax
    ret

.msub:
    movq %rdi, %rax
    subq %rsi, %rax
    ret

.mmul:
    movq %rdi, %rax
    imulq %rsi, %rax
    ret

.mdiv:
    movq $0, %rdx
    movq %rdi, %rax
    idivq %rsi
    ret
    
.mmod:
    movq $0, %rdx
    movq %rdi, %rax
    idivq %rsi
    movq %rdx, %rax
    ret

.mexp:
    movq $1, %r8
    movq $0, %r9
    jmp .mexp_loop

.mexp_loop:
    cmpq %r9, %rsi
    je .mexp_end
    movq %r8, %rax
    imulq %rdi, %rax
    movq %rax, %r8
    incq %r9
    jmp .mexp_loop

.mexp_end:
    movq %r8, %rax
    ret
