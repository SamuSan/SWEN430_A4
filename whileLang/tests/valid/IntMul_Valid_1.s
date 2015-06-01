
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq label1(%rip), %rdi
	movq label2(%rip), %rbx
	imulq %rbx, %rdi
	movq label3(%rip), %rbx
	addq %rbx, %rdi
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %rdi
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
label4:
	.quad 3
