//
//  StringToInteger.swift
//  LeetCodeTests
//
//  Created by admin on 11/23/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class StringToInteger: XCTestCase {

    class Solution {
        func myAtoi(_ str: String) -> Int {
            var num: Int? = nil
            var isMinus: Bool? = nil
            
            for a in str {
                let s = String(a)
                if num == nil && isMinus == nil && (s == " " || s == "-" || s == "+"){
                    if s == "-" || s == "+" {
                        isMinus = s == "-"
                    }
                    continue
                }
                if let i = Int(s){
                    let ii = (isMinus ?? false) ? i * -1 : i
                    if num == 0 && ii != 0 {
                        num = ii
                        continue
                    }
                    if (num ?? 0) > 214748364 || (num == 214748364 && ii > 7) {
                        return 2147483647
                    }
                    if (num ?? 0) < -214748364 || (num == -214748364 && ii < -8) {
                        return -2147483648
                    }
                    num = (num ?? 0) * 10 + ii
                }else{
                    break
                }
            }
            return num ?? 0
        }
    }

    func testExample() {
        XCTAssert(Solution().myAtoi("-   234") == 0)
        XCTAssert(Solution().myAtoi("   +1 123") == 1)
        XCTAssert(Solution().myAtoi("+-2") == 0)
        XCTAssert(Solution().myAtoi("42") == 42)
        XCTAssert(Solution().myAtoi("     -42") == -42)
        XCTAssert(Solution().myAtoi("4193 with words") == 4193)
        XCTAssert(Solution().myAtoi("words and 987") == 0)
        XCTAssert(Solution().myAtoi("-91283472332") == -2147483648)
    }


}
