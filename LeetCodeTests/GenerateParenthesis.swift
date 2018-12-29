//
//  GenerateParenthesis.swift
//  LeetCodeTests
//
//  Created by admin on 12/27/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class GenerateParenthesis: XCTestCase {

    class Solution {
        
        func generateParenthesis(_ n: Int) -> [String] {
            var result = [String]()
            generate(n: n, open: 0, close: 0, str: "", result: &result)
            return result
        }
        func generate(n: Int, open: Int, close: Int, str: String, result: inout [String]) {
            if open == n && close == n {
                result.append(str)
                return
            }
            if open < n {
                generate(n: n, open: open + 1, close: close, str: str + "(", result: &result)
            }
            if close < open {
                generate(n: n, open: open, close: close + 1, str: str + ")", result: &result)
            }
        }
    }

    func testExample() {
//        ["((()))", "(()())", "(())()", "()(())", "()()()"]
        print(Solution().generateParenthesis(3))
    }

}
