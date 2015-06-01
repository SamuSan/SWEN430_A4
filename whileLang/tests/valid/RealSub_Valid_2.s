
	.text
wl_suber:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq 40(%rbp), %rdi
	movq 32(%rbp), %rbx
	movq 24(%rbp), %rbx
	subq %rbx, %rbx
	subq %rbx, %rdi
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
	subq $32, %rsp
	nullq label2(%rip), %rdi
	movq %rdi, 24(%rsp)
	nullq label3(%rip), %rdi
	movq %rdi, 16(%rsp)
	nullq label4(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_suber
	movq 0(%rsp), %rdi
	leaq label5(%rip), %rsi
	call _print
	subq $32, %rsp
	nullq label6(%rip), %rdi
	movq %rdi, 24(%rsp)
	nullq label7(%rip), %rdi
	movq %rdi, 16(%rsp)
	nullq label8(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_suber
	movq 0(%rsp), %rdi
	leaq label9(%rip), %rsi
	call _print
label1:
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
	.quad 4
label9:
	.quad 4
