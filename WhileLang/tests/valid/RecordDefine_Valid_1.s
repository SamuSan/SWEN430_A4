
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq %rbp, %rdi
	addq $32, %rdi
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
	subq $16, %rsp
	subq $32, %rsp
	subq $16, %rsp
	leaq label2, %rdi
	movq %rdi, 8(%rsp)
	leaq label3, %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 8(%rdi), %rax
	movq %rax, 24(%rsp)
	movq 0(%rdi), %rax
	movq %rax, 16(%rsp)
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
label1:
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
	.quad 1
	.asciz "x"
	.quad 3
	.quad 1
	.asciz "y"
	.quad 3
