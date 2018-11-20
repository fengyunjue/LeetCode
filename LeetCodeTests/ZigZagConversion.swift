//
//  ZigZagConversion.swift
//  LeetCodeTests
//
//  Created by admin on 11/20/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class ZigZagConversion: XCTestCase {

    class Solution {
        func convert(_ s: String, _ numRows: Int) -> String {
            if numRows <= 1 {
                return s
            }
            var strs:[String] = []
            for _ in 0..<numRows {
                strs.append("")
            }
            var row = 0
            var isAsc = true
            for character in s {
                strs[row].append(character)

                row += isAsc ? 1 : -1

                if row == numRows - 1 || row == 0 {
                    isAsc = !isAsc
                }
            }
            return strs.joined()
        }
        
        func convert1(_ s: String, _ numRows: Int) -> String {
            if numRows <= 1 {
                return s
            }
            
            var ret = ""
            let cycleLen = 2 * numRows - 2
            let n = s.count
            let strs = Array(s)
            
            for i in 0..<numRows {
                for j in stride(from: 0, to: n, by: cycleLen) where i + j < n{
                    ret.append(strs[j + i])
                    if i != 0 && i != numRows - 1 && j + cycleLen - i < n {
                        ret.append(strs[j + cycleLen - i])
                    }
                }
            }
            return ret
        }
    }
    
    func testExample() {
        XCTAssert(Solution().convert("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
        XCTAssert(Solution().convert("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
        XCTAssert(Solution().convert1("PAYPALISHIRING", 3) == "PAHNAPLSIIGYIR")
        XCTAssert(Solution().convert1("PAYPALISHIRING", 4) == "PINALSIGYAHRPI")
    }

}
