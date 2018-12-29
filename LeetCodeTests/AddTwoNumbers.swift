//
//  AddTwoNumbers.swift
//  LeetCodeTests
//
//  Created by admin on 11/7/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class AddTwoNumbers: XCTestCase {

    class Solution {
        func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
            var l3: ListNode? = nil
            
            var carry = 0
            var l4:ListNode? = nil
            
            var ll1 = l1
            var ll2 = l2
            while (ll1 != nil || ll2 != nil || carry > 0) {
                let count : Int  = (ll1?.val ?? 0) + (ll2?.val ?? 0) + carry
                carry = count / 10
                if l3 == nil {
                    l3 = ListNode.init(count % 10)
                    l4 = l3
                }else{
                    l4?.next = ListNode.init(count % 10)
                    l4 = l4?.next
                }
                ll1 = ll1?.next
                ll2 = ll2?.next
            }
            return l3
        }
    }
    
    func testExample() {
        let l1 = ListNode(2)
        l1.next = ListNode(4)
        l1.next?.next = ListNode(3)
        let l2 = ListNode(5)
        l2.next = ListNode(6)
        l2.next?.next = ListNode(4)
        
        let l3 = Solution().addTwoNumbers(l1, l2)
        XCTAssert(l3?.val == 7)
        XCTAssert(l3?.next?.val == 0)
        XCTAssert(l3?.next?.next?.val == 8)
    }
    func testExample2() {
        let l3 = Solution().addTwoNumbers(ListNode(2), ListNode(8))
        XCTAssert(l3?.val == 0)
        XCTAssert(l3?.next?.val == 1)
    }


}
