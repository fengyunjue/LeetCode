//
//  RomanToInteger.swift
//  LeetCodeTests
//
//  Created by admin on 12/11/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class RomanToInteger: XCTestCase {

    class Solution {
        func romanToInt(_ s: String) -> Int {
            var str = s
            var num = 0
            
            let nums = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
            let romans = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
            var i = 0
            while str.count > 0 {
                let roman = romans[i]
                while str.hasPrefix(roman) {
                    str.remove(at: str.startIndex)
                    if roman.count == 2 {
                        str.remove(at: str.startIndex)
                    }
                    num += nums[i]
                }
                i += 1
            }
            return num
        }
    }

    func testExample() {
        XCTAssert(Solution().romanToInt("III") == 3)
        XCTAssert(Solution().romanToInt("IV") == 4)
        XCTAssert(Solution().romanToInt("IX") == 9)
        XCTAssert(Solution().romanToInt("LVIII") == 58)
        XCTAssert(Solution().romanToInt("MCMXCIV") == 1994)
    }
}
