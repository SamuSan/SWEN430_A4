
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	leaq label1, %rdi
	movq %rbp, %rsi
	addq $24, %rsi
	movq 0(%rsi), %rsi
	movq %rdi, 0(%rsi)
	movq %rbp, %rdi
	addq $24, %rdi
	movq 0(%rdi), %rax
	movq %rax, 16(%rbp)
	jmp label0
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	subq $8, %rsp
	subq $8, %rsp
	leaq label3, %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 0(%rdi), %rax
	movq %rax, 0(%rsp)
	movq %rsp, %rdi
	movq 0(%rdi), %rax
	movq %rax, -8(%rbp)
	leaq label4, %rdi
	movq %rbp, %rbx
	addq $-8, %rbx
	movq %rdi, %rdi
	movq %rbx, %rsi
	leaq label5(%rip), %rdx
	call _str_left_append
	movq %rax, %rdi
	leaq label6(%rip), %rsi
	call print
	leaq label7, %rdi
	subq $16, %rsp
	movq %rbp, %rbx
	addq $-8, %rbx
	movq 0(%rbx), %rax
	movq %rax, 8(%rsp)
	call wl_f
	movq %rsp, %rbx
	addq $0, %rbx
	movq %rdi, %rdi
	movq %rbx, %rsi
	leaq label8(%rip), %rdx
	call _str_left_append
	movq %rax, %rdi
	leaq label9(%rip), %rsi
	call print
label2:
	movq %rbp, %rsp
	popq %rbp
	ret
	.globl main
main:
	pushq %rbp
	call wl_main
	popq %rbp
	ret

	.data
label4:
	.asciz "BEFORE: "
label5:
	.quad 6
	.quad 1
	.quad 7
	.asciz "current"
	.quad 6
	.quad 1
	.quad 1
	.asciz "x"
	.quad 3
label6:
	.quad 5
label7:
	.asciz "AFTER: "
label8:
	.quad 6
	.quad 1
	.quad 7
	.asciz "current"
	.quad 6
	.quad 1
	.quad 1
	.asciz "x"
	.quad 3
label9:
	.quad 5
