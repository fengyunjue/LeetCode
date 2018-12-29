//
//  MergeKLists.swift
//  LeetCodeTests
//
//  Created by admin on 12/28/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class MergeKLists: XCTestCase {

//    class Solution {
//        func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
//            if lists.count == 0 { return nil }
//            if lists.count == 1 { return lists.first! }
//
//            var arr = [Int]()
//            for node in lists {
//                var header = node
//                while header != nil {
//                    arr.append(header!.val)
//                    header = header?.next
//                }
//            }
//            arr.sort()
//            let header = ListNode(0)
//            var next = header
//            for i in arr {
//                next.next = ListNode(i)
//                next = next.next!
//            }
//            return header.next
//        }
//    }
    
    class Solution {
        func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
            return partition(lists, 0, lists.count - 1)
        }
        func partition(_ lists: [ListNode?], _ left: Int, _ right: Int) -> ListNode? {
            if left == right {
                return lists[left]
            }
            
            if left < right {
                let mid = (left + right) / 2
                let l1 = partition(lists, left, mid)
                let l2 = partition(lists, mid + 1, right)
                return mergeTwoList(l1, l2)
            }
            return nil
        }
        func mergeTwoList(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            if l1 == nil {
                return l2
            }
            if l2 == nil {
                return l1
            }
            
            if l1!.val > l2!.val {
                let tempNode = l2
                tempNode?.next = mergeTwoList(l1, l2?.next)
                return tempNode
            } else {
                let tempNode = l1
                tempNode?.next = mergeTwoList(l1?.next, l2)
                return tempNode
            }
        }
    }

    func testExample() {
        let node = ListNode(1)
        node.next = ListNode(4)
        node.next?.next = ListNode(5)
        let node1 = ListNode(1)
        node1.next = ListNode(3)
        node1.next?.next = ListNode(4)
        let node2 = ListNode(2)
        node2.next = ListNode(6)
        // 输入: [1->4->5, 1->3->4, 2->6]
        // 输出: 1->1->2->3->4->4->5->6
       let n = Solution().mergeKLists([node, node1, node2])
        print("success", n)
    }

}
