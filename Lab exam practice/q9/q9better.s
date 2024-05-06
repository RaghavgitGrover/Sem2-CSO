.global solve

solve:
    movq $0, %r8
    jmp .loop

.loop:
    cmpq %rdi, %r8
    je .search
    movq (%rsi, %r8, 8), %r9
    decq %r9
    cmpq $0, %r9
    jl .outside
    cmpq %rdi, %r9
    jg .outside
    movq $1, (%rdx, %r9, 8)
    movq (%rdx, %r9, 8), %r15
    incq %r8
    jmp .loop

.outside:
    incq %r8
    jmp .loop

.search:
    movq $0, %r8
    jmp .loop2

.loop2:
    cmpq %rdi, %r8
    jg .end
    movq (%rdx, %r8, 8), %r9
    cmpq $1, %r9
    jne .found
    incq %r8
    jmp .loop2

.found:
    incq %r8
    movq %r8, %rax
    ret    

.end:
    movq $-1, %rax
    ret
