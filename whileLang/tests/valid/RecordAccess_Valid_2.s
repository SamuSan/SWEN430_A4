
	.text
wl_sum1:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq %rbp, %rdi
	addq $32, %rdi
	movq 0(%rdi), %rdi
	movq %rbp, %rbx
	addq $32, %rbx
	movq 8(%rbx), %rbx
	addq %rbx, %rdi
	movq %rdi, 24(%rbp)
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
	addq $32, %rdi
	movq 0(%rdi), %rdi
	movq %rbp, %rbx
	addq $32, %rbx
	movq 8(%rbx), %rbx
	addq %rbx, %rdi
	movq %rdi, 24(%rbp)
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
	movq label3(%rip), %rdi
	movq %rdi, 8(%rsp)
	movq label4(%rip), %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 8(%rdi), %rax
	movq %rax, -24(%rbp)
	movq 0(%rdi), %rax
	movq %rax, -32(%rbp)
	subq $32, %rsp
	movq %rbp, %rdi
	addq $-32, %rdi
	movq 8(%rdi), %rax
	movq %rax, 24(%rsp)
	movq 0(%rdi), %rax
	movq %rax, 16(%rsp)
	call wl_sum1
	movq 8(%rsp), %rdi
	leaq label5(%rip), %rsi
	call _print
	subq $16, %rsp
	nullq label6(%rip), %rdi
	movq %rdi, 8(%rsp)
	nullq label7(%rip), %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 8(%rdi), %rax
	movq %rax, -8(%rbp)
	movq 0(%rdi), %rax
	movq %rax, -16(%rbp)
	subq $32, %rsp
	movq %rbp, %rdi
	addq $-16, %rdi
	movq 8(%rdi), %rax
	movq %rax, 24(%rsp)
	movq 0(%rdi), %rax
	movq %rax, 16(%rsp)
	call wl_sum2
	movq 8(%rsp), %rdi
	leaq label8(%rip), %rsi
	call _print
label2:
	movq %rbp, %rsp
	popq %rbp
	ret
	.globl _main
_main:
	pushq %rbp
	call wl_main
	popq %rbp
	ret

	.data
label5:
	.quad 3
label8:
	.quad 4
