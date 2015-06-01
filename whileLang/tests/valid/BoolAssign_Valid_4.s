
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	nullq label1(%rip), %rdi
	movq %rdi, -8(%rbp)
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $32, %rsp
	movq label3(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label4(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_f
	movq 8(%rsp), %rdi
	leaq label5(%rip), %rsi
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
label1:
	.asciz "true"
label5:
	.quad 3
