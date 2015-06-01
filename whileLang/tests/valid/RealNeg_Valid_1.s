
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq 24(%rbp), %rdi
	negq %rdi
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
	nullq label2(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label3(%rip), %rsi
	call _print
	subq $16, %rsp
	nullq label4(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label5(%rip), %rsi
	call _print
	subq $16, %rsp
	nullq label6(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label7(%rip), %rsi
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
label3:
	.quad 4
label5:
	.quad 4
label7:
	.quad 4
