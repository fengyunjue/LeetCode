//
//  StrStr.swift
//  LeetCodeTests
//
//  Created by admin on 1/7/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class StrStr: XCTestCase {

    class Solution {
        func strStr(_ haystack: String, _ needle: String) -> Int {
            let count1 = haystack.count
            let count2 = needle.count
            if count2 == 0 {
                return 0
            }
            
            if count1 < count2 {
                return -1
            }
            
            var haystackChars = haystack.cString(using: .utf8)!
            var needleChars = needle.cString(using: .utf8)!
            var i = 0
            var j = 0
            
            let maxi = count1 - count2
            while i <= maxi && j < count2 {
                var m = i
                while m < count1 && j < count2 {
                    if haystackChars[m] == needleChars[j] {
                        m += 1
                        j += 1
                        continue
                    }
                    j = 0
                    i += 1
                    break
                }
            }
            if j == count2{
                return i
            }
            
            return -1
        }
        
        func strStr1(_ haystack: String, _ needle: String) -> Int {
            let count1 = haystack.count
            let count2 = needle.count
            if count2 == 0 {
                return 0
            }
            
            if count1 < count2 {
                return -1
            }
            
            var haystackChars = haystack.cString(using: .utf8)!
            var needleChars = needle.cString(using: .utf8)!
            
            for i in 0..<haystack.count {
                if i + needle.count <= haystack.count {
                    let strs = haystackChars[i..<(i+needle.count)]
                    var isSame = true
                    var j = 0
                    for s in strs {
                        if s != needleChars[j] {
                            isSame = false
                            break
                        }
                        j += 1
                    }
                    if isSame {
                        return i
                    }
                }else{
                    return -1
                }
            }
            return -1
        }

    }

    func testExample() {
        XCTAssert(Solution().strStr("mississippi", "issip") == 4)
        XCTAssert(Solution().strStr("aaa", "aaaa") == -1)
        XCTAssert(Solution().strStr("a", "a") == 0)
        XCTAssert(Solution().strStr("hello", "ll") == 2)
        XCTAssert(Solution().strStr("aaaaa", "bba") == -1)
    }

}
