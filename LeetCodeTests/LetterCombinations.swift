//
//  LetterCombinations.swift
//  LeetCodeTests
//
//  Created by admin on 12/19/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class LetterCombinations: XCTestCase {

    class Solution {
        func letterCombinations(_ digits: String) -> [String] {
            if digits.count == 0 {
                return []
            }
            var result: [String] = []
            let letter = ["2" : ["a","b","c"], "3" : ["d","e","f"], "4" : ["g","h","i"], "5" : ["j","k","l"], "6" : ["m","n","o"], "7" : ["p","q","r","s"], "8" : ["t","u","v"], "9" : ["w","x","y","z"]]
            for a in digits {
                let le = letter[String(a)]!
                if result.count == 0 {
                    result = le
                    continue
                }
                let res = result
                result = []
                for l in le {
                    for r in res {
                        result.append(r+l)
                    }
                }
            }
            return result
        }
    }

    func testExample() {
        XCTAssert(Solution().letterCombinations("23") == ["ad", "bd", "cd", "ae", "be", "ce", "af", "bf", "cf"])
    }

}
