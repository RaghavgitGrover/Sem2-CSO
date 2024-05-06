.global solve

solve:
# rsi stores the length(counter) of array
# edge case where length is 1
    cmpq $1, %rsi            
    jle .simpleReturn             

# rdi stores the address of the first element of array
# rax stores the first element of array
    movq (%rdi), %rax        

# loop to rotate the array
.rotateExcludingFirst:
    movq 8(%rdi), %rdx      # storing next element of array is rdx
    movq %rdx, (%rdi)       # replacing current element with next element
    addq $8, %rdi           # updating the address to the next element
    decq %rsi                
    cmpq $1, %rsi            
    je .returnModifyFirst                 
    jmp .rotateExcludingFirst 

# we first place the first element at the end of the array
.returnModifyFirst:
    movq %rax, (%rdi)        
    ret                      

# We return directly if the length of array is 1
.simpleReturn:
    ret                      

