//
//  RemoveDuplicates.swift
//  LeetCodeTests
//
//  Created by admin on 1/3/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class RemoveDuplicates: XCTestCase {

    class Solution {
        func removeDuplicates(_ nums: inout [Int]) -> Int {
            if (nums.count == 0) { return 0 }
            var i = 0
            for j in 1..<nums.count {
                if (nums[i] != nums[j]) {
                    i = i + 1
                    nums[i] = nums[j]
                }
            }
            print(nums)
            return (i + 1)
        }
    }
    func testExample() {
        var nums = [1,1,2]
        XCTAssert( Solution().removeDuplicates(&nums) == 2)
        
        var nums1 = [0,0,1,1,1,2,2,3,3,4]
        XCTAssert( Solution().removeDuplicates(&nums1) == 5)
    }


}
