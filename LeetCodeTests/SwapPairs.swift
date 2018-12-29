//
//  SwapPairs.swift
//  LeetCodeTests
//
//  Created by admin on 12/29/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class SwapPairs: XCTestCase {
    
    class Solution {
        func swapPairs(_ head: ListNode?) -> ListNode? {
            
            var left: ListNode? = nil
            var first = head
            var second = first?.next
            var right = second?.next

            let node: ListNode? = second == nil ? head : second

            while second != nil {
                left?.next = second
                second?.next = first
                first?.next = right
                left = first
                first = right
                second = first?.next
                right = second?.next
            }
            return node
        }
    }

    func testExample() {
        
        let node = ListNode(1)
        node.next = ListNode(2)
        node.next?.next = ListNode(3)
        node.next?.next?.next = ListNode(4)
        // 给定 1->2->3->4, 你应该返回 2->1->4->3.
        print(node, Solution().swapPairs(node))
    }



}
