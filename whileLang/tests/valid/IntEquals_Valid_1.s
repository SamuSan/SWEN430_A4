
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
	subq $32, %rsp
	movq %rdi, 24(%rsp)
	nullq label2(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_f
	movq 8(%rsp), %rdi
	leaq label3(%rip), %rsi
	call _print
	subq $32, %rsp
	movq %rdi, 24(%rsp)
	nullq label4(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_f
	movq 8(%rsp), %rdi
	leaq label5(%rip), %rsi
	call _print
	subq $32, %rsp
	nullq label6(%rip), %rdi
	movq %rdi, 24(%rsp)
	nullq label7(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_f
	movq 8(%rsp), %rdi
	leaq label8(%rip), %rsi
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
label8:
	.quad 5
