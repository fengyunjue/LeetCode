//
//  ThreeSum.swift
//  LeetCodeTests
//
//  Created by admin on 12/17/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import XCTest

class ThreeSum: XCTestCase {
    
    class Solution {
        
        func threeSum(_ nums: [Int]) -> [[Int]] {
            var ret = [[Int]]()
            if nums.count<=2 {
                return ret
            }
            
            var arr = nums.sorted()
            
            for i in 0..<arr.count-2 {
                let first = arr[i]
                if first>0 {
                    break
                }
                if i > 0 && arr[i] == arr[i-1] {
                    continue
                }
                var left = i+1
                var right = arr.count-1
                while left<right {
                    let second = arr[left]
                    let third = arr[right]
                    if first+second+third == 0 {
                        ret.append([first, second, third])
                        while left < right && arr[left] == arr[left+1] {
                            left += 1
                        }
                        while left < right && arr[right] == arr[right-1] {
                            right -= 1
                        }
                        left += 1
                        right -= 1
                    } else if first+second+third < 0 {
                        left += 1
                    } else {
                        right -= 1
                    }
                }
            }
            return ret
        }
    }

    func testExample() {
       
        XCTAssert(Solution().threeSum([1,2,-2,-1]) == [])
        
        
        XCTAssert(Solution().threeSum([82597,-9243,62390,83030,-97960,-26521,-61011,83390,-38677,12333,75987,46091,83794,19355,-71037,-6242,-28801,324,1202,-90885,-2989,-95597,-34333,35528,5680,89093,-90606,50360,-29393,-27012,53313,65213,99818,-82405,-41661,-3333,-51952,72135,-1523,26377,74685,96992,92263,15929,5467,-99555,-43348,-41689,-60383,-3990,32165,65265,-72973,-58372,12741,-48568,-46596,72419,-1859,34153,62937,81310,-61823,-96770,-54944,8845,-91184,24208,-29078,31495,65258,14198,85395,70506,-40908,56740,-12228,-40072,32429,93001,68445,-73927,25731,-91859,-24150,10093,-60271,-81683,-18126,51055,48189,-6468,25057,81194,-58628,74042,66158,-14452,-49851,-43667,11092,39189,-17025,-79173,13606,83172,92647,-59741,19343,-26644,-57607,82908,-20655,1637,80060,98994,39331,-31274,-61523,91225,-72953,13211,-75116,-98421,-41571,-69074,99587,39345,42151,-2460,98236,15690,-52507,-95803,-48935,-46492,-45606,-79254,-99851,52533,73486,39948,-7240,71815,-585,-96252,90990,-93815,93340,-71848,58733,-14859,-83082,-75794,-82082,-24871,-15206,91207,-56469,-93618,67131,-8682,75719,87429,-98757,-7535,-24890,-94160,85003,33928,75538,97456,-66424,-60074,-8527,-28697,-22308,2246,-70134,-82319,-10184,87081,-34949,-28645,-47352,-83966,-60418,-15293,-53067,-25921,55172,75064,95859,48049,34311,-86931,-38586,33686,-36714,96922,76713,-22165,-80585,-34503,-44516,39217,-28457,47227,-94036,43457,24626,-87359,26898,-70819,30528,-32397,-69486,84912,-1187,-98986,-32958,4280,-79129,-65604,9344,58964,50584,71128,-55480,24986,15086,-62360,-42977,-49482,-77256,-36895,-74818,20,3063,-49426,28152,-97329,6086,86035,-88743,35241,44249,19927,-10660,89404,24179,-26621,-651]) == [[-40072, 24986, 15086], [-96770, 53313, 43457], [-90606, 1202, 89404], [-28801, -58628, 87429], [-6468, -56469, 62937], [-49851, -20655, 70506], [-7535, -36714, 44249], [-95597, -3990, 99587], [-12228, -87359, 99587], [-95597, -1859, 97456], [-41689, -40908, 82597]])
        XCTAssert(Solution().threeSum([0, 0, 0]) == [[0, 0, 0]])
        XCTAssert(Solution().threeSum([-1, 0, 1, 2, -1, -4]) == [[-1, 0, 1], [-1, -1, 2]])
    }
}


//        func threeSum(_ nums: [Int]) -> [[Int]] {
//            if nums.count < 3 {
//                return []
//            }
//            var positives: [Int] = []
//            var zeros: [Int] = []
//            var minus: [Int] = []
//
//            let nums2 = nums.sorted()
//
//            var positivesDict: [Int: Set<[Int]>] = [:]
//            var minusDict: [Int: Set<[Int]>] = [:]
//
//            for n in nums2 {
//                if n > 0 {
//                    positives.append(n)
//                    var ns: Set<[Int]> = Set()
//                    ns.insert([n])
//                    positivesDict[n] = ns
//                }else if n == 0 {
//                    zeros.append(n)
//                }else{
//                    minus.append(n)
//                    var ns: Set<[Int]> = Set()
//                    ns.insert([n])
//                    minusDict[n] = ns
//                }
//            }
//
//            var result: [[Int]] = []
//
//            let hasZero = zeros.count > 0
//            if zeros.count >= 3 {
//                result.append([0, 0, 0])
//            }
//
//
//
//            for i in 0..<positives.count {
//                let n = positives[i]
//                if i + 1 >= positives.count {
//                    break
//                }
//                for i2 in (i+1)..<positives.count {
//                    let n2 = positives[i2]
//                    if var ns = positivesDict[n+n2] {
//                        ns.insert([n,n2])
//                        positivesDict[n+n2] = ns
//                    }else{
//                        var ns: Set<[Int]> = Set()
//                        ns.insert([n,n2])
//                        positivesDict[n+n2] = ns
//                    }
//                }
//            }
//
//
//            for i in 0..<minus.count {
//                let n = minus[i]
//                if i + 1 >= minus.count {
//                    break
//                }
//                for i2 in (i+1)..<minus.count {
//                    let n2 = minus[i2]
//                    if var ns = minusDict[n+n2] {
//                        ns.insert([n,n2])
//                        minusDict[n+n2] = ns
//                    }else{
//                        var ns: Set<[Int]> = Set()
//                        ns.insert([n,n2])
//                        minusDict[n+n2] = ns
//                    }
//                }
//            }
//
//
//            for key in positivesDict.keys {
//                let value = positivesDict[key]!
//                if minus.contains(key * -1) {
//                    for v in value {
//                        if v.count == 1 {
//                            if hasZero {
//                                let ns = [key * -1, 0, key]
//                                if !result.contains(ns) {
//                                    result.append(ns)
//                                }
//                            }
//                        }else{
//                            var ns = v
//                            ns.insert(key * -1, at: 0)
//                            if !result.contains(ns) {
//                                result.append(ns)
//                            }
//                        }
//                    }
//                }
//            }
//
//            for key in minusDict.keys {
//                let value = minusDict[key]!
//                if positives.contains(key * -1) {
//                    for v in value {
//                        if v.count == 1 {
//                            if hasZero {
//                                let ns = [key, 0, key * -1]
//                                if !result.contains(ns) {
//                                    result.append(ns)
//                                }
//                            }
//                        }else{
//                            var ns = v
//                            ns.append(key * -1)
//                            if !result.contains(ns) {
//                                result.append(ns)
//                            }
//                        }
//                    }
//                }
//            }
//            print(result)
//            return result
//        }
