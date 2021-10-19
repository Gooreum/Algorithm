//: [Previous](@previous)

//[question]

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var output: [Int] = []
    
    for index in 0 ... nums.count - 1  {
        for index2 in 0 ... nums.count - 1 {
            if (index != index2) && (nums[index] + nums[index2] == target ) {
                if index > index2 {
                    output = [index2, index]
                }else {
                    output = [index, index2]
                }
            }
        }
    }    
    return output
}

func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    //key = nums의 값.. nums의 element 중에 중복되는 요소들이 있을텐데.
    //value = nums의 인덱스
    var dict = [Int: Int]()
        
    for i in 0..<nums.count {
        dict[nums[i]] = i
    }
    //dict[1] = 0
    //dict[2] = 1
    //dict[3] = 2
    
    //1,2,3
    for j in 0..<nums.count {
        let complement = target - nums[j] //complement = 3 - nums[0] = 3 - 1 = 2
        let cIdx = dict[complement] //cLdx = dict[2] = 1
        if cIdx != nil && cIdx != j {
            return [cIdx!, j]} // 1, 0
    }
    return []
}

print(twoSum2([3,3], 6))

//: [Next](@next)
