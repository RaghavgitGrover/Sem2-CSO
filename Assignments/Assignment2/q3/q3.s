.global evaluatePostfix

evaluatePostfix:
    movq $0, %rax    # register to store result
    movq $0, %rbx    # temporary register for calculations
    movq $0, %r10    # initialize counter to 0 
    movq %rsi, %r11   # array pointer

loop:
    cmpq %rdi, %r10    # compare counter to n
    je end             # jump to end block if counter equals n

    cmpb $'+', (%r11)   # compare input to '+'
    je plus            # jump to plus block 

    cmpb $'-', (%r11)   # compare input to '-'
    je minus           # jump to minus block

    cmpb $'*', (%r11)   # compare input to '*'
    je product         # jump to product block

    cmpb $'/', (%r11)   # compare input to '/'
    je divide          # jump to divide block

    # if input is a number
    movzbq (%r11), %r12  # load value from array pointer
    subq $'0', %r12      # convert ASCII character to integer
    pushq %r12           # push the integer to stack
    incq %r10            # increment counter
    incq %r11            # increment array pointer
    jmp loop

plus:
    popq %rbx          # extract 1st value from stack
    popq %rax          # extract 2nd value from stack
    addq %rax, %rbx    # perform operation
    pushq %rbx         # push the result onto stack
    incq %r10          # increment counter
    incq %r11          # increment array pointer
    jmp loop            

minus:
    popq %rax          # extract 1st value from stack
    popq %rbx          # extract 2nd value from stack
    subq %rax, %rbx    # perform operation
    pushq %rbx         # push the result onto stack
    incq %r10           # increment counter
    incq %r11           # increment array pointer
    jmp loop

product:
    popq %rbx           # extract 1st value from stack
    popq %rax           # extract 2nd value from stack
    imulq %rax, %rbx    # perform operation
    pushq %rbx          # push the result onto stack
    incq %r10           # increment counter
    incq %r11           # increment array pointer
    jmp loop

divide:
    popq %rbx           # extract divisor from stack
    popq %rax           # extract dividend from stack
    movq $0, %rdx       # clear rdx 
    idivq %rbx          # perform operation
    pushq %rax          # push the quotient onto the stack
    incq %r10           # increment the counter
    incq %r11           # increment the array pointer
    jmp loop

end:
    popq %rax          # result is the last element remaining in the stack
    ret
