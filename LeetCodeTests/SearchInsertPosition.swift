//
//  SearchInsertPosition.swift
//  LeetCodeTests
//
//  Created by admin on 3/20/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class SearchInsertPosition: XCTestCase {

    class Solution {

        func searchInsert(_ nums: [Int], _ target: Int) -> Int {
            for (index, n) in nums.enumerated() {
                if n >= target {
                    return index
                }
            }
            return nums.count
        }
        func searchInsert1(_ nums: [Int], _ target: Int) -> Int {
            var low = 0
            var high = nums.count
            var mid = 0
            
            while low < high {
                mid = (high + low) / 2
                if nums[mid] > target {
                    high = mid
                }else if nums[mid] < target {
                    low = mid + 1
                }else{
                    return mid
                }
            }
            return low
        }
    }

    func testExample() {
        XCTAssert(Solution().searchInsert([1,3,5,6], 5) == 2)
        XCTAssert(Solution().searchInsert([1,3,5,6], 2) == 1)
        XCTAssert(Solution().searchInsert([1,3,5,6], 7) == 4)
        XCTAssert(Solution().searchInsert([1,3,5,6], 0) == 0)
    }
    func testExample1() {
        XCTAssert(Solution().searchInsert1([1,3,5,6], 5) == 2)
        XCTAssert(Solution().searchInsert1([1,3,5,6], 2) == 1)
        XCTAssert(Solution().searchInsert1([1,3,5,6], 7) == 4)
        XCTAssert(Solution().searchInsert1([1,3,5,6], 0) == 0)
    }
}
