.global solve

solve:
# rsi originally stores the length of storing
# decrementing rsi to get last index
    decq %rsi               
    movq $0, %rcx       # rcx stores the starting index  

.compare:          
# rdi contains the address of the first element of the array
# using al, dl since characters are 1 byte long
    movb (%rdi, %rsi), %al   
    movb (%rdi, %rcx), %dl   
    cmpb %al, %dl            
    jne .notEqual       # break the loop if not equal    
    decq %rsi           # decrement end index   
    incq %rcx           # increment start index
    cmpq %rcx, %rsi
    jle .equal          # break the loop if start index is >= end index
    jmp .compare                

.notEqual:
    movq $0, %rax            
    ret                      

.equal:
    movq $1, %rax            
    ret                      
