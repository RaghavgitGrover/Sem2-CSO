.global solve

# rdi is the address of the original array
# rsi is the address of the result array
# rdx is the size of the array
# values of rdi, rsi and rdx are stored in r8, r9 and r10. The values of rdi, rsi and rdx are not changed anywhere, all changes are made in r8, r9 and r10

solve:
    movq %rdi, %r8       
    movq %rsi, %r9       
    movq $1, (%r9)      # First element array is set to 1
    addq $8, %r9        # Changing the address to point to the next element
    movq %rdx, %r10     
    decq %r10           # Making the last index n - 1
    movq $1, %rax       # rax hold the product of elements before the element at current index
    movq $0, %r11       # Setting the counter to 0

.loop1:
    cmpq %r10, %r11     # Checking if the counter has reached the last index
    jge .init           # Move to the 2nd loop
    imulq (%r8,%r11,8), %rax    # Update the product
    movq %rax, (%r9,%r11,8)     # Update the result array
    incq %r11           # Incrementing the counter
    jmp .loop1          

# Re-initialize the variables
.init:
    movq %rdi, %r8      
    movq %rsi, %r9      
    movq %rdx, %r10     
    decq %r10           
    movq $1, %rax       # rax holds the product of elements after the last index


.loop2:
    cmpq $0, %r10       # Not using a separate counter, loop runs till last index becomes 0        
    jl .ret                   
    movq (%r9,%r10,8), %r12     # Placing the value of last index element in a temporary register
    imulq %rax, %r12            # UPdating the value of last index element
    movq %r12, (%r9,%r10,8)     # Placing the last element back in its position
    imulq (%r8,%r10,8), %rax    # Updating the current product
    decq %r10                   # Updating last index
    jmp .loop2

.ret:
    ret                
