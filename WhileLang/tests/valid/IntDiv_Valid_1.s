
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq 32(%rbp), %rdi
	movq 24(%rbp), %rbx
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
	subq $8, %rsp
	subq $24, %rsp
	leaq label2, %rdi
	movq %rdi, 16(%rsp)
	leaq label3, %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %rdi
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
	.quad 3
