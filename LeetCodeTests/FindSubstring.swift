//
//  FindSubstring.swift
//  LeetCodeTests
//
//  Created by admin on 1/18/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class FindSubstring: XCTestCase {

    class Solution {
        func findSubstring(_ s: String, _ words: [String]) -> [Int] {
            if s.isEmpty || words.isEmpty {
                return []
            }
            let wordLength = words[0].count
            var resultARR = [Int]()
            
            
            var m1 = [String: Int]()
            // 将words存入m1中,key为word,value为word在words出现的个数
            for word in words {
                if m1[word] != nil {
                    m1[word]! += 1
                }else {
                    m1[word] = 1
                }
            }
            
            // 遍历wordLength的原因是s的组合方式有wordLength中
            // s="12345678"  wordLength=3
            // 组合一 "123", "456", "78"
            // 组合二 "1", "234", "567", "8"
            // 组合三 "12", "345", "678"
            for i in 0..<wordLength {
                var left = i
                // 记录匹配到的word的总数
                var count = 0
                // 记录匹配到的word各自的数量
                var m2 = [String : Int]()
                // 以i为起点,wordLength为步长,s.count-wordLength+1为终点,遍历
                for j in stride(from: i,to: s.count - wordLength + 1, by: wordLength) {
                    // 取出单词t
                    let t = subString(s, j, wordLength)
                    // 判断t是否在m1中
                    if m1.keys.contains(t) {
                        // t存在在m1中,使用m2记录数量
                        if m2[t] != nil {
                            m2[t]! += 1
                        }else {
                            m2[t] = 1
                        }
                        // 如果m2中t的数量小于等于m1中t的数量说明匹配正确
                        if m2[t]! <= m1[t]! {
                            count += 1
                        }else {// 反之,说明匹配多了,left不符合要求,需要清除之前不符合条件的word
                            while(m2[t]! > m1[t]!) {
                                // 从第left开始往后清理
                                let t1 = subString(s, left, wordLength)
                                m2[t1]! -= 1
                                // 这里的判断是为了区分word重复的情况,当word重复时m2[t1]! == m1[t1]!时,不需要count-1
                                if m2[t1]! < m1[t1]! {
                                    count -= 1
                                }
                                left += wordLength
                            }
                        }
                        // 当count == words.count说明left符合条件,将left添加到最后结果中,并将left向后移动
                        if count == words.count {
                            resultARR.append(left)
                            m2[subString(s, left, wordLength)]! -= 1
                            count -= 1
                            left += wordLength
                        }
                    }else {// 没有找到t,说明匹配中断,需重新处理,并将left向后移动
                        m2.removeAll()
                        count = 0
                        left = j + wordLength
                    }
                }
            }
            return resultARR
        }
        
        func subString(_ s: String, _ loc : Int, _ len : Int) -> String {
            return (s as NSString).substring(with: NSRange(location: loc, length: len))
        }
        
    }
    
    func testExample() {
        print(Solution().findSubstring("wordgoodwordgood", ["word","good"]))
        print(Solution().findSubstring("wordgoodgoodgoodbestword", ["word","good","best","good"]))
        print(Solution().findSubstring("a", []))
        print(Solution().findSubstring("barfoothefoobarman", ["foo","bar"]))
        print(Solution().findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"]))
        XCTAssert(Solution().findSubstring("barfoothefoobarman", ["foo","bar"]) == [0,9])
        XCTAssert(Solution().findSubstring("wordgoodgoodgoodbestword", ["word","good","best","word"]) == [])
    }

}
//func findSubstring1(_ s: String, _ words: [String]) -> [Int] {
//    if words.count == 0 {
//        return []
//    }
//    var dict: [String:Int] = [:]
//    var count: Int! = nil
//    var result: [Int] = []
//    for word in words {
//        if count == nil {
//            count = word.count
//        }else if word.count != count {
//            return result
//        }
//        if dict[word] != nil {
//            dict[word]! += 1
//        }else{
//            dict[word] = 1
//        }
//    }
//
//    for index in 0..<s.count {
//        if isSubstring(s, dict, index, count) {
//            result.append(index)
//        }
//    }
//    return result
//}
//func isSubstring(_ s: String,  _ dict: [String: Int], _ index: Int, _ count: Int) -> Bool {
//    if dict.count == 0 { return true }
//    if index + count * dict.count > s.count { return false }
//    let str = (s as NSString).substring(with: NSRange(location: index, length: count))
//    if let co = dict[str] {
//        var dict = dict
//        dict[str] = co > 1 ? co - 1 : nil
//        return isSubstring(s,dict,index+count,count)
//    }
//    return false
//}
