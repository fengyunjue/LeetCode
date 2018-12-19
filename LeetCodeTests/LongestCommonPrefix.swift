//
//  LongestCommonPrefix.swift
//  LeetCodeTests
//
//  Created by admin on 12/13/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class LongestCommonPrefix: XCTestCase {


    class Solution {
        func longestCommonPrefix(_ strs: [String]) -> String {
            if strs.count == 0{
                return ""
            }else if strs.count == 1 {
                return strs.first!
            }else{
                var result = ""
                for (index, a) in strs.first!.enumerated() {
                    for str in strs[1..<strs.count] {
                        if index < str.count {
                            if a != str[str.index(str.startIndex, offsetBy: index)] {
                                return result
                            }
                        }else{
                            return result
                        }
                    }
                    result.append(a)
                }
                return result
            }
        }
        func longestCommonPrefix1(_ strs: [String]) -> String {
            if strs.count == 0{
                return ""
            }else if strs.count == 1 {
                return strs.first!
            }else{
                var result = strs[0]
                for i in 1..<strs.count {
                    let str = strs[i]
                    while !str.hasPrefix(result) {
                        result = String(result.prefix(result.count - 1))
                        if result.isEmpty {
                            return ""
                        }
                    }
                }
                return result
            }
        }
    }
    
    func testExample() {
        XCTAssert(Solution().longestCommonPrefix(["c","c"]) == "c")
        XCTAssert(Solution().longestCommonPrefix(["flower","flow","flight"]) == "fl")
        XCTAssert(Solution().longestCommonPrefix(["dog","racecar","car"]) == "")
    }
    
    func test1() {
        XCTAssert(Solution().longestCommonPrefix(["slkdjfajlkdjflkajsdfnjkdfnvjndfjnkjdnvjndfjknvkndfjkvndnvjknsdjknfdjknvsdvnjksdnfvkndfnvjkdnsjvnkjdfjkvdfnvjdsfknvjdfnjvndjf","jifjwieqjfjwefjqwjfiowjfijsafsdfnsjknjknvjknajnjksdnvksndjvnsjdnvjknsajndvjnsadjvnsjnasjknsjkdvnjsn"]) == "")
    }
    func test2() {
        XCTAssert(Solution().longestCommonPrefix1(["slkdjfajlkdjflkajsdfnjkdfnvjndfjnkjdnvjndfjknvkndfjkvndnvjknsdjknfdjknvsdvnjksdnfvkndfnvjkdnsjvnkjdfjkvdfnvjdsfknvjdfnjvndjf","jifjwieqjfjwefjqwjfiowjfijsafsdfnsjknjknvjknajnjksdnvksndjvnsjdnvjknsajndvjnsadjvnsjnasjknsjkdvnjsn"]) == "")
    }

}
