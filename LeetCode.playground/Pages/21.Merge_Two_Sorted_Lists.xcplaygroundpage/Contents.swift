//created 2021-10-20
//[question] https://leetcode.com/problems/merge-two-sorted-lists/

import Foundation
//시도한 방식(제출 X)
class Solution2 {
    func mergeTwoLists(_ l1: [Int]?, _ l2: [Int]?) -> [Int]? {
        var result: [Int] = []
        if var l1 = l1, let l2 = l2 {
            l2.forEach {
                l1.append($0)
            }
            result = l1.sorted()
        }
        return result
    }
}

//---------------------------------------------------------------------------------
//제출한 코드
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        guard let l2 = l2 else {
            return l1
        }
        if l1.val < l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        }else {
            l2.next = mergeTwoLists(l2.next, l1)
            return l2
        }
    }
}
