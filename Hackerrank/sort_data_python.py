test_case = "5 3\n10 2 5\n7 1 0\n9 9 9\n1 23 12\n6 5 9\n1"

def sort_data(arg):
    input_data = arg.split('\n')
    input_length = len(input_data)

    n_value = int(input_data[0][0])
    m_value = int(input_data[0][2])
    k_value = int(input_data[input_length-1][0])

    ranged_input = [input_data[x] for x in range(1, n_value+1)]

    no_spaces = []
    for x in ranged_input:
        no_spaces.append(x.split())

    as_numbers = []
    for x in no_spaces:
        sub_list = []
        for i in x:
            sub_list.append(int(i))
        as_numbers.append(sub_list)

    sorted_output = sorted(as_numbers, key=lambda index: index[k_value])

    decorated_output = []
    for x in sorted_output:
        sub_list = []
        for i in x:
            sub_list.append(str(i))
        line = ' '.join(sub_list)
        decorated_output.append(line)

    final_output = ""
    for x in decorated_output:
        x += '\n'
        final_output += x

    return final_output

print sort_data(test_case)
