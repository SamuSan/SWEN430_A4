
	.text
wl_pred:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	nullq label1(%rip), %rdi
	movq %rdi, 24(%rbp)
	jmp label0
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $16, %rsp
	call wl_pred
	movq 8(%rsp), %rdi
	leaq label3(%rip), %rsi
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
label1:
	.asciz "false"
label3:
	.quad 1
