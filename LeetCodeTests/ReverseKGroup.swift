//
//  ReverseKGroup.swift
//  LeetCodeTests
//
//  Created by admin on 1/2/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class ReverseKGroup: XCTestCase {
    class Solution {
        func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
            if head == nil || k == 0{
                return head
            }
            var result: ListNode? = nil
            
            var p = head
            var q = head?.next
            var r: ListNode? = nil
            p?.next = nil
            
            var pTail: ListNode? = nil
            var qHead: ListNode? = head
            
            var i = 1
            while q != nil {
                r = q?.next
                q?.next = p
                p = q
                q = r
                i += 1
                if i == k {
                    if result == nil {
                        result = p
                    }
                    
                    if pTail != nil {
                        pTail?.next = p
                    }
                    pTail = qHead
                    qHead = q
                    
                    if q != nil {
                        p = q
                        q = q?.next
                    }
                    qHead?.next = nil
                    i = 1
                }
            }
            if qHead != nil {
                q = p?.next
                p?.next = nil
                while q != nil {
                    r = q?.next
                    q?.next = p
                    p = q
                    q = r
                }
                pTail?.next = qHead
            }
            if result == nil {
                result = p
            }
            return result
        }
    }

    func testExample() {
        let node = ListNode(1)
        node.next = ListNode(2)
        node.next?.next = ListNode(3)
        node.next?.next?.next = ListNode(4)
        node.next?.next?.next?.next = ListNode(5)
        // 给定 1->2->3->4->5, 你应该返回 2->1->4->3->5.
        print(Solution().reverseKGroup(node, 3))
        
        
        let node1 = ListNode(1)
        node1.next = ListNode(2)
        node1.next?.next = ListNode(3)
        node1.next?.next?.next = ListNode(4)
        node1.next?.next?.next?.next = ListNode(5)
        print(Solution().reverseKGroup(node1, 3))
    }

}
