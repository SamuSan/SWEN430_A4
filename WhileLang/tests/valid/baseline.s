
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	leaq label1, %rdi
	leaq label2(%rip), %rsi
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
	.asciz "hello world"
label2:
	.quad 5
