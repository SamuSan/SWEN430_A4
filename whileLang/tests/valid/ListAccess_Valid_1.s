
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq %rdi, -16(%rbp)
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %rdi
	movq -16(%rbp), %rbx
	addq %rbx, %rdi
	movq %rdi, 16(%rbp)
	jmp label0
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 0(%rdi), %rax
	movq %rax, -8(%rbp)
	subq $16, %rsp
	movq %rbp, %rdi
	addq $-8, %rdi
	movq 0(%rdi), %rax
	movq %rax, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label2(%rip), %rsi
	call _print
	movq %rbp, %rdi
	addq $-8, %rdi
	leaq label3(%rip), %rsi
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
	.quad 3
label3:
	.quad 7
	.quad 3
