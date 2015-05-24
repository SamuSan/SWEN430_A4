
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
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
	subq $0, %rsp
	subq $16, %rsp
	subq $8, %rsp
	leaq label2, %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 0(%rdi), %rax
	movq %rax, 8(%rsp)
	call wl_f
	movq %rsp, %rdi
	addq $0, %rdi
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
	.quad 6
	.quad 1
	.quad 1
	.asciz "x"
	.quad 4
