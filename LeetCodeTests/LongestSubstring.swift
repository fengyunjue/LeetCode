//
//  LeetCodeTests.swift
//  LeetCodeTests
//
//  Created by admin on 2018/11/7.
//  Copyright © 2018年 kf5. All rights reserved.
//

import XCTest
@testable import LeetCode

class LeetCodeTests: XCTestCase {
    
    class Solution {
        func lengthOfLongestSubstring(_ s: String) -> Int {
            var list:[Character] = []
            var m: Int = 0
            for sub in s {
                m = max(m, list.count) as Int
                if let index = list.firstIndex(of: sub)  {
                    list.removeSubrange(Range.init(NSRange.init(location: 0, length: index + 1))!)
                }
                list.append(sub)
            }
            return max(m, list.count) as Int
        }
    }

    func testExample() {
        XCTAssert(Solution().lengthOfLongestSubstring("dvdf") == 3)
        XCTAssert(Solution().lengthOfLongestSubstring(" ") == 1)
        XCTAssert(Solution().lengthOfLongestSubstring("abcabcbb") == 3)
        XCTAssert(Solution().lengthOfLongestSubstring("bbbbbb") == 1)
        XCTAssert(Solution().lengthOfLongestSubstring("pwwkew") == 3)
    }

}
