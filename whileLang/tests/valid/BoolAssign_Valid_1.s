
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq label1(%rip), %rdi
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %rdi
	leaq label2(%rip), %rsi
	call _print
	movq label3(%rip), %rdi
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
label1:
	.word 1
label2:
	.quad 1
label3:
	.word 0
label4:
	.quad 1
