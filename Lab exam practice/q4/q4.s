# Dont use this method
# Find the reverse number while iterating
.global solve

solve:
    movq $0, %rax
    movq $0, %r9
    movq %rsi, %r10
    decq %r10

.loop:
    cmpq %r9, %r10
    jle .tru
    movq (%rdx, %r9, 8), %r11
    movq (%rdx, %r10, 8), %r12
    incq %r9
    decq %r10
    cmpq %r11, %r12
    jne .fal
    jmp .loop

.tru:
    movq $1, %rax
    ret

.fal:
    ret
    
