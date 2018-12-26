//
//  MergeTwoLists.swift
//  LeetCodeTests
//
//  Created by admin on 12/26/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class MergeTwoLists: XCTestCase {

    public class ListNode : CustomStringConvertible{
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
        
        public var description: String {
            var str = "\(val)"
            var next = self
            while next.next != nil{
                str += "->\(next.next!.val)"
                next = next.next!
            }
            return str
        }
    }
    
    class Solution {
        func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            if l1 == nil || l2 == nil {
                return l1 ?? l2
            }
            var p1 = l1
            var p2 = l2
            let header = ListNode(0)
            var next = header
            while p1 != nil && p2 != nil {
                if p1!.val > p2!.val {
                    next.next = p2
                    p2 = p2?.next
                }else{
                    next.next = p1
                    p1 = p1?.next
                }
                next = next.next!
            }
            if p1 != nil {
                next.next = p1
            }
            if p2 != nil {
                next.next = p2
            }
            return header.next
        }
    }
    

    func testExample() {
        let node = ListNode(1)
        node.next = ListNode(2)
        node.next?.next = ListNode(4)
        let node1 = ListNode(1)
        node1.next = ListNode(3)
        node1.next?.next = ListNode(4)
        // 1->2->4, 1->3->4 输出：1->1->2->3->4->4
        print(node, node1, Solution().mergeTwoLists(node, node1))

    }
    
    func testExample1() {
        let node = ListNode(5)
        let node1 = ListNode(1)
        node1.next = ListNode(2)
        node1.next?.next = ListNode(4)
        // 5, 1->2->4 输出：1->2->4->5
        print(node, node1, Solution().mergeTwoLists(node, node1))
        
    }

}
