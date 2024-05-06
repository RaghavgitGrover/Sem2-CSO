.global solve

solve:
    movq $0, %r8        # initialize counter
    movq $0, %rax       # initialize prefix sum
    movq %rdi, %r9      # move n to r9
    incq %r9            # increment r9 by 1

prefix: 
    cmpq %r9, %r8       # loop ends when counter >= n + 1
    jge loop            # exit prefix sum calculation
    movq (%rcx, %r8, 8), %rbx  # load current element into rbx
    movq %rax, (%rcx, %r8, 8)  # modifying the array in place
    addq %rbx, %rax     # add loaded element to prefix sum
    incq %r8            # increment counter
    jmp prefix          # next iteration

loop:
    movq %rdi, %r8      # initialize counter
    movq $0, %rbx       # initialize temp result
    movq $-2000000000000, %rax       # initialize final result

# indexing is slighlty different from regular methods because we have modified array st it stores prefixes now
# first element of the modified array is 0 always
outer:
    decq %r8            # decrement counter before entering loop
    cmpq $-1, %r8       # loop ends when counter = -1 and not when counter = 0
    je end              # exit if counter = -1
    movq $0, %rbx       # reset temp variable for each iteration of outer loop
    movq %rdi, %r9      # move n to r9
    subq %r8, %r9       # calculate n - i
    decq %r9            # decrement to obtain n - i - 1
    movq %rsi, %r10     # move l to r10
    movq %rdx, %r11     # move r to r11
    addq %r9, %r10      # obtain l + (n - i - 1)
    addq %r9, %r11      # obtain r + (n - i - 1)
    movq (%rcx, %r9, 8), %rbx   # load element at index l - 1
    
inner:
    cmpq %r11, %r10     # exit inner loop if l > r
    jg outer            
    movq %rdi, %r15     # move n to r15
    incq %r15           # obtain n + 1
    cmpq %r15, %r10     # exit inner loop if current index >= n + 1 and not when >= n
    jge outer          
    movq (%rcx, %r10, 8), %r13  # load current element into r13
    subq %rbx, %r13     # subtract previous sum from current sum to obtain subarray sum
    cmpq %r13, %rax     # update value of max sum if current sum > max sum
    jge no_update       # if current sum <= max sum, dont update 
    movq %r13, %rax     
    
no_update:
    incq %r10           # increment inner loop counter
    jmp inner           # next iteration of inner loop
    
end:
    ret                 # return final answer
