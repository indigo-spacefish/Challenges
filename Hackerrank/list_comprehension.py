"""
Problem Statement

Lets learn about list comprehensions!. You are given three integers X, Y and Z denoting the dimensions of a Cuboid. You have to print a list of all possible coordinates on the three dimensional grid, such that at any point the sum Xi + Yi + Zi is not equal to N. If X = 2, then possible values of Xi can be 0, 1 and 2. The same applies to Y and Z.

Input Format

Four integers X, Y, Z and N in four different lines.

Output Format

You have to print the list, in increasing order.
"""

# Enter your code here. Read input from STDIN. Print output to STDOUT
# x_var = int(raw_input())
# y_var = int(raw_input())
# z_var = int(raw_input())
# n_var = int(raw_input())

x_var = int("1")
y_var = int("1")
z_var = int("1")
n_var = int("2")

all_results = []

for x in range(0, x_var+1):
    for i in range(0, y_var+1):
        for n in range(0, z_var+1):
            all_results.append([x, i, n])

filtered_results = [x for x in all_results if sum(x) != n_var]
sorted_results = sorted(filtered_results)

print(sorted_results)
