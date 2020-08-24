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

extension Array where Element:Identifiable {
    func serchByElement (gimme: Element) -> Element? {
        for index in 0..<count{
            if self[index].id == gimme.id {
                return self[index]
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
    func takeNElements(n: Int) ->[Element] {
        var rst :[Element] = []
        let arr = (0..<n).map( {_ in Int.random(in: 0..<count)} )
        for value in 0..<arr.count {
            rst.append(self[value])
        }
        return rst
    }
}
