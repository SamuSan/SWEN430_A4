
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	leaq label1(%rip), %rdi
	leaq label2(%rip), %rsi
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
	.asciz "helloworld"
label2:
	.quad 5
