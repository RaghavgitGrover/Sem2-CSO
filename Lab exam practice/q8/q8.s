.global solve

solve:
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
    movq $1, %r9
    movq %rdi, %r10
    decq %r10

.loop2:
    cmpq %r10, %r9
    jg .end
    movq (%rsi, %r8, 8), %r11
    movq (%rsi, %r9, 8), %r12
    movq %r11, (%rsi, %r9, 8)
    movq %r12, (%rsi, %r8, 8)
    addq $2, %r8
    addq $2, %r9
    jmp .loop2

.end:
    ret
