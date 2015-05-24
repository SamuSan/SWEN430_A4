
	.text
wl_g:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq 24(%rbp), %rdi
	leaq label1, %rbx
	addq %rbx, %rdi
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
	movq 24(%rbp), %rdi
	movq %rdi, 16(%rbp)
	jmp label2
label2:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	leaq label4, %rdi
	movq %rdi, -8(%rbp)
	subq $16, %rsp
	subq $16, %rsp
	movq -8(%rbp), %rdi
	movq %rdi, 8(%rsp)
	call wl_g
	movq 0(%rsp), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label5(%rip), %rsi
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
label5:
	.quad 3
