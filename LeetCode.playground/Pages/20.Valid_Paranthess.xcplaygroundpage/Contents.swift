//[question] https://leetcode.com/problems/valid-parentheses/
/*
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 
 Example 0:
 Input: s = "()"
 Output: true
 
 Example 2:
 Input: s = "()[]{}"
 Output: true
 
 Example 3:
 Input: s = "(]"
 Output: false
 
 Example 4:
 Input: s = "([)]"
 Output: false
 
 Example 5:
 Input: s = "{[]}"
 Output: true
 
 Constraints:
 0 <= s.length <= 10(4승)
 s consists of parentheses only '()[]{}'.
 */

import Foundation

//스택으로 풀어보자
func isValid(_ s: String) -> Bool {
    var result = false
    var conditionCnt = 0
    let bracketDict : [Character: Character] = [")": "(", "]" :"[", "}": "{"]
    var stack: [Character] = []
    
    for element in s {
        if element == "(" || element == "[" || element == "{" {
            conditionCnt += 1
            stack.append(element)
        }else {
            if stack.last != nil {
                let openBracket = stack.popLast()
                if openBracket == bracketDict[element] { conditionCnt -= 1 }
            }else {
                conditionCnt = -1
                break
            }
        }
    }
    
    if conditionCnt == 0 {
        result = true
    }else {
        result = false
    }
    
    
    return result
}

//most vote code
func isValid2(_ s: String) -> Bool {
    var stack = [Character]()
    
    for c in s {
        switch c {
        case "(" :
            stack.append(")")
        case "{" :
            stack.append("}")
        case "[" :
            stack.append("]")
        default :
            if stack.isEmpty || stack.popLast() != c { return false }
        }
    }
    
    return stack.isEmpty
}

//print(isValid("{}{{{}}}"))
print(isValid2(""))
