.global solve
.global factorial

solve:
    cmp     $1, %rsi        # case1: r = 1   
    je      .base_case1
    cmp     $0, %rsi        # case2: r = 0
    je      .base_case2
    cmp     %rdi, %rsi      # case3: r = n
    je      .base_case3
    jg      .base_case4     # case4: r > n
    push    %rdi            # push n
    push    %rsi            # push r
    decq    %rdi            # decrement n to n-1
    decq    %rsi            # decrement r to r-1
    call    solve           # call solve(n-1, r-1)
    pop     %rsi            # pop r
    pop     %rdi            # pop n
    imulq   %rdi, %rax       # multiply n with the result
    movq    $0, %rdx        # to prevent the floating point exception, while dividing
    idivq   %rsi            # divide the result by r               
    ret


.base_case_factorial:
    movq    $1, %rax                
    ret

.base_case1:
    movq    %rdi, %rax
    ret

.base_case2:
    movq    $1, %rax
    ret

.base_case3:
    movq    $1, %rax
    ret

.base_case4:
    movq    $-1, %rax
    ret
