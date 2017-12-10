import sequtils
import strutils

proc caesar_encrypt(input : string; key: int) : string =
    var rev : string = '\0'.repeat(input.len)
    for i in 0..(input.len - 1):
        if 'a' <= input[i] and input[i] <= 'z':
            rev[i] = char(((input[i].int + key - 'a'.int) mod 26) + 'a'.int)
        elif 'A' <= input[i] and input[i] <= 'Z':
            rev[i] = char(((input[i].int + key - 'A'.int) mod 26) + 'A'.int)
        else:
            rev[i] = input[i]
    rev

proc caesar_decrypt(input : string; key: int) : string =
    var new_key : int = 26 - key
    var rev : string = '\0'.repeat(input.len)
    for i in 0..(input.len - 1):
        if 'a' <= input[i] and input[i] <= 'z':
            rev[i] = char(((input[i].int + new_key - 'a'.int) mod 26) + 'a'.int)
        elif 'A' <= input[i] and input[i] <= 'Z':
            rev[i] = char(((input[i].int + new_key - 'A'.int) mod 26) + 'A'.int)
        else:
            rev[i] = input[i]
    rev

for i in 0..26:
    echo "ABCDEFGHIJKLMNOPQRSTUVWXYZ".caesar_encrypt(i).caesar_decrypt(i) == "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
