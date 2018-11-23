//
//  LongestPalindromicSubstring.swift
//  LeetCodeTests
//
//  Created by admin on 11/9/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class LongestPalindromicSubstring: XCTestCase {
    class Solution {
        func longestPalindrome(_ s: String) -> String {
            if s.count <= 1 {
                return s
            }
            
            // 1.间隔之间先插入#
            var S = ["#"]
            for character in s {
                S.append(String(character))
                S.append("#")
            }
            
            // 2.遍历找出以每个节点作为轴最长半径
            var maxId:Int = 0
            var max:Int = 0
            var P:[Int] = [1]
            var maxLength:Int = 1
            var maxLengthIndex = 0
            
            for i in 1...S.count - 1 {
                // j是相对于maxId的i的左边的对称点
                let j:Int = maxId - (i - maxId)
                
                if max > i && j >= 0 {
                    // 优化部分,请见文章
                    P.append(min(P[j], max - i))
                }else{
                    P.append(1)
                }
                // 循环判断以i位置为中心的左右两侧是否相同,相同加1
                while i + P[i] <= S.count - 1 && i - P[i] >= 0 && S[i + P[i]] == S[i - P[i]]{
                    P[i] += 1
                }
                
                if i + P[i] - 1 > max {
                    // 以i为中心的子回文的最后一个元素的位置
                    max = i + P[i] - 1
                    // 记录i为回文子串的中心id
                    maxId = i
                }
                
                // 判断最长回文的长度,并记录
                if P[i] > maxLength {
                    maxLength = P[i]
                    maxLengthIndex = i
                }
            }
            let leftIndex = s.index(s.startIndex, offsetBy: (maxLengthIndex - (maxLength - 1))/2)
            let rightIndex = s.index(leftIndex, offsetBy:maxLength - 1 - 1)
            return String(s[leftIndex...rightIndex])
        }
    }

    func testExample() {
        XCTAssert(Solution().longestPalindrome("12212321") == "12321")
        XCTAssert(Solution().longestPalindrome("bhpyyphvlrrlpl") == "hpyyph")

        XCTAssert(Solution().longestPalindrome("abadd") == "aba")
        XCTAssert(Solution().longestPalindrome("aaaa") == "aaaa")
        XCTAssert(Solution().longestPalindrome("baaaac") == "aaaa")
        XCTAssert(Solution().longestPalindrome("bb") == "bb")
        XCTAssert(Solution().longestPalindrome("ccc") == "ccc")
        XCTAssert(Solution().longestPalindrome("abacab") == "bacab")
        XCTAssert(Solution().longestPalindrome("abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa") == "abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa")
        XCTAssert(Solution().longestPalindrome("abcda") == "a")
        XCTAssert(Solution().longestPalindrome("abcba") == "abcba")
        XCTAssert(Solution().longestPalindrome("abccba") == "abccba")
        XCTAssert(Solution().longestPalindrome("babad") == "aba" || Solution().longestPalindrome("babad") == "bab")
        XCTAssert(Solution().longestPalindrome("a") == "a")
        XCTAssert(Solution().longestPalindrome("cbbd") == "bb")
    }


}
