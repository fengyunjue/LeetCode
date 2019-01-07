//
//  RemoveElement.swift
//  LeetCodeTests
//
//  Created by admin on 1/3/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class RemoveElement: XCTestCase {

    class Solution {
        func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
            if (nums.count == 0) { return 0 }
            var i = 0
            for j in 0..<nums.count {
                if nums[j] != val{
                    nums[i] = nums[j]
                    i += 1
                }
            }
            return i
        }
    }
    
    func testExample() {
        
        var nums = [3, 2, 2, 3]
        XCTAssert(Solution().removeElement(&nums, 3) == 2)
        
        var nums1 = [0,1,2,2,3,0,4,2]
        XCTAssert(Solution().removeElement(&nums1, 2) == 5)
    }

}
