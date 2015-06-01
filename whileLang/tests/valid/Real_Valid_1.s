
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	nullq label1(%rip), %rdi
	movq %rdi, -16(%rbp)
	nullq label2(%rip), %rdi
	movq %rdi, -8(%rbp)
	movq -16(%rbp), %rdi
	movq -8(%rbp), %rbx
	addq %rbx, %rdi
	leaq label3(%rip), %rsi
	call _print
	movq -8(%rbp), %rdi
	movq -16(%rbp), %rbx
	subq %rbx, %rdi
	leaq label4(%rip), %rsi
	call _print
	movq -16(%rbp), %rdi
	movq -8(%rbp), %rbx
	movq %rdi, %rax
	cltd
	idivq %rbx
	movq %rax, %rdi
	leaq label5(%rip), %rsi
	call _print
	movq -16(%rbp), %rdi
	movq -8(%rbp), %rbx
	imulq %rbx, %rdi
	leaq label6(%rip), %rsi
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
label3:
	.quad 4
label4:
	.quad 4
label5:
	.quad 4
label6:
	.quad 4
