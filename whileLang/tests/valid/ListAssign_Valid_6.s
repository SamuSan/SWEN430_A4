
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq label1(%rip), %rdi
	leaq label2(%rip), %rdi
	movq %rbp, %rbx
	addq $24, %rbx
	movq %rdi, %rdi
	movq %rbx, %rsi
	leaq label3(%rip), %rdx
	call _str_left_append
	movq %rax, %rdi
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
	movq %rbp, %rdi
	addq $-8, %rdi
	leaq label5(%rip), %rsi
	call _print
	subq $16, %rsp
	movq %rbp, %rdi
	addq $-8, %rdi
	movq 0(%rdi), %rax
	movq %rax, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label6(%rip), %rsi
	call _print
	movq %rbp, %rdi
	addq $-8, %rdi
	leaq label7(%rip), %rsi
	call _print
label4:
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
	.asciz ""
label3:
	.quad 7
	.quad 3
label5:
	.quad 7
	.quad 3
label6:
	.quad 5
label7:
	.quad 7
	.quad 3
