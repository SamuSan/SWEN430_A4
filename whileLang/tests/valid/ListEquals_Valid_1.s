
	.text
wl_f:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
label0:
	movq %rbp, %rsp
	popq %rbp
	ret
wl_g:
	pushq %rbp
	movq %rsp, %rbp
	subq $0, %rsp
	movq %rbp, %rdi
	addq $24, %rdi
	leaq label2(%rip), %rsi
	call _print
	movq %rbp, %rdi
	addq $16, %rdi
	leaq label3(%rip), %rsi
	call _print
	subq $32, %rsp
	movq %rbp, %rdi
	addq $24, %rdi
	movq 0(%rdi), %rax
	movq %rax, 24(%rsp)
	movq %rbp, %rdi
	addq $16, %rdi
	movq 0(%rdi), %rax
	movq %rax, 16(%rsp)
	call wl_f
	movq 8(%rsp), %rdi
	leaq label4(%rip), %rsi
	call _print
label1:
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
	movq 0(%rdi), %rax
	movq %rax, 0(%rsp)
	call wl_g
	subq $16, %rsp
	movq 0(%rdi), %rax
	movq %rax, 8(%rsp)
	movq 0(%rdi), %rax
	movq %rax, 0(%rsp)
	call wl_g
	subq $16, %rsp
	movq 0(%rdi), %rax
	movq %rax, 8(%rsp)
	movq 0(%rdi), %rax
	movq %rax, 0(%rsp)
	call wl_g
label5:
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
	.quad 7
	.quad 3
label3:
	.quad 7
	.quad 3
label4:
	.quad 5
