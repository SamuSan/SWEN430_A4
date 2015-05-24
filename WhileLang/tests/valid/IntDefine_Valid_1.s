
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	leaq label1, %rdi
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
	leaq label3, %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label4(%rip), %rsi
	call print
	subq $16, %rsp
	leaq label5, %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label6(%rip), %rsi
	call print
	subq $16, %rsp
	leaq label7, %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label8(%rip), %rsi
	call print
label2:
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
label1:
	.asciz ""
label4:
	.quad 5
label6:
	.quad 5
label8:
	.quad 5
