//
//  PalindromeNumber.swift
//  LeetCodeTests
//
//  Created by admin on 11/26/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class PalindromeNumber: XCTestCase {
    class Solution {
        func isPalindrome(_ x: Int) -> Bool {
            // 如果x小于0,则x不是回文数;如果x的尾数是0,则x也不是回文数(需排除x==0的情况,因为0是h回文数)
            if (x < 0) || (x % 10 == 0 && x != 0){
                return false
            }
            var num = x
            var halfNum = 0
             // 当halfNum 大于等于 num时，停止循环
            while halfNum < num {
                // 得到后半段翻转后的数
                halfNum = halfNum * 10 + num % 10
                num /= 10
            }
            return  halfNum == num ||  halfNum / 10 == num
        }
    }

    func testExample() {
        XCTAssertTrue(Solution().isPalindrome(21120) == false)
        XCTAssertTrue(Solution().isPalindrome(0) == true)
        XCTAssertTrue(Solution().isPalindrome(122221) == true)
        XCTAssertTrue(Solution().isPalindrome(12221) == true)
        XCTAssertTrue(Solution().isPalindrome(-121) == false)
        XCTAssertTrue(Solution().isPalindrome(10) == false)
        XCTAssertTrue(Solution().isPalindrome(80) == false)
        XCTAssertTrue(Solution().isPalindrome(81) == false)
        
    }


}
