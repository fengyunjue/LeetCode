//
//  IsValid.swift
//  LeetCodeTests
//
//  Created by admin on 12/24/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class IsValid: XCTestCase {

    class Solution {
        func isValid(_ s: String) -> Bool {
            if s.count == 0 {
                return true
            }
            var arr: [Character] = []
            for a in s {
                if a == ")" {
                    if arr.popLast() != "(" {
                        return false
                    }
                }else if a == "]" {
                    if arr.popLast() != "[" {
                        return false
                    }
                }else if a == "}" {
                    if arr.popLast() != "{" {
                        return false
                    }
                }else{
                    arr.append(a)
                }
            }
            return arr.count == 0
        }
    }

    func testExample() {
        XCTAssert(Solution().isValid("()") == true)
        XCTAssert(Solution().isValid("()[]{}") == true)
        XCTAssert(Solution().isValid("(]") == false)
        XCTAssert(Solution().isValid("([)]") == false)
        XCTAssert(Solution().isValid("{[]}") == true)
    }

}
