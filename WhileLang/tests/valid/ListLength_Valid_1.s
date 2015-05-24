
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	movq 0(%rdi), %rax
	movq %rax, -8(%rbp)
	leaq label1(%rip), %rsi
	call print
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
	.globl main
main:
	pushq %rbp
	call wl_main
	popq %rbp
	ret

	.data
label1:
	.quad 3
