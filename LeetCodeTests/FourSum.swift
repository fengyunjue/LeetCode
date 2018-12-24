//
//  FourSum.swift
//  LeetCodeTests
//
//  Created by admin on 12/20/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class FourSum: XCTestCase {

    
    class Solution {
        
        func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
            return nSum(nums, target, N: 4)
        }
        
        func nSum(_ nums: [Int], _ target: Int, N: Int) -> [[Int]] {
            let sortedNums = nums.sorted()
            var results = [[Int]]()
            findNSum(sortedNums, left: 0, right: sortedNums.count - 1, target:target, N: N, result: [Int](), results: &results)
            return results
        }
        
        func findNSum(_ sortedNums: [Int], left: Int, right: Int, target: Int, N: Int, result: [Int], results: inout [[Int]]) {
            if (right - left + 1) < N || N < 2 || target < N * sortedNums[left] || target > sortedNums[right] * N {
                return
            }
            
            if N > 2 {
                for i in left...right {
                    if i == left || sortedNums[i] != sortedNums[i-1] {
                        var result = result
                        result.append(sortedNums[i])
                        findNSum(sortedNums, left: i+1, right: right, target: target-sortedNums[i], N: N-1, result: result, results: &results)
                    }
                }
            } else {
                var left = left
                var right = right
                while left < right {
                    let sum = sortedNums[left] + sortedNums[right]
                    if sum == target {
                        results.append(result + [sortedNums[left], sortedNums[right]])
                        while left < right && sortedNums[left] == sortedNums[left + 1] {
                            left += 1
                        }
                        left += 1
                    } else if sum > target {
                        right -= 1
                    } else {
                        left += 1
                    }
                }
            }
        }
        
        func fourSum1(_ nums: [Int], _ target: Int) -> [[Int]] {
            if nums.count < 4 {
                return []
            }
            var result: [[Int]] = []
            var arr = nums.sorted()
            
            for i in 0..<(arr.count - 3) {
                let first = arr[i]
                if target >= 0 && first > target {
                    break
                }
                if i > 0 && arr[i] == arr[i - 1] {
                    continue
                }
                var secondIndex = i + 1
                while secondIndex < arr.count - 2 {
                    let second = arr[secondIndex]
                    var left = secondIndex + 1
                    var right = arr.count - 1
                    while left < right {
                        let third = arr[left]
                        let four = arr[right]
                        let sum = first + second + third + four
                        if sum == target {
                            result.append([first, second, third, four])
                            while left < right && arr[left] == arr[left + 1] {
                                left += 1
                            }
// 下面注释的代码可以不加，当找到sum == target会移动left，同时上面的代码已经保证了arr[left]不会重复，所以right重复不会出现重复的元组
//                          while left < right && arr[right] == arr[right - 1] {
//                              right -= 1
//                          }
//                          right -= 1
                            left += 1
                        }else if sum < target {
                            left += 1
                        }else{
                            right -= 1
                        }
                    }
                    while secondIndex < arr.count - 3 && arr[secondIndex] == arr[secondIndex + 1] {
                        secondIndex += 1
                    }
                    secondIndex += 1
                }
                
            }
            return result
        }
    }
    func testExample() {
        print(Solution().nSum([-1,0,1,2,-1,-4, 2, 2], 2, N: 2))
        print(Solution().nSum([-1,0,1,2,-1,-4, 2], -1, N: 3))
        print(Solution().nSum([-1,0,1,2,-1,-4, 2], -1, N: 4))
        print(Solution().nSum([-1,0,1,2,-1,-4,0, 2], -1, N: 5))
        XCTAssert(Solution().fourSum([-1,0,1,2,-1,-4], -1) == [[-4,0,1,2],[-1,-1,0,1]])
        XCTAssert(Solution().fourSum([1,-2,-5,-4,-3,3,3,5], -11) == [[-5,-4,-3,1]])
        XCTAssert(Solution().fourSum([0, 0, 0, 0], 0) == [[0, 0, 0, 0]])
        XCTAssert(Solution().fourSum([1, 0, -1, 0, -2, 2], 0) == [[-2, -1, 1, 2], [-2, 0, 0, 2], [-1, 0, 0, 1]])
    }

}
