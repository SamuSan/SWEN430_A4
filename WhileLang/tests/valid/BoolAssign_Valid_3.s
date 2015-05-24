
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	movq 32(%rbp), %rdi
	movq 24(%rbp), %rbx
	cmpq %rbx, %rdi
	jz label1
	movq $0, %rdi
	jmp label2
label1:
	movq $1, %rdi
label2:
	movq %rdi, -8(%rbp)
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_g:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	movq 32(%rbp), %rdi
	movq 24(%rbp), %rbx
	cmpq %rbx, %rdi
	jge label4
	movq $0, %rdi
	jmp label5
label4:
	movq $1, %rdi
label5:
	movq %rdi, -8(%rbp)
label3:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $24, %rsp
	leaq label7, %rdi
	movq %rdi, 16(%rsp)
	leaq label8, %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label9(%rip), %rsi
	call print
	subq $24, %rsp
	leaq label10, %rdi
	movq %rdi, 16(%rsp)
	leaq label11, %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label12(%rip), %rsi
	call print
	subq $24, %rsp
	leaq label13, %rdi
	movq %rdi, 16(%rsp)
	leaq label14, %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label15(%rip), %rsi
	call print
	subq $24, %rsp
	leaq label16, %rdi
	movq %rdi, 16(%rsp)
	leaq label17, %rdi
	movq %rdi, 8(%rsp)
	call wl_g
	movq 0(%rsp), %rdi
	leaq label18(%rip), %rsi
	call print
	subq $24, %rsp
	leaq label19, %rdi
	movq %rdi, 16(%rsp)
	leaq label20, %rdi
	movq %rdi, 8(%rsp)
	call wl_g
	movq 0(%rsp), %rdi
	leaq label21(%rip), %rsi
	call print
label6:
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
label9:
	.quad 3
label12:
	.quad 3
label15:
	.quad 3
label18:
	.quad 3
label21:
	.quad 3
