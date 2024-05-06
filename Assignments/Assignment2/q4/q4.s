.global solve

solve:
    movq $0, %r8
    movq $0, %rax     # register to store the result obtained till now
    movq $0, %r13     # temporary register for calculations
    movq $0, %r9      # initialize counter to 0
    movq %rsi, %r11   # move the array pointer to r11
    movq $0, %r10     # store the no of push - pop operations

loop:
    cmpq %r9, %rdi     # compare counter to length
    je end             # jump to end 
    cmpb $'C', (%r11)  # compare current value to 'C'
    je invalidate      # jump to invalidate

    cmpb $'D', (%r11)  # Compare current value to 'D'
    je double          # jump to double

    cmpb $'+', (%r11)  # compare current value to '+'
    je add             # jump to add

    movzbq (%r11), %r8  
    subq $'0', %r8      # convert ASCII character to integer
    addq %r8, %rax      # add to accumulator register
    pushq %r8           # push value to stack
    incq %r10           # increment push - pop operations
    incq %r9            # increment counter
    incq %r11           # increment array pointer
    jmp loop

add:
    popq %r13
    popq %r14
    addq %r13, %r14    # add the top two values
    pushq %r14         # push the current score to the stack
    incq %r9           # increment counter
    incq %r11          # increment array pointer
    decq %r10          # decrement push - pop operations
    jmp loop

double:
    popq %r13          # extract top value from stack
    addq %r13, %rax    # add the current score
    salq $1, %r13      # double the top value
    pushq %r13         # push the new value to the stack
    incq %r9           # increment counter
    incq %r11          # increment array pointer
    jmp loop

invalidate:
    popq %r13          # extract top value from stack
    subq %r13, %rax    # subtract the current score
    incq %r9           # increment counter
    incq %r11          # increment array pointer
    decq %r10          # decrement push - pop operations
    jmp loop

remove:
    popq %r13          # extract top value from stack
    decq %r10          # decrement push - pop operations

end:
    cmpq $0, %r10      # ensure that the stack has no extra elements
    jg remove
    ret
