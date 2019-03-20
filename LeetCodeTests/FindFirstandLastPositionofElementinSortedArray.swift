//
//  FindFirstandLastPositionofElementinSortedArray.swift
//  LeetCodeTests
//
//  Created by admin on 3/14/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class FindFirstandLastPositionofElementinSortedArray: XCTestCase {

    class Solution {
        func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
            var left = 0
            var right = nums.count - 1
            var index = -1
            while left <= right && index == -1 {
                // 当前居中的位置
                let mid = (right + left) / 2
                if nums[mid] == target {// 循环执行,知道找到nums[mid] == target,然后返回mid
                    index = mid
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
            
            var leftIndex = index
            var rightIndex = index
            for _ in nums {
                // index的左边是否等于target
                let hasLeft = leftIndex - 1 > -1 && nums[leftIndex - 1] == target
                // index的右边是否等于target
                let hasRight = rightIndex + 1 < nums.count && nums[rightIndex + 1] == target
                
                if  hasLeft {
                    leftIndex -= 1
                }
                if  hasRight {
                    rightIndex += 1
                }
                // 如果左右都没有target,停止遍历
                if !hasLeft && !hasRight {
                    break
                }
            }
            return [leftIndex, rightIndex]
        }
    }
    
    func testExample() {
        XCTAssert(Solution().searchRange([2,2], 2) == [0,1])
        XCTAssert(Solution().searchRange([5,7,7,8,8,10], 8) == [3,4])
        XCTAssert(Solution().searchRange([5,7,7,8,8,10], 6) == [-1,-1])
        XCTAssert(Solution().searchRange([1], 0) == [-1,-1])
        XCTAssert(Solution().searchRange([4,5,6,7,8,10,10,1,2], 10) == [5,6])
        XCTAssert(Solution().searchRange([4,5,6,7,0,0,1,2], 0) == [4,5])
        XCTAssert(Solution().searchRange([4,4,5,6,7,0,1,2], 4) == [0,1])
    }

}
