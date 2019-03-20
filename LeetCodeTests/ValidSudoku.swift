//
//  ValidSudoku.swift
//  LeetCodeTests
//
//  Created by admin on 3/20/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class ValidSudoku: XCTestCase {

    class Solution {
        func isValidSudoku(_ board: [[Character]]) -> Bool {
            var rowDict: [Int:[Character:Int]] = [:]
            var columnDict: [Int:[Character:Int]] = [:]
            var boxDict: [Int:[Character:Int]] = [:]
            for i in (0..<9) {
                for j in (0..<9) {
                    let c = board[i][j]
                    if c == "." {
                        continue
                    }
                    if rowDict[i] == nil {
                        rowDict[i] = [:]
                    }
                    if rowDict[i]![c] != nil {
                        return false
                    }else{
                        rowDict[i]![c] = 1
                    }
                    
                    if columnDict[j] == nil {
                        columnDict[j] = [:]
                    }
                    if columnDict[j]![c] != nil {
                        return false
                    }else{
                        columnDict[j]![c] = 1
                    }

                    let bIndex = i / 3 * 3 + j / 3
                    if boxDict[bIndex] == nil {
                        boxDict[bIndex] = [:]
                    }
                    if boxDict[bIndex]![c] != nil {
                        return false
                    }else {
                        boxDict[bIndex]![c] = 1
                    }
                }
            }
            return true
        }
    }

    func testExample() {
        XCTAssert(Solution().isValidSudoku([
            ["5","3", ".", ".","7", ".", ".", ".", "."],
            ["6", ".", ".","1","9","5", ".", ".", "."],
            [ ".","9","8", ".", ".", ".", ".","6", "."],
            ["8", ".", ".", ".","6", ".", ".", ".","3"],
            ["4", ".", ".","8", ".","3", ".", ".","1"],
            ["7", ".", ".", ".","2", ".", ".", ".","6"],
            [ ".","6", ".", ".", ".", ".","9","8", "."],
            [ ".", ".", ".","4","1","9", ".", ".","5"],
            [ ".", ".", ".", ".","8", ".", ".","7","9"]
            ]) == false)
        XCTAssert(Solution().isValidSudoku([
            ["5","3", ".", ".","7", ".", ".", ".", "."],
            ["6", ".", ".","1","9","5", ".", ".", "."],
            [ ".","9","8", ".", ".", ".", ".","6", "."],
            ["8", ".", ".", ".","6", ".", ".", ".","3"],
            ["4", ".", ".","8", ".","3", ".", ".","1"],
            ["7", ".", ".", ".","2", ".", ".", ".","6"],
            [ ".","6", ".", ".", ".", ".","2","8", "."],
            [ ".", ".", ".","4","1","9", ".", ".","5"],
            [ ".", ".", ".", ".","8", ".", ".","7","9"]
            ]) == true)
        XCTAssert(Solution().isValidSudoku([
            ["8","3", ".", ".","7", ".", ".", ".", "."],
            ["6", ".", ".","1","9","5", ".", ".", "."],
            [ ".","9","8", ".", ".", ".", ".","6", "."],
            ["8", ".", ".", ".","6", ".", ".", ".","3"],
            ["4", ".", ".","8", ".","3", ".", ".","1"],
            ["7", ".", ".", ".","2", ".", ".", ".","6"],
            [ ".","6", ".", ".", ".", ".","2","8", "."],
            [ ".", ".", ".","4","1","9", ".", ".","5"],
            [ ".", ".", ".", ".","8", ".", ".","7","9"]
            ]) == false)
    }

}
