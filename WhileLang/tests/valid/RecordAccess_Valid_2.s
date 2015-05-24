
	.text
wl_sum1:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq %rbp, %rdi
	addq $24, %rdi
	movq 0(%rdi), %rdi
	movq %rbp, %rbx
	addq $24, %rbx
	movq 8(%rbx), %rbx
	addq %rbx, %rdi
	movq %rdi, 16(%rbp)
	jmp label0
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_sum2:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq %rbp, %rdi
	addq $24, %rdi
	movq 0(%rdi), %rdi
	movq %rbp, %rbx
	addq $24, %rbx
	movq 8(%rbx), %rbx
	addq %rbx, %rdi
	movq %rdi, 16(%rbp)
	jmp label1
label1:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $32, %rsp
	subq $16, %rsp
	leaq label3, %rdi
	movq %rdi, 8(%rsp)
	leaq label4, %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 8(%rdi), %rax
	movq %rax, -8(%rbp)
	movq 0(%rdi), %rax
	movq %rax, -16(%rbp)
	subq $24, %rsp
	movq %rbp, %rdi
	addq $-16, %rdi
	movq 8(%rdi), %rax
	movq %rax, 16(%rsp)
	movq 0(%rdi), %rax
	movq %rax, 8(%rsp)
	call wl_sum1
	movq 0(%rsp), %rdi
	leaq label5(%rip), %rsi
	call print
	subq $16, %rsp
	leaq label6, %rdi
	movq %rdi, 8(%rsp)
	leaq label7, %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 8(%rdi), %rax
	movq %rax, -24(%rbp)
	movq 0(%rdi), %rax
	movq %rax, -32(%rbp)
	subq $24, %rsp
	movq %rbp, %rdi
	addq $-32, %rdi
	movq 8(%rdi), %rax
	movq %rax, 16(%rsp)
	movq 0(%rdi), %rax
	movq %rax, 8(%rsp)
	call wl_sum2
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
label5:
	.quad 3
label8:
	.quad 4
