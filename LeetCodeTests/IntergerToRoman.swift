//
//  IntergerToRoman.swift
//  LeetCodeTests
//
//  Created by admin on 12/11/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class IntergerToRoman: XCTestCase {

    class Solution {
        func intToRoman(_ num: Int) -> String {
            var str = ""
            var n = num
            while n > 0 {
                if n >= 1000 {
                    str += "M"
                    n -= 1000
                }else if n >= 900 {
                    str += "CM"
                    n -= 900
                }else if n >= 500 {
                    str += "D"
                    n -= 500
                }else if n >= 400 {
                    str += "CD"
                    n -= 400
                }else if n >= 100 {
                    str += "C"
                    n -= 100
                }else if n >= 90 {
                    str += "XC"
                    n -= 90
                }else if n >= 50 {
                    str += "L"
                    n -= 50
                }else if n >= 40 {
                    str += "XL"
                    n -= 40
                }else if n >= 10 {
                    str += "X"
                    n -= 10
                }else if n >= 9 {
                    str += "IX"
                    n -= 9
                }else if n >= 5 {
                    str += "V"
                    n -= 5
                }else if n >= 4 {
                    str += "IV"
                    n -= 4
                }else if n >= 1 {
                    str += "I"
                    n -= 1
                }
            }
            return str
        }
        
        func intToRoman1(_ num: Int) -> String {
            var str = ""
            var n = num
            let nums = [1000,900,500,400,100,90,50,40,10,9,5,4,1]
            let romans = ["M","CM","D","CD","C","XC","L","XL","X","IX","V","IV","I"]
            
            var i = 0
            while n > 0 {
                while n >= nums[i] {
                    str += romans[i]
                    n -= nums[i]
                }
                i += 1
            }
            return str
        }
    }

    func testExample() {
        XCTAssert(Solution().intToRoman(3) == "III")
        XCTAssert(Solution().intToRoman(4) == "IV")
        XCTAssert(Solution().intToRoman(9) == "IX")
        XCTAssert(Solution().intToRoman(58) == "LVIII")
        XCTAssert(Solution().intToRoman(1994) == "MCMXCIV")
    }



}
