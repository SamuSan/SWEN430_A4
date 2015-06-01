
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $16, %rsp
	movq label2(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label3(%rip), %rsi
	call _print
	subq $16, %rsp
	movq label4(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label5(%rip), %rsi
	call _print
	subq $16, %rsp
	movq label6(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label7(%rip), %rsi
	call _print
	subq $16, %rsp
	movq label8(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label9(%rip), %rsi
	call _print
	subq $16, %rsp
	movq label10(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label11(%rip), %rsi
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
	.quad 5
label5:
	.quad 5
label7:
	.quad 5
label9:
	.quad 5
label11:
	.quad 5
