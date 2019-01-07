//
//  PrisonAfterNDays.swift
//  LeetCodeTests
//
//  Created by admin on 1/3/19.
//  Copyright © 2019 kf5. All rights reserved.
//

import XCTest

class PrisonAfterNDays: XCTestCase {

    class Solution {
        func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
            var N = N
            if N > 14 {
                N = N % 14 == 0 ? 14 : N % 14
            }
            if N == 0 {
                return cells
            }
            var newCells = cells
            var left: Int? = nil
            var right: Int? = nil
            
            for i in 0..<cells.count {
                left = i > 0 ? cells[i-1] : nil
                right = i < cells.count - 1 ? cells[i+1] : nil
                
                if left == right {
                    newCells[i] = 1
                }else{
                    newCells[i] = 0
                }
            }
            return prisonAfterNDays(newCells, N - 1)
        }
        
    }

    func testExample() {
       
        
        let cells =  [1, 0, 0, 1, 0, 0, 0, 1]
        print("result", cells, Solution().prisonAfterNDays(cells, 826))
        
        let cells1 = [1,0,0,1,0,0,1,0]
        print("result", cells1, Solution().prisonAfterNDays(cells1, 1000000000))
        
        
    }


}
