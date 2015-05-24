
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $16, %rsp
	leaq label1, %rdi
	movq %rdi, 8(%rsp)
	movq 32(%rbp), %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 8(%rdi), %rax
	movq %rax, 24(%rbp)
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
	subq $24, %rsp
	leaq label3, %rdi
	movq %rdi, -24(%rbp)
	subq $24, %rsp
	movq -24(%rbp), %rdi
	movq %rdi, 16(%rsp)
	call wl_f
	movq %rsp, %rdi
	addq $0, %rdi
	movq 8(%rdi), %rax
	movq %rax, -8(%rbp)
	movq 0(%rdi), %rax
	movq %rax, -16(%rbp)
	movq %rbp, %rdi
	addq $-16, %rdi
	leaq label4(%rip), %rsi
	call print
	subq $16, %rsp
	movq -24(%rbp), %rdi
	movq %rdi, 8(%rsp)
	movq -24(%rbp), %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 8(%rdi), %rax
	movq %rax, -8(%rbp)
	movq 0(%rdi), %rax
	movq %rax, -16(%rbp)
	movq %rbp, %rdi
	addq $-16, %rdi
	leaq label5(%rip), %rsi
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
	.quad 6
	.quad 2
	.quad 2
	.asciz "b1"
	.quad 3
	.quad 2
	.asciz "b2"
	.quad 3
label5:
	.quad 6
	.quad 2
	.quad 2
	.asciz "b1"
	.quad 3
	.quad 2
	.asciz "b2"
	.quad 3
