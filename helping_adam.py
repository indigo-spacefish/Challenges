# My friend Adam needed help writing a 8-bit binary to decimal converter for school
# Here is what I helped him come up with

int_list = [0, 0, 0, 0, 0, 0, 0, 0]
list_length = len(int_list)
num=input("Please enter an 8 bit binary number:")
input_length = len(num)

if input_length != 8:
   print("error")
else:
   for x in range(0, input_length):
       if (int(num[x]) != 1 and int(num[x]) != 0):
           print("error, not a binary number")
       else:
           int_list[x] = int(num[x])

decimal_result = 0

for x in range(0, list_length):
    list_length = (list_length - 1)
    if (int_list[x] > 0):
        decimal_result += (2 ** list_length)

print "Binary number converted to decimal: "
print decimal_result

