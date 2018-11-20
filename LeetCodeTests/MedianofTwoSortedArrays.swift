//
//  MedianofTwoSortedArrays.swift
//  LeetCodeTests
//
//  Created by admin on 11/8/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest
class MedianofTwoSortedArrays: XCTestCase {


    class Solution {
        func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
            var A = nums1
            var B = nums2
            if nums1.count > nums2.count {// 判断nums1和nums2的数量,将数量少的赋值给A,之后会遍历A
                A = nums2
                B = nums1
            }
            let m = A.count
            let n = B.count
            if n == 0 {// 如果n==0,由于m<n,则m也等于0,所以返回0
                return 0
            }
            
            var imin = 0
            var imax = m
            // 获取中位数所在的位置,考虑到奇数的原因,所以加1
            let half_len = (m + n + 1) / 2
            
            while imin <= imax {
                // 从A的中间位置截取A1和A2
                let i = (imin + imax) / 2
                // 中位数的位置减去i,得到B中间位置截取B1和B2,这样可以保证条件一,(A1+B1).count == (A2+B2).count
                let j = half_len - i
                // 此时A[i-1] == A1.last; A[i] == A2.first; B[j-1] == B1.last; B[j] == B2.first
                // 此时可以看出一定成立的条件A1.last<=A2.first, B1.last<=B2.first
                // 要想满足A1+B1中的值总小于等于A2+B2中的值,还需要满足A1.last <= B2.first和B1.last <= A2.first
                // 如果B1.last > A2.first, 则A中的i向右移动
                if i < m && B[j-1] > A[i] {// i<m保证A[i]存在
                    imin = i + 1
                }else if i > 0 && A[i-1] > B[j] {// 如果A1.last > B2.first,则A中的i向左移动
                    imax = i - 1
                }else{// 满足了条件2, 获取A1+B1中最大的值(max_of_left),获取A2+B2中最小的值(min_of_right)
                    
                    // 获取max_of_left
                    var max_of_left = 0
                    if i == 0 {// 如果i==0,说明A1为空,左边的最大值为B1.last
                        max_of_left = B[j-1]
                    }else if j == 0 {// t如果j==0,说明B1为空,左边的最大值为A1.last
                        max_of_left = A[i-1]
                    }else{// 取左边的最大值
                        max_of_left = max(A[i-1], B[j-1])
                    }
                    
                    if (m + n) % 2 == 1{// 如果(A+B).count是奇数,则没有max_of_left就是中位数
                        return Double(max_of_left)
                    }
                    // 获取min_of_right
                    var min_of_right = 0
                    if i == m {// 如果i==m,说明A2为空,右边的最小值为B2.first
                        min_of_right = B[j]
                    }else if j == n {// 如果j==n,说明B2为空,右边的最小值为A2.first
                        min_of_right = A[i]
                    }else{// 取右边的最小值
                        min_of_right = min(A[i], B[j])
                    }
                    // 左边的最大值和右边的最小值,组成最中间的两个数,除以2得到中位数
                    return Double((max_of_left + min_of_right)) / 2.0
                }
            }
            return 0
        }
    }
    
    func testExample() {
        XCTAssert(Solution().findMedianSortedArrays([1,3], [2]) == 2.0)
        XCTAssert(Solution().findMedianSortedArrays([1,2], [3,4]) == 2.5)
    }



}
