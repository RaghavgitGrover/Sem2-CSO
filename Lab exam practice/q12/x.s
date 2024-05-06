.global solve

solve:
    cmpq $0, %rdi
    je .basesolve
    movq $0, %r8
    movq $10, %r9
    movq $1, %r11
    movq %rdi, %r14

.basesolve:
    movq $0, %rax
    ret

.loop:
    cmpq $0, %rdi
    je .done
    movq $0, %rdx
    movq %rdi, %rax
    idivq %r9
    movq %rax, %r10
    movq %rdx, %rdi
    movq $1, %r11
    call .factorial
    addq %rax, %r8
    movq %r10, %rdi
    jmp .loop

.factorial:
    cmpq $0, %rdi
    je .calc
    imulq %rdi, %r11
    decq %rdi
    jmp .factorial

.calc:
    movq %r11, %rax
    ret

.done:
    cmpq %r8, %r14
    je .true
    movq $0, %rax
    ret

.true:
    movq $1, %rax
    ret
    
    

