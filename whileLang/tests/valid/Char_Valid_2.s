
	.text
wl_iof:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq %rdi, 24(%rbp)
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
	leaq label2(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label3(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_iof
	movq 8(%rsp), %rdi
	leaq label4(%rip), %rsi
	call _print
	subq $32, %rsp
	leaq label5(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label6(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_iof
	movq 8(%rsp), %rdi
	leaq label7(%rip), %rsi
	call _print
	subq $32, %rsp
	leaq label8(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label9(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_iof
	movq 8(%rsp), %rdi
	leaq label10(%rip), %rsi
	call _print
	subq $32, %rsp
	leaq label11(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label12(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_iof
	movq 8(%rsp), %rdi
	leaq label13(%rip), %rsi
	call _print
	subq $32, %rsp
	leaq label14(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label15(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_iof
	movq 8(%rsp), %rdi
	leaq label16(%rip), %rsi
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
label2:
	.asciz "Hello"
label4:
	.quad 2
label5:
	.asciz "Hello"
label7:
	.quad 2
label8:
	.asciz "Hello"
label10:
	.quad 2
label11:
	.asciz "Hello"
label13:
	.quad 2
label14:
	.asciz "Hello"
label16:
	.quad 2
