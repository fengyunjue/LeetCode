//
//  ReverseInteger.swift
//  LeetCodeTests
//
//  Created by admin on 11/21/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class ReverseInteger: XCTestCase {

    class Solution {
        func reverse(_ x: Int) -> Int {
            var num = x
            
            var rev = 0;
            while num != 0 {
                let pop = num % 10
                num /= 10
                if rev > 214748364 || (rev == 214748364 && pop > 7) {
                    return 0
                }
                if rev < -214748364 || (rev == -214748364 && pop < -8) {
                    return 0
                }
                rev = rev * 10 + pop
            }
            return rev
        }
    }
    func testExample() {
        XCTAssert(Solution().reverse(901000) == 109)
        XCTAssert(Solution().reverse(2147483647) == 0)
        XCTAssert(Solution().reverse(123) == 321)
        XCTAssert(Solution().reverse(-123) == -321)
        XCTAssert(Solution().reverse(120) == 21)
    }


}
