//
//  NextPermutation.swift
//  LeetCodeTests
//
//  Created by admin on 1/23/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class NextPermutation: XCTestCase {

    class Solution {
        func nextPermutation(_ nums: inout [Int]) {
            var j = nums.count
            for i in stride(from: nums.count-2, through: 0, by: -1) {
                if nums[i+1] > nums[i] {
                    for k in stride(from: nums.count-1, to: i, by: -1) {
                        j = k
                        if nums[k] > nums[i] {
                            break
                        }
                    }
                    nums.swapAt(i, j)
                    nums[i+1..<nums.count].sort()
                    return
                }
            }
            nums.sort()
        }
    }

    func testExample() {
        var l1 = [1,2,7,4,3,1]
        Solution().nextPermutation(&l1)//[1, 3, 1, 2, 4, 7]
        var l2 = [3,2,1]
        Solution().nextPermutation(&l2)//[1, 2, 3]
        var l3 = [1,1,5]
        Solution().nextPermutation(&l3)//[1, 5, 1]
        var l4 = [1,2,3]
        Solution().nextPermutation(&l4)//[1, 3, 2]
        print(l1,l2,l3,l4)
    }

}
