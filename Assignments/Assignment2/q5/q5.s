.global solve

solve:
    movq $0, %r8     # left = 0
    movq $31, %r9    # right = 31
    movq $0, %r10    # mid
    movq $0, %r14    # iterations = 0
    movq $-1, (%rdx)                # store -1 if not found at ans1 pointer

binary_search_loop:
    cmpq %r8, %r9    # while left <= right
    jl not_found
    incq %r14        # increment iterations count
    movq %r8, %r10                  # mid = left
    addq %r9, %r10                  # mid += right
    sarq $1, %r10                   # mid = (left + right) / 2   
    movq (%rdi, %r10, 8), %rax      # load arr[mid] into %rax
    cmpq %rsi, %rax                 # if arr[mid] == x
    je update
    jl update_left                  # if arr[mid] < x
    movq %r10, %r9                  
    decq %r9                        # right = mid - 1
    jmp binary_search_loop

update_left:
    movq %r10, %r8                  
    incq %r8                        # left = mid + 1
    jmp binary_search_loop

not_found:
    movq %r14, (%rcx)
    ret

update:
    movq %r10, (%rdx)  # store index of first occurrence at ans1 pointer
    movq %r14, (%rcx)  # store iterations count at ans2 pointer
    movq %r10, %r9                  
    decq %r9                        # right = mid - 1
    jmp binary_search_loop
