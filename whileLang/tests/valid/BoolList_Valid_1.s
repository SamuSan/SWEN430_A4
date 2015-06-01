
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 0(%rdi), %rax
	movq %rax, -8(%rbp)
	movq %rbp, %rdi
	addq $-8, %rdi
	leaq label1(%rip), %rsi
	call _print
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %rdi
	leaq label2(%rip), %rsi
	call _print
	nullq label3(%rip), %rdi
	movq %rbp, %rdi
	addq $-8, %rdi
	leaq label4(%rip), %rsi
	call _print
label0:
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
	.quad 7
	.quad 1
label2:
	.quad 1
label3:
	.asciz "false"
label4:
	.quad 7
	.quad 1
