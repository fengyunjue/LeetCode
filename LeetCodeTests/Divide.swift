//
//  Divide.swift
//  LeetCodeTests
//
//  Created by admin on 1/17/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class Divide: XCTestCase {

    class Solution {
        func divide(_ dividend: Int, _ divisor: Int) -> Int {
            if divisor == -1 && dividend == Int32.min {
                return Int(Int32.max)
            }
            
            let isMinus = (dividend < 0 && divisor > 0) || (dividend > 0 && divisor < 0)
            var dividend = dividend > 0 ? dividend : -dividend
            let divisor = divisor > 0 ? divisor : -divisor

            if (divisor == 1) {
               return isMinus ? -dividend : dividend
            }
            
            var i = 0
            while dividend >= divisor {
                var j = 1
                var div = divisor << 1
                while dividend > div {
                    div <<= 1
                    j <<= 1
                }
                dividend -= div >> 1
                i += j
            }
            return isMinus ? -i : i
        }
    }

    func testExample() {
        XCTAssert(Solution().divide(Int(Int32.min), -1) == Int(Int32.max))
        XCTAssert(Solution().divide(12, 1) == 12)
        XCTAssert(Solution().divide(-12, 3) == -4)
    }

}
