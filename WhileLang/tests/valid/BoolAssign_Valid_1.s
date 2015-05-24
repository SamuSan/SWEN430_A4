
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $8, %rsp
	movq %rdi, -8(%rbp)
	movq -8(%rbp), %rdi
	leaq label2(%rip), %rsi
	call print
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
label1:
	.quad 1
label2:
	.quad 1
label3:
	.quad 1
label4:
	.quad 1
