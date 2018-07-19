extern printf
extern scanf
extern exit

global _start


section .data

out: db "select number 1(all), 2(only) =",0
out1 db "select dan number = ",10,0
end db "end",10,0
data db "%d",0
form db "%d x %d = %d",10,0

out_data db 0
out1_number db 0


section .text

_start:
	mov rdi, out
	call printf

	mov rdi, data
	mov rsi, out_data
	call scanf

	mov rax, [out_data]
	cmp rax, 2


all:
	je unall
	jg bye


	mov r13, 1
	mov r14, 2


loop_:
	mov rdi, form
	mov rsi, r14
	mov rdx, r13
	mov rax, rsi
	mul rdx
	mov rcx, rax
	mov rdx, r13
	call printf
	inc r13
	cmp r13, 10
	jne loop_
	mov r13, 1
	inc r14
	cmp r14, 20
	je bye
	jmp loop_

unall:
	mov rdi, out1
	call printf

	mov rdi, data
	mov rsi, out1_number
	call scanf

	mov r14, [out1_number] 
	cmp r14, 19
	jg bye
	cmp r14, 0
	je bye
	mov r15, 1

loop1_:
	mov rdi, form
	mov rsi, r14 
	mov rdx, r15
	mov rax, rsi
	mul rdx
	mov rcx, rax
	mov rdx, r15
	call printf
	inc r15
	cmp r15, 10
	jne loop1_
	mov r15, 1

bye:
	mov rdi, end
	call printf
	call exit
	
	
	


	

	
