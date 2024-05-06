.global solve

solve:
    movq $0, %r8
    movq $0, %r9
    movq $0, %r10

.loop:
    cmpq %rdi, %r10
    jge .temp
    movq (%rsi, %r10, 8), %rax
    cmpq $0, %rax
    je .inc0
    cmpq $1, %rax
    je .inc1
    #movq $0, %r10
    #jmp .fill0

.inc0:
    incq %r8
    incq %r10
    jmp .loop

.inc1:
    incq %r9
    incq %r10
    jmp .loop

.temp:
    movq $0, %r10
    jmp .fill0

.fill0:
    cmpq $0, %r8
    je .fill1
    movq $0, (%rsi, %r10, 8)
    #movq (%rsi, %r10, 8), %r11
    incq %r10
    decq %r8
    jmp .fill0

.fill1:
    cmpq $0, %r9
    je .end
    movq $1, (%rsi, %r10, 8)
    #movq (%rsi, %r10, 8), %r11
    incq %r10
    decq %r9
    jmp .fill1

.end:
    ret
