
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $16, %rsp
	movq %rbp, %rdi
	addq $32, %rdi
	movq 8(%rdi), %rdi
	movq %rdi, 8(%rsp)
	movq %rbp, %rdi
	addq $32, %rdi
	movq 0(%rdi), %rdi
	leaq label1, %rbx
	subq %rbx, %rdi
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
	subq $32, %rsp
	subq $16, %rsp
	leaq label3, %rdi
	movq %rdi, 8(%rsp)
	leaq label4, %rdi
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
	leaq label6, %rdi
	movq %rbp, %rsi
	addq $-16, %rsi
	movq %rdi, 0(%rsi)
	subq $32, %rsp
	movq %rbp, %rdi
	addq $-16, %rdi
	movq 8(%rdi), %rax
	movq %rax, 24(%rsp)
	movq 0(%rdi), %rax
	movq %rax, 16(%rsp)
	call wl_f
	movq %rsp, %rdi
	addq $0, %rdi
	movq 8(%rdi), %rax
	movq %rax, -24(%rbp)
	movq 0(%rdi), %rax
	movq %rax, -32(%rbp)
	movq %rbp, %rdi
	addq $-32, %rdi
	leaq label7(%rip), %rsi
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
label5:
	.quad 6
	.quad 2
	.quad 2
	.asciz "f1"
	.quad 3
	.quad 2
	.asciz "f2"
	.quad 3
label7:
	.quad 6
	.quad 2
	.quad 2
	.asciz "f1"
	.quad 3
	.quad 2
	.asciz "f2"
	.quad 3
