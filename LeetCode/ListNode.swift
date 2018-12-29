//
//  ListNode.swift
//  LeetCode
//
//  Created by admin on 12/28/18.
//  Copyright © 2018 kf5. All rights reserved.
//

import Foundation

public class ListNode : CustomStringConvertible{
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public var description: String {
        var str = "\(val)"
        var next = self
        while next.next != nil{
            str += "->\(next.next!.val)"
            next = next.next!
        }
        return str
    }
}
