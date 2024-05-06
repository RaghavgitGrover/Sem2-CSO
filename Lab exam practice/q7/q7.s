.global solve

solve:
    movq $0, %rax
    movq %rsi, %r8
    movq $0, %r9

.loop:
    cmpq %r8, %r9
    jg .end
    movq $0, %r10
    movq $0, %r11

.add1:
    cmpq %r9, %r11
    jge .break1
    movq (%rdx, %r11, 8), %r15
    addq %r15, %r10
    incq %r11
    jmp .add1

.break1:
    movq $0, %r11
    movq %rsi, %r12
    subq %r9, %r12  

.add2:
    cmpq %r12, %r11
    jge .break2
    movq %rdi, %r13
    decq %r13
    subq %r11, %r13
    movq (%rdx, %r13, 8), %r15
    addq %r15, %r10
    incq %r11
    jmp .add2

.break2:
    cmpq %rax, %r10
    jg .update
    incq %r9
    jmp .loop

.update:
    movq %r10, %rax
    incq %r9
    jmp .loop

.end:
    ret
    