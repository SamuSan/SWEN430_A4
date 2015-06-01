
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	leaq label1(%rip), %rdi
	movq %rdi, 16(%rbp)
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
	movq label3(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label4(%rip), %rsi
	call _print
	subq $16, %rsp
	movq label5(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label6(%rip), %rsi
	call _print
	subq $16, %rsp
	movq label7(%rip), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label8(%rip), %rsi
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
	.asciz ""
label4:
	.quad 5
label6:
	.quad 5
label8:
	.quad 5
