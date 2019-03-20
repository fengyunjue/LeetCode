//
//  SearchinRotatedSortedArray.swift
//  LeetCodeTests
//
//  Created by admin on 2/13/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class SearchinRotatedSortedArray: XCTestCase {

    class Solution {
        func search(_ nums: [Int], _ target: Int) -> Int {
            var left = 0
            var right = nums.count - 1
            while left <= right {
                // 当前居中的位置
                let mid = (right + left) / 2
                if nums[mid] == target {// 循环执行,知道找到nums[mid] == target,然后返回mid
                    return mid
                }
                // 如果nums[mid] < nums[right]说明,mid->right是有序的
                if nums[mid] < nums[right] {
                    // 如果target在nums[mid]与nums[right]之间,left向右移动至mid+1
                    if nums[mid] < target && target <= nums[right] {
                        left = mid + 1
                    }else {// 否则right向左移动至mid-1
                        right = mid - 1
                    }
                }else{// 否则说明left->mid是有序的
                    // 如果target在nums[left]与nums[right]之间,right向左移动至mid-1
                    if nums[left] <= target && target < nums[mid] {
                        right = mid - 1
                    }else{// 否则left向左移动至mid+1
                        left = mid + 1
                    }
                }
            }
            return -1
        }
    }

    func testExample() {
        XCTAssert(Solution().search([1], 0) == -1)
        XCTAssert(Solution().search([4,5,6,7,8,10,1,2], 10) == 5)
        XCTAssert(Solution().search([4,5,6,7,0,1,2], 0) == 4)
        XCTAssert(Solution().search([4,5,6,7,0,1,2], 3) == -1)
    }

}
