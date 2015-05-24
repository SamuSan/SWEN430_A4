
	.text
wl_diver:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq 40(%rbp), %rdi
	movq 32(%rbp), %rbx
	movq 24(%rbp), %rbx
	movq %rbx, %rax
	cltd
	idivq %rbx
	movq %rax, %rbx
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
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $32, %rsp
	leaq label2, %rdi
	movq %rdi, 24(%rsp)
	leaq label3, %rdi
	movq %rdi, 16(%rsp)
	leaq label4, %rdi
	movq %rdi, 8(%rsp)
	call wl_diver
	movq 0(%rsp), %rdi
	leaq label5(%rip), %rsi
	call print
	subq $32, %rsp
	leaq label6, %rdi
	movq %rdi, 24(%rsp)
	leaq label7, %rdi
	movq %rdi, 16(%rsp)
	leaq label8, %rdi
	movq %rdi, 8(%rsp)
	call wl_diver
	movq 0(%rsp), %rdi
	leaq label9(%rip), %rsi
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
label5:
	.quad 4
label9:
	.quad 4
