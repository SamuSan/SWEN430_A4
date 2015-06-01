
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq 40(%rbp), %rdi
	movq 32(%rbp), %rbx
	movq %rdi, %rax
	cltd
	idivq %rbx
	movq %rax, %rdi
	movq %rdi, 24(%rbp)
	jmp label0
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	subq $32, %rsp
	movq label2(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label3(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_f
	movq 8(%rsp), %rdi
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %rdi
	leaq label4(%rip), %rsi
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
label4:
	.quad 3
