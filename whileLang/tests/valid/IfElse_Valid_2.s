
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq label1(%rip), %rdi
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
	movq label3(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label4(%rip), %rsi
	call _print
	subq $16, %rsp
	movq label5(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label6(%rip), %rsi
	call _print
	subq $16, %rsp
	movq label7(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label8(%rip), %rsi
	call _print
	subq $16, %rsp
	movq label9(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label10(%rip), %rsi
	call _print
	subq $16, %rsp
	movq label11(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label12(%rip), %rsi
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
label4:
	.quad 3
label6:
	.quad 3
label8:
	.quad 3
label10:
	.quad 3
label12:
	.quad 3
