import base64

# Encoding the file from base64 to binary
file = base64.b64decode("""HUIfTQsP...JwwRTWM=""")
print(file)
print()

# Step 1 - guess key size
KEYSIZE = 5


# Step 2 - find hamming distance - number of differing bits
def hamming2(s1, s2):
    """Calculate the Hamming distance between two bit strings"""
    assert len(s1) == len(s2)
    return sum(c1 != c2 for c1, c2 in zip(s1, s2))


def distance(a, b):  # Hamming distance
    calc = 0
    for ca, cb in [(a[i], b[i]) for i in range(len(a))]:
        bina = '{:08b}'.format(int(ca))
        binb = '{:08b}'.format(int(cb))
        calc += hamming2(bina, binb)
    return calc

# Test step 2
print("distance: 'this is a test' and 'wokka wokka!!!' =", distance([ord(c) for c in "this is a test"], [ord(c) for c in "wokka wokka!!!"]))  # 37 - Working
print()


# Step 3
key_sizes = []
# For each key size
for KEYSIZE in range(2, 41):
    running_sum = []
    for i in range(0, int(len(file) / KEYSIZE) - 1):
        running_sum.append(distance(file[i * KEYSIZE:(i + 1) * KEYSIZE],
                                     file[(i + 1) * KEYSIZE:(i + 2) * KEYSIZE]) / KEYSIZE)
    key_sizes.append((sum(running_sum)/ len(running_sum), KEYSIZE))
key_sizes.sort(key=lambda a: a[0])


# Step 4
for val, key in key_sizes:
    print(key, ":", val)
KEYSIZE = key_sizes[0][1]
print()


# Step 5 + 6
# Each line is a list of all the bytes in that index
splited_file = [[] for i in range(KEYSIZE)]
counter = 0
for char in file:
    splited_file[counter].append(char)
    counter += 1
    counter %= KEYSIZE
for line in splited_file:
    print(line)
print()


# Step 7
# Code from another level
# Gets a string and a single char
# Doing a single-byte XOR over it
def single_char_string(a, b):
    final = ""
    for c in a:
        final += chr(c ^ b)
    return final


# Going over all the bytes and listing the result arter the XOR by number of bytes
def find_single_byte(in_string):
    helper_list = []
    for num in range(256):
        helper_list.append((single_char_string(in_string, num), num))
    helper_list.sort(key=lambda a: a[0].count(' '), reverse=True)
    return helper_list[0]

# Step 8
final_key = ""
key_list = []
for line in splited_file:
    result = find_single_byte(line)
    print(result)
    final_key += chr(result[1])
    key_list.append(result[1])
print(final_key)
print(key_list)