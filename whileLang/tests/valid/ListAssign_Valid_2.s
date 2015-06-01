
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 0(%rdi), %rax
	movq %rax, -16(%rbp)
	movq %rbp, %rdi
	addq $-16, %rdi
	movq 0(%rdi), %rax
	movq %rax, -8(%rbp)
	movq label1(%rip), %rdi
	movq %rbp, %rdi
	addq $-16, %rdi
	leaq label2(%rip), %rsi
	call _print
	movq %rbp, %rdi
	addq $-8, %rdi
	leaq label3(%rip), %rsi
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
label2:
	.quad 7
	.quad 3
label3:
	.quad 7
	.quad 3
