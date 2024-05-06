# this wont work for all cases
# is there any other way apart from n^2
.global solve

solve:
    movq $0, %r8
    movq %rdi, %r9
    decq %r9
    movq $0, %r11

.loop:
    cmpq %r8, %r9
    jl .end
    movq (%rdx, %r8, 8), %r12
    incq %r8
    cmpq $1, %r12
    jl .loop
    cmpq %rdi, %r12
    jg .loop
    addq %r12, %r11
    jmp .loop

.end:
    subq %r11, %rsi
    movq %rsi, %rax 
    cmpq $0, %rax
    je .outside
    ret

.outside:
    movq %rdi, %rax
    incq %rax
    ret
