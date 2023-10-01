//
//  main.swift
//  Flip_natural_numbers_into_arrangements
//
//  Created by 이민호 on 2023/10/01.
//

import Foundation

func solution(_ n:Int64) -> [Int] {
    var result: [Int] = []
    var value = n
    
    while value > 0 {
        var rest = value % 10
        value /= 10
        result.append(Int(rest))
    }
    return result
}

func solution2(_ n:Int64) -> [Int] {
    return  "\(n)".compactMap { $0.hexDigitValue }.reversed()
}
