
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq 0(%rdi), %rax
	movq %rax, 24(%rbp)
	jmp label0
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $16, %rsp
	call wl_f
	movq %rsp, %rdi
	addq $8, %rdi
	movq 0(%rdi), %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	call wl_f
	movq %rsp, %rdi
	addq $8, %rdi
	movq 0(%rdi), %rax
	movq %rax, -16(%rbp)
	movq label2(%rip), %rdi
	leaq label3(%rip), %rsi
	call _print
	leaq label4(%rip), %rsi
	call _print
	leaq label5(%rip), %rsi
	call _print
	leaq label6(%rip), %rsi
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
	.quad 3
label4:
	.quad 3
label5:
	.quad 3
label6:
	.quad 3
