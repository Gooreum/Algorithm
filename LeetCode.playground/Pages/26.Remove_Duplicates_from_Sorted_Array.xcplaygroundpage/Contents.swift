//[question] https://leetcode.com/problems/remove-duplicates-from-sorted-array/

import Foundation

class Solution {
    //MARK: 내가 풀고 제출한 코드
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        var k: Int = nums.count
        var prev: Int = 101
        nums.enumerated().forEach {
            //이전 값과 같다면 새로운 값을 101로 바꿈.
            if prev == $1 {
                nums[$0] = 101
                k -= 1
            }
            prev = $1
        }
        nums.sort()
        print(nums)
        return k
    }
    
    //MARK: LeetCode에서 가장 인기 많은 코드
    func removeDuplicates2(_ nums: inout [Int]) -> Int {
        /// nums.count will be used 3 times during function, pre-calculate
        /// in stack frame for fewer CPU instructions.
        let length = nums.count
        guard length > 1 else { return length }
        
        /// The number of unique values we are keeping
        var keep = 1
        /// Minimal iterative instructions.
        /// Overflow addition operator avoids instructions that unecessarily
        /// check for Integer overflow.
        for i in 1..<length {
            if nums[i - 1] != nums[i] {
                nums[keep] = nums[i]
                keep += 1
            }
        }
        /// Eliminate all of nums that are not unique.
        /// (20% faster than nums = Array(nums[0..<keep]).
        nums.removeLast(length - keep)
        return keep
    }
    
}

var nums = [1]
let solution = Solution()
print(solution.removeDuplicates2(&nums))
