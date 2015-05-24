
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	leaq label1, %rdi
	leaq label2, %rbx
	imulq %rbx, %rdi
	leaq label3, %rbx
	addq %rbx, %rdi
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %rdi
	leaq label4(%rip), %rsi
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
label4:
	.quad 3
