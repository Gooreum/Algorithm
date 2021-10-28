//: [Previous](@previous)

import Foundation

class Solution {
    //MARK: 내가 작성한 코드 -> 시간초과 됨.
    //    func maxSubArray(_ nums: [Int]) -> Int {
    //        var max = nums[0]
    //        for i in 0..<nums.count {
    //            var numsSum = nums[i]
    //            if numsSum > max { max = numsSum }
    //            for j in i+1..<nums.count {
    //                numsSum += nums[j]
    //                if numsSum > max { max = numsSum } else { continue }
    //            }
    //        }
    //
    //        return max
    //    }
    
    //MARK: Swift에서 가장 인기 많은 코드
    func maxSubArray(_ nums: [Int]) -> Int {
        if nums.isEmpty {
            return Int.min
        }
        var maxValue = nums[0]
        var preMax = nums[0]
        for i in 1..<nums.count {
            let value = nums[i]
            let curMax = max(preMax + value, value)
            maxValue = max(maxValue, curMax)
            preMax = curMax
        }
        return maxValue
    }
}

let solution = Solution()
print(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
