//
//  Factor.swift
//  Factor
//
//  Created by Pavlo Pedai on 10/12/19.
//  Copyright © 2019 Pavlo Pedai. All rights reserved.
//

import Foundation

//Basic factorisation algoritm implementation https://ru.wikipedia.org/wiki/%D0%9F%D0%B5%D1%80%D0%B5%D0%B1%D0%BE%D1%80_%D0%B4%D0%B5%D0%BB%D0%B8%D1%82%D0%B5%D0%BB%D0%B5%D0%B9

class Factor {
    
    static func factorRegular(value: Int) -> [Int] {
        var factors = [Int]()
        var innerValue = value
        for i in 2...Int(Double(value).squareRoot().rounded(.up)) {
            while innerValue % i == 0 {
                factors.append(i)
                innerValue /= i
            }
        }
        if (innerValue != 1) {
            factors.append(innerValue)
        }

        return factors
    }
    
    static func factorRecursive(value: Int) -> [Int] {
        guard value > 1 else {  return [] }
        for i in 2...Int(Double(value).squareRoot().rounded(.up)) {
            if value % i == 0 {
                return [i] + factorRecursive(value: value / i)
            }
        }
        return [value]
    }
}
