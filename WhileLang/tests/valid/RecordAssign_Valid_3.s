
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	subq $16, %rsp
	leaq label1, %rdi
	movq %rdi, 8(%rsp)
	leaq label2, %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 8(%rdi), %rax
	movq %rax, -8(%rbp)
	movq 0(%rdi), %rax
	movq %rax, -16(%rbp)
	subq $16, %rsp
	leaq label3, %rdi
	movq %rdi, 8(%rsp)
	leaq label4, %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 8(%rdi), %rax
	movq %rax, -24(%rbp)
	movq 0(%rdi), %rax
	movq %rax, -32(%rbp)
	movq %rbp, %rdi
	addq $-16, %rdi
	leaq label5(%rip), %rsi
	call print
	movq %rbp, %rdi
	addq $-32, %rdi
	leaq label6(%rip), %rsi
	call print
	leaq label7, %rdi
	movq %rbp, %rsi
	addq $-16, %rsi
	movq %rdi, 0(%rsi)
	movq %rbp, %rdi
	addq $-16, %rdi
	leaq label8(%rip), %rsi
	call print
	movq %rbp, %rdi
	addq $-32, %rdi
	leaq label9(%rip), %rsi
	call print
label0:
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
label5:
	.quad 6
	.quad 2
	.quad 2
	.asciz "f1"
	.quad 3
	.quad 2
	.asciz "f2"
	.quad 3
label6:
	.quad 6
	.quad 2
	.quad 2
	.asciz "f1"
	.quad 3
	.quad 2
	.asciz "f2"
	.quad 3
label8:
	.quad 6
	.quad 2
	.quad 2
	.asciz "f1"
	.quad 3
	.quad 2
	.asciz "f2"
	.quad 3
label9:
	.quad 6
	.quad 2
	.quad 2
	.asciz "f1"
	.quad 3
	.quad 2
	.asciz "f2"
	.quad 3
