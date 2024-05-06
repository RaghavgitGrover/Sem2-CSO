.global solve

# initialized rax(result) to 0
solve:
    movq $0, %rax            

# loop to xor all the array elements and then jump to return
.xoring:
    # rdi contains the address of the first element of array
    xorq (%rdi), %rax        
    addq $8, %rdi   # updating the address     
    # rsi contains the length of array which serves as counter
    decq %rsi   
    cmpq $0, %rsi             
    jz .return      # breaks the loop if counter becomes 0          
    jmp .xoring             

.return:
    ret

