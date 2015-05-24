
	.text
wl_iof:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq %rdi, 16(%rbp)
	jmp label0
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $24, %rsp
	leaq label2, %rdi
	movq %rdi, 16(%rsp)
	leaq label3, %rdi
	movq %rdi, 8(%rsp)
	call wl_iof
	movq 0(%rsp), %rdi
	leaq label4(%rip), %rsi
	call print
	subq $24, %rsp
	leaq label5, %rdi
	movq %rdi, 16(%rsp)
	leaq label6, %rdi
	movq %rdi, 8(%rsp)
	call wl_iof
	movq 0(%rsp), %rdi
	leaq label7(%rip), %rsi
	call print
	subq $24, %rsp
	leaq label8, %rdi
	movq %rdi, 16(%rsp)
	leaq label9, %rdi
	movq %rdi, 8(%rsp)
	call wl_iof
	movq 0(%rsp), %rdi
	leaq label10(%rip), %rsi
	call print
	subq $24, %rsp
	leaq label11, %rdi
	movq %rdi, 16(%rsp)
	leaq label12, %rdi
	movq %rdi, 8(%rsp)
	call wl_iof
	movq 0(%rsp), %rdi
	leaq label13(%rip), %rsi
	call print
	subq $24, %rsp
	leaq label14, %rdi
	movq %rdi, 16(%rsp)
	leaq label15, %rdi
	movq %rdi, 8(%rsp)
	call wl_iof
	movq 0(%rsp), %rdi
	leaq label16(%rip), %rsi
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
label2:
	.asciz "Hello"
label4:
	.quad 2
label5:
	.asciz "Hello"
label7:
	.quad 2
label8:
	.asciz "Hello"
label10:
	.quad 2
label11:
	.asciz "Hello"
label13:
	.quad 2
label14:
	.asciz "Hello"
label16:
	.quad 2
