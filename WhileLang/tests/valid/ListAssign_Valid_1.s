
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 0(%rdi), %rax
	movq %rax, -16(%rbp)
	movq %rbp, %rdi
	addq $-16, %rdi
	movq 0(%rdi), %rax
	movq %rax, -8(%rbp)
	leaq label1, %rdi
	movq %rbp, %rdi
	addq $-16, %rdi
	leaq label2(%rip), %rsi
	call print
	movq %rbp, %rdi
	addq $-8, %rdi
	leaq label3(%rip), %rsi
	call print
label0:
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
	.quad 7
	.quad 3
label3:
	.quad 7
	.quad 3
