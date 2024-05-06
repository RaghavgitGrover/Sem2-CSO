.global solve

solve:
# rdi contains the address of the first element of array
# initializing max(rax) and min(rdx) with the first element of array
    movq (%rdi), %rax        
    movq (%rdi), %rdx        

.find:  
    cmpq (%rdi), %rax        
    cmovgq (%rdi), %rax     # using conditional move to update the value of max
    cmpq (%rdi), %rdx        
    cmovlq (%rdi), %rdx     # using conditional move to update the value of min
    decq %rsi               # rsi(counter) contains the size of the array
    cmpq $0, %rsi
    je .over
    addq $8, %rdi           # updating the address 
    jmp .find     

.over:
    addq %rdx, %rax          
    ret
