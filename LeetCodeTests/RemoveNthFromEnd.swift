//
//  RemoveNthFromEnd.swift
//  LeetCodeTests
//
//  Created by admin on 12/21/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class RemoveNthFromEnd: XCTestCase {
    

    
    class Solution {
        func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
            var first: ListNode? = head
            var second: ListNode? = head
            
            for _ in 0..<n {
                first = first?.next
            }
            // 如果first为nil,说明倒数第n个,就是第一个直接返回head?.next
            if first == nil {
                return head?.next
            }
            
            while first?.next != nil {
                first = first?.next
                second = second?.next
            }
            second?.next = second?.next?.next
            return head
        }
        
        func removeNthFromEnd2(_ head: ListNode?, _ n: Int) -> ListNode? {
            if head == nil {
                return nil
            }
            
            var next: ListNode = head!
            var arr: [ListNode] = [next]
            
            while next.next != nil {
                arr.append(next.next!)
                next = next.next!
            }
            let i = arr.count - n
            if i == 0 {
                return i+1 < arr.count ? arr[i+1] : nil
            }else if i > 0 {
                arr[i-1].next = i+1 < arr.count ? arr[i+1] : nil
            }
            return head
        }
    }

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
    
    func testExample() {
        let node = ListNode(1)
        node.next = ListNode(2)
        node.next?.next = ListNode(3)
        node.next?.next?.next = ListNode(4)
        node.next?.next?.next?.next = ListNode(5)
        let node1 = Solution().removeNthFromEnd(node, 2)
        print(node, node1)
    }

}
