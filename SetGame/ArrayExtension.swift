//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by Hugo Santiago on 20/08/20.
//  Copyright © 2020 Hugo Santiago. All rights reserved.
//

import Foundation

extension Array where Element:Identifiable {
    
    func firstIndex (matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return nil
    }
}

extension Array {
    var only : Element? {
        count == 1 ? first : nil
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}


extension Array where Element:Identifiable{
    func take12() ->[Element] {
        var rst :[Element] = []
        for _ in 0...12 {
            let randomInt = Int.random(in: 0..<count)
            rst.append(self[randomInt])
        }
        return rst
    }
}
