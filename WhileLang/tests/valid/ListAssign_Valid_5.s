
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
	subq $16, %rsp
	subq $8, %rsp
	call wl_f
	movq %rsp, %rdi
	addq $0, %rdi
	movq 0(%rdi), %rax
	movq %rax, -8(%rbp)
	subq $8, %rsp
	call wl_f
	movq %rsp, %rdi
	addq $0, %rdi
	movq 0(%rdi), %rax
	movq %rax, -16(%rbp)
	leaq label2, %rdi
	leaq label3(%rip), %rsi
	call print
	leaq label4(%rip), %rsi
	call print
	leaq label5(%rip), %rsi
	call print
	leaq label6(%rip), %rsi
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
	.quad 3
label4:
	.quad 3
label5:
	.quad 3
label6:
	.quad 3
