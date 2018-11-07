//
//  TwoSum.swift
//  LeetCodeTests
//
//  Created by admin on 2018/11/7.
//  Copyright © 2018年 kf5. All rights reserved.
//

import XCTest

class TwoSum: XCTestCase {

    class Solution {
        func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
            var numberIndexDict = [Int:Int]()
            
            for (index, num) in nums.enumerated() {
                guard let pairedIndex = numberIndexDict[target - num] else {
                    // 把自身放入hash表
                    numberIndexDict[num] = index
                    continue
                }
                // 配对的数已存在
                return [pairedIndex, index]
            }
            return [-1,-1]
        }
    }

    func testExample() {
        XCTAssert(Solution().twoSum([2,7,11,15], 9) == [0,1])
        XCTAssert(Solution().twoSum([2,7,11,15], 26) == [2,3])
        XCTAssert(Solution().twoSum([2,9,11,15], 11) == [0,1])
    }



}
