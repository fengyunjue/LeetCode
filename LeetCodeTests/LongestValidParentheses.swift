//
//  LongestValidParentheses.swift
//  LeetCodeTests
//
//  Created by admin on 1/24/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class LongestValidParentheses: XCTestCase {

    class Solution {
        func longestValidParentheses(_ s: String) -> Int {
            var dict = [Int:Int]()
            let chars = Array(s)
            var maxLen = 0
            // 倒序遍历,因为最后一个字符无论是啥后面都没有可以配对的,所以从倒数第二个开始遍历
            for i in stride(from: s.count - 2, to: -1, by: -1) {
                if chars[i] == "(" {
                    // 找到与i对称的位置end, 其中dict[i+1]用于i位置括号里面的有效括号数,需要加上去. 例如s = "(()())()",i==0时,dict[i+1] == 4,此时end == 5
                    let end = i + (dict[i+1] ?? 0) + 1
                    if end < s.count && chars[end] == ")" {
                        // 如果end位置的字符是),则将i位置括号中的有效括号数累加上去.例如s = "(()())()",i==0时,dict[i] == dict[i+1] + 2 == 6
                        dict[i] = (dict[i+1] ?? 0) + 2
                        // 则记录end位置后面的有效括号数,累加上去.例如s = "(()())()",i==0时,此时dict[i]==6,需要加上dict[end+1] == 2,最终dict[i] == dict[0] == 8
                        if end + 1 < s.count {
                            dict[i] = (dict[i] ?? 0) + (dict[end + 1] ?? 0)
                        }
                    }
                    // 记录最长的有效括号数
                    maxLen = max(maxLen, dict[i] ?? 0)
                }
            }
            return maxLen
        }
        func longestValidParentheses1(_ s: String) -> Int {
            var res = [Int]()
            var max = 0
            var start = 0
            var i = 0
            
            for c in s {
                if c == "(" {
                    // 将i添加到res中
                    res.append(i)
                }else {
                    if(res.isEmpty){// 如果c == ")",且res为空,用于处理前面都是")"的情况.例如:s = ")()(((", 当i == 0,此时start == 1
                        start = i + 1
                    }else{// 如果res不为空,则从res中移除一个"("
                        res.removeLast()
                        if(res.isEmpty){// 如果移除后res为空,则当前的有效长度为i-start+1.例如:s = ")()(((", 当i == 2,此时temp == 2 - 1 + 1 == 2
                            let temp =  i - start + 1
                            if(temp > max){
                                max = temp
                            }
                        }else{// 如果res不为空,则当前有效长度为i - res.last!.例如
                            let temp = i - res.last!;
                            if(temp > max){
                                max = temp
                            }
                        }
                    }
                }
                i += 1
            }
            return max
        }
        func longestValidParentheses2(_ s: String) -> Int {
            let chars = Array(s)
            // 直接使用calc(chars: chars, start: 0, flag: 1, end: chars.count, cTem: "(")处理chars正序遍历匹配"(",无法处理像chars="(()"的情况,所以需要再调用calc(chars: chars, start: chars.count - 1, flag: -1, end: -1, cTem: ")")一次,然后取这两次处理的最大值.
            return max(calc(chars: chars, start: 0, flag: 1, end: chars.count, cTem: "("), calc(chars: chars, start: chars.count - 1, flag: -1, end: -1, cTem: ")"))
        }
        func calc(chars: [Character], start: Int, flag: Int, end: Int, cTem: Character) -> Int {
            // 用于记录最大数量
            var max = 0
            // 用于记录cTem和不是cTem抵消后的数量
            var sum = 0
            // 用于记录当前数量
            var currLen = 0
            // 用于记录有效数量
            var validLen = 0
            for i in stride(from: start, to: end, by: flag) {// 遍历i
                sum += chars[i] == cTem ? 1 : -1// 如果chars[i] == cTem,则sum+1否则sum-1
                currLen += 1
                if sum < 0 {// 如果sum小于0,说明需要前面出现括号不配对的情况,需要记录当前的最大值,并重置sum,currLen,validLen.例如chars=")())())",cTem="(",start=0,flag=1,当i==3时,sum==-1,currLen==3,validLen==2,currLen==3,则max==2
                    max = Swift.max(max, validLen)
                    sum = 0
                    currLen = 0
                    validLen = 0
                }else if sum == 0 {// 如果sum等于0,说明前面都是配对的括号,记录validLen的值
                    validLen = currLen
                }
            }
            
            return Swift.max(max, validLen)
        }

    }
    func testExample() {
        XCTAssert(Solution().longestValidParentheses("((((((((((((((") == 0)
        XCTAssert(Solution().longestValidParentheses("(()()())") == 8)
        XCTAssert(Solution().longestValidParentheses(")()())") == 4)
        XCTAssert(Solution().longestValidParentheses("()(()") == 2)
        XCTAssert(Solution().longestValidParentheses("(()") == 2)
        XCTAssert(Solution().longestValidParentheses(")()())((()))") == 6)
    }
    func testExample1() {
        XCTAssert(Solution().longestValidParentheses1("((((((((((((((") == 0)
        XCTAssert(Solution().longestValidParentheses1("(()()())") == 8)
        XCTAssert(Solution().longestValidParentheses1(")()())") == 4)
        XCTAssert(Solution().longestValidParentheses1("()(()") == 2)
        XCTAssert(Solution().longestValidParentheses1("(()") == 2)
        XCTAssert(Solution().longestValidParentheses1(")()())((()))") == 6)
    }
    func testExample2() {
//        XCTAssert(Solution().longestValidParentheses2("((((((((((((((") == 0)
//        XCTAssert(Solution().longestValidParentheses2("(()()())") == 8)
//        XCTAssert(Solution().longestValidParentheses2(")())())") == 2)
//        XCTAssert(Solution().longestValidParentheses2("()(()") == 2)
        XCTAssert(Solution().longestValidParentheses2("(()") == 2)
        XCTAssert(Solution().longestValidParentheses2(")()())((()))") == 6)
    }

}
