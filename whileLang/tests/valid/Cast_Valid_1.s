
	.text
wl_f:
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
	subq $16, %rsp
	leaq label2, %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label3(%rip), %rsi
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
label3:
	.quad 4
