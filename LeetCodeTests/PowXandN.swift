//
//  PowXandN.swift
//  LeetCodeTests
//
//  Created by admin on 12/14/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class PowXandN: XCTestCase {

    class Solution {
        func myPow(_ x: Double, _ n: Int) -> Double {
            if x == 1 || n == 0 { return 1 }
            if n == 1 { return x }
            if n < 0 { return 1 / myPow(x, -n) }
            return (n % 2 == 1 ? x : 1.0) * myPow(x * x, n/2)
        }
        func myPow1(_ x: Double, _ n: Int) -> Double {
            let num = myPow(x, n)
            print(x, n, num)
            return num
        }
    }

    func testExample() {
        
        XCTAssert(Solution().myPow1(2.00000, -2147483648) == 0.0)
        XCTAssert(Solution().myPow1(0.000001, 2147483647) == 0.0)
        XCTAssert(Solution().myPow1(2.00000, 10) == 1024.00000)
        XCTAssert(Solution().myPow1(2.10000, 3) - 9.26100 < 0.00001)
        XCTAssert(Solution().myPow1(2.00000, -2) == 0.25000)
    }

}
