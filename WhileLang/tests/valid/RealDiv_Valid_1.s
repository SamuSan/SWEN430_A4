
	.text
wl_g:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	leaq label1, %rbx
	movq %rdi, %rax
	cltd
	idivq %rbx
	movq %rax, %rdi
	movq %rdi, 16(%rbp)
	jmp label0
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $16, %rsp
	movq 32(%rbp), %rdi
	movq %rdi, 8(%rsp)
	call wl_g
	movq 0(%rsp), %rdi
	movq %rdi, 16(%rbp)
	jmp label2
label2:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $24, %rsp
	leaq label4, %rdi
	movq %rdi, 16(%rsp)
	leaq label5, %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label6(%rip), %rsi
	call print
label3:
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
label6:
	.quad 4
