
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq %rbp, %rdi
	addq $24, %rdi
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
	movq 0(%rdi), %rax
	movq %rax, 8(%rsp)
	call wl_f
	movq %rsp, %rdi
	addq $0, %rdi
	leaq label2(%rip), %rsi
	call print
	subq $16, %rsp
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
label2:
	.quad 7
	.quad 3
label3:
	.quad 7
	.quad 3
