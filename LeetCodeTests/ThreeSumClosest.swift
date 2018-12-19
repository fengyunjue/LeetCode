//
//  ThreeSumClosest.swift
//  LeetCodeTests
//
//  Created by admin on 12/18/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class ThreeSumClosest: XCTestCase {

    class Solution {
        func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
            var result: Int? = nil
            if nums.count < 3 {
                return 0
            }
            let arr = nums.sorted()
            
            for i in 0..<arr.count-2 {
                let first = arr[i]
                if i > 0 && arr[i] == arr[i-1] {
                    continue
                }
                var left = i + 1
                var right = arr.count - 1
                while left < right {
                    let sum = first + arr[left] + arr[right]
                    if result == nil || abs(sum - target) <= abs(result! - target) {
                        result = sum
                    }
                    if sum == target {
                        return result!
                    }else if sum < target {
                        left += 1
                    }else{
                        right -= 1
                    }
                }
            }
            return result ?? 0
        }
    }
    
    func testExample() {
        XCTAssert(Solution().threeSumClosest([1,1,1,0], -100) == 2)
        XCTAssert(Solution().threeSumClosest([-1, 2, 1, -4], 1) == 2)
    }

}
