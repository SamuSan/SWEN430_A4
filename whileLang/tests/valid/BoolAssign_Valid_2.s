
	.text
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	nullq label1(%rip), %rdi
	movq %rdi, -16(%rbp)
	nullq label2(%rip), %rdi
	movq %rdi, -8(%rbp)
	movq -16(%rbp), %rdi
	leaq label3(%rip), %rsi
	call _print
	movq -8(%rbp), %rdi
	leaq label4(%rip), %rsi
	call _print
	leaq label5(%rip), %rdi
	leaq label6(%rip), %rsi
	call _print
	movq -16(%rbp), %rdi
	movq -8(%rbp), %rbx
	andq %rbx, %rdi
	movq %rdi, -16(%rbp)
	movq -16(%rbp), %rdi
	leaq label7(%rip), %rsi
	call _print
	leaq label8(%rip), %rdi
	leaq label9(%rip), %rsi
	call _print
	movq -16(%rbp), %rdi
	notq %rdi
	andq $1, %rdi
	leaq label10(%rip), %rsi
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
	.asciz "true"
label2:
	.asciz "false"
label3:
	.quad 1
label4:
	.quad 1
label5:
	.asciz "AND"
label6:
	.quad 5
label7:
	.quad 1
label8:
	.asciz "NOT"
label9:
	.quad 5
label10:
	.quad 1
