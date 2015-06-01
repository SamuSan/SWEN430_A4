
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	leaq label1(%rip), %rdi
	movq %rbp, %rbx
	addq $24, %rbx
	movq %rdi, %rdi
	movq %rbx, %rsi
	leaq label2(%rip), %rdx
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
	subq $0, %rsp
	subq $16, %rsp
	movq 0(%rdi), %rax
	movq %rax, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label4(%rip), %rsi
	call _print
label3:
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
label2:
	.quad 7
	.quad 4
label4:
	.quad 5
