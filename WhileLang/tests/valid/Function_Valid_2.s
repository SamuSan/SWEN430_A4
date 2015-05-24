
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	leaq label1, %rdi
	movq 24(%rbp), %rbx
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
	subq $8, %rsp
	leaq label4, %rdi
	movq %rdi, -8(%rbp)
	subq $16, %rsp
	movq -8(%rbp), %rdi
	movq %rdi, 8(%rsp)
	call wl_f
	movq 0(%rsp), %rdi
	leaq label5(%rip), %rsi
	call print
label3:
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
	.asciz ""
label2:
	.quad 3
label5:
	.quad 5
