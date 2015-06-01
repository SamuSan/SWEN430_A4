
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $16, %rsp
	movq label1(%rip), %rdi
	movq %rdi, 8(%rsp)
	movq 40(%rbp), %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 8(%rdi), %rax
	movq %rax, 32(%rbp)
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
	subq $32, %rsp
	movq label3(%rip), %rdi
	movq %rdi, -8(%rbp)
	subq $32, %rsp
	movq -8(%rbp), %rdi
	movq %rdi, 24(%rsp)
	call wl_f
	movq %rsp, %rdi
	addq $8, %rdi
	movq 8(%rdi), %rax
	movq %rax, -16(%rbp)
	movq 0(%rdi), %rax
	movq %rax, -24(%rbp)
	movq %rbp, %rdi
	addq $-24, %rdi
	leaq label4(%rip), %rsi
	call _print
	subq $16, %rsp
	movq -8(%rbp), %rdi
	movq %rdi, 8(%rsp)
	movq -8(%rbp), %rdi
	movq %rdi, 0(%rsp)
	movq %rsp, %rdi
	movq 8(%rdi), %rax
	movq %rax, -16(%rbp)
	movq 0(%rdi), %rax
	movq %rax, -24(%rbp)
	movq %rbp, %rdi
	addq $-24, %rdi
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
label4:
	.quad 6
	.quad 2
	.quad 2
	.asciz "b1"
	.quad 3
	.quad 2
	.asciz "b2"
	.quad 3
label5:
	.quad 6
	.quad 2
	.quad 2
	.asciz "b1"
	.quad 3
	.quad 2
	.asciz "b2"
	.quad 3
