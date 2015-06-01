
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 40(%rbp), %rdi
	movq 32(%rbp), %rbx
	cmpq %rbx, %rdi
	jz label1
	movq $0, %rdi
	jmp label2
label1:
	movq $1, %rdi
label2:
	movq %rdi, -8(%rbp)
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_g:
	pushq %rbp
	movq %rsp, %rbp
	subq $16, %rsp
	movq 40(%rbp), %rdi
	movq 32(%rbp), %rbx
	cmpq %rbx, %rdi
	jge label4
	movq $0, %rdi
	jmp label5
label4:
	movq $1, %rdi
label5:
	movq %rdi, -8(%rbp)
label3:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_main:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	subq $32, %rsp
	movq label7(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label8(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_f
	movq 8(%rsp), %rdi
	leaq label9(%rip), %rsi
	call _print
	subq $32, %rsp
	movq label10(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label11(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_f
	movq 8(%rsp), %rdi
	leaq label12(%rip), %rsi
	call _print
	subq $32, %rsp
	movq label13(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label14(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_f
	movq 8(%rsp), %rdi
	leaq label15(%rip), %rsi
	call _print
	subq $32, %rsp
	movq label16(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label17(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_g
	movq 8(%rsp), %rdi
	leaq label18(%rip), %rsi
	call _print
	subq $32, %rsp
	movq label19(%rip), %rdi
	movq %rdi, 24(%rsp)
	movq label20(%rip), %rdi
	movq %rdi, 16(%rsp)
	call wl_g
	movq 8(%rsp), %rdi
	leaq label21(%rip), %rsi
	call _print
label6:
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
label9:
	.quad 3
label12:
	.quad 3
label15:
	.quad 3
label18:
	.quad 3
label21:
	.quad 3
