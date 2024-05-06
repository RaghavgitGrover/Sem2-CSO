.global solve

solve:
    movq $2, %r15
    movq $0, %r8
    movq %rdi, %r9
    decq %r9

.loop:
    cmpq %r9, %r8
    jge .done
    movq $0, %r10
    movq %r9, %r11
    subq %r8, %r11

.inner:
    cmpq %r11, %r10
    jge .update
    movq %r10, %r12
    incq %r12
    movq (%rsi, %r10, 8), %r13
    movq (%rsi, %r12, 8), %r14
    cmpq %r13, %r14
    jge .break
    movq %r13, (%rsi, %r12, 8)
    movq %r14, (%rsi, %r10, 8)
    incq %r10
    jmp .inner

.break:
    incq %r10
    jmp .inner

.update:
    incq %r8
    jmp .loop

.done:
    movq $0, %r8
    movq $0, %r9
    movq $0, %r10
    movq %rdi, %r11

.loop2:
    cmpq %r11, %r10
    jge .end
    movq (%rsi, %r10, 8), %rax
    movq $0, %rdx
    idivq %r15
    cmpq $0, %rdx
    je .even
    incq %r8
    incq %r10
    jmp .loop2

.even:
    incq %r9
    incq %r10
    jmp .loop2

.end:
    cmpq $0, %r8
    je .false
    cmpq $0, %r9
    je .false
    movq $1, %rax
    ret

.false:
    movq $0, %rax
    ret
