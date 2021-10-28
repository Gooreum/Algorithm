//[question] https://leetcode.com/problems/longest-common-prefix/

import Foundation


func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.isEmpty { return "" }
    var common = strs[0]
    strs.forEach({
        while !$0.hasPrefix(common) {            
            common = String(common.dropLast())
        }
    })
    return common
}

//print(longestCommonPrefix(["flower","flow","flight"]))
print(longestCommonPrefix(["a","b","c"]))
