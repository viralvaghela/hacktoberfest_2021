# time:O(n) | space: O(n)


def Balanced_Brackets(string):
    openingBrackets = "({["
    closingBrackets = ")}]"
    matchingBrackets = {")": "(", "}": "{", "]": "["}
    stack = []
    for char in string:
        if char in openingBrackets:
            stack.append(char)
        elif char in closingBrackets:
            # if stack is empty that means that
            # dont have any opening brackets to match with
            if len(stack) == 0:
                return False
            # if the prev/last character of stack matches with
            # current brackets then pop
            if stack[-1] == matchingBrackets[char]:
                stack.pop()
            else:
                return False

    return len(stack) == 0


print(Balanced_Brackets("({[]})"))
