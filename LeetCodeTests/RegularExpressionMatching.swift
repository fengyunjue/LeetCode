//
//  RegularExpressionMatching.swift
//  LeetCodeTests
//
//  Created by admin on 11/29/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class RegularExpressionMatching: XCTestCase {

    class Solution {
         func isMatch(_ s: String, _ p: String) -> Bool {            
            return isMatchs2(Array(s), Array(p))
        }
        
        func isMatchs2(_ s: [Character], _ p: [Character]) -> Bool {
            if p.count == 0 {
                return s.count == 0
            }
            let m = s.count
            let n = p.count
            var dp: Array<Array<Bool>> = []
            for i in 0...m {
                if i == 0 {
                    dp.append([true])
                }else{
                    dp.append([false])
                }
                for j in 1...n {
                    dp[i].append(false)
                    if (j > 1 && p[j - 1] == "*") {
                        dp[i][j] = dp[i][j - 2] || (i > 0 && (s[i - 1] == p[j - 2] || p[j - 2] == ".") && dp[i - 1][j])
                    } else {
                        dp[i][j] = i > 0 && dp[i - 1][j - 1] && (s[i - 1] == p[j - 1] || p[j - 1] == ".")
                    }
                }
            }
            return dp[m][n]
        }
        
        func isMatchs1(_ ss: [Character], _ pp: [Character]) -> Bool {
            var s = ss
            var p = pp
            if p.isEmpty {
                return s.isEmpty
            }
            if p.count > 1 && p[1] == "*" {
                return isMatchs(s, Array(p[2..<p.count])) || (!s.isEmpty && (s.first == p.first || p.first == Character(".")) && isMatchs(Array(s[1..<s.count]),p))
            }else{
                return !s.isEmpty && (s.first == p.first || p.first == Character(".")) && isMatchs(Array(s[1..<s.count]), Array(p[1..<p.count]))
            }
        }
        
        
        func isMatchs(_ ss: [Character], _ pp: [Character]) -> Bool {
            var s = ss
            var p = pp
            if p.isEmpty {
                return s.isEmpty
            }
            if p.count == 1 {
                return s.count == 1 && (s.first == p.first || p.first == Character("."))
            }
            if p[1] != "*" {
                if s.isEmpty {
                    return false
                }
                return (s.first == p.first || p.first == Character(".")) && isMatchs(Array(s[1..<s.count]), Array(p[1..<p.count]))
            }else{
                while !s.isEmpty && (s.first == p.first || p.first == Character(".")) {
                    if isMatchs(s, Array(p[2..<p.count])) {
                        return true
                    }
                    s.removeFirst()
                }
                return isMatchs(s, Array(p[2..<p.count]))
            }
        }
    }

    func testExample() {
        XCTAssert(Solution().isMatch("a", "") == false)
        XCTAssert(Solution().isMatch("aaaaabaccbbccababa", "a*b*.*c*c*.*.*.*c") == false)
        XCTAssert(Solution().isMatch("bbba", ".*b") == false)
        XCTAssert(Solution().isMatch("", ".") == false)
        XCTAssert(Solution().isMatch("ab", ".*..") == true)
        XCTAssert(Solution().isMatch("a", "ab*") == true)
        XCTAssert(Solution().isMatch("ab", ".*c") == false)
        XCTAssert(Solution().isMatch("a", ".*..a*") == false)
        XCTAssert(Solution().isMatch("aaad", "a.*d") == true)
        XCTAssert(Solution().isMatch("aa", "a") == false)
        XCTAssert(Solution().isMatch("aa", "a*") == true)
        XCTAssert(Solution().isMatch("ab", ".*") == true)
        XCTAssert(Solution().isMatch("aab", "c*a*b") == true)
        XCTAssert(Solution().isMatch("mississippi", "mis*is*ip*.") == true)
    }



}
//        func isMatch(_ s: String, _ p: String) -> Bool {
//
//            let ss = Array(s)
//            var pp = Array(p)
//
//            var sChar: Character? = nil
//            var pChar: Character! = nil
//            let dot = Character(".")
//            let star = Character("*")
//
//            var offSet: Int = -1
//            var maxIndex: Int = -1
//
//            while pp.count > 0 {
//                pChar = pp.removeFirst()
//                var hasStar = false
//                while pp.count > 0 && pp.first == star{
//                    pp.removeFirst()
//                    hasStar = true
//                }
//                var min = offSet
//                var mIndex = maxIndex
//                var find = false
//
//                if pp.count == 0 {
//                    min = maxIndex
//                }
//                while min < maxIndex + 1{// 找不到,继续查找下一个在 (offset,maxIndex)之间的数
//                    min += 1
//                    sChar = ss.count > (min) ? ss[min] : nil
//
//                    if (pChar != dot && !hasStar) {// p == "x"
//                        if sChar == pChar {// 匹配是否相等
//                            if find == false {// 当第一次匹配到时赋值offSet,尽可能少的往前移动
//                                offSet = min
//                            }
//                            mIndex = max(mIndex, min)
//                            find = true
//                        }
//                    }else if (pChar == dot && !hasStar) {// p == "."
//                        if sChar != nil {// sChar不能为空
//                            if find == false {// 当第一次匹配到时赋值offSet,尽可能少的往前移动
//                                offSet = min
//                            }
//                            mIndex = max(mIndex, min)
//                            find = true
//                        }
//                    }else if (pChar != dot && hasStar) {// p == "x*",匹配空和任意多个x, 继续遍历匹配更多
//                        find = true
//                        if sChar == pChar {
//                            var index = min
//                            while ss.count > index + 1 && ss[index + 1] == pChar{
//                                index += 1
//                            }
//                            min = index
//                            mIndex = max(mIndex, min)
//                        }
//                    }else if pChar == dot && hasStar {// p = ".*",匹配任意字符, 继续遍历匹配更多
//                        mIndex = ss.count - 1
//                        find = true
//                    }
//                }
//                maxIndex = mIndex
//                if find == false {
//                    return false
//                }
//            }
//            return maxIndex + 1 == s.count
//        }
