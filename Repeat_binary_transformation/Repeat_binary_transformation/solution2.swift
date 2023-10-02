//
//  solution2.swift
//  Repeat_binary_transformation
//
//  Created by 이민호 on 10/2/23.
//

import Foundation

import Foundation

func solution2(_ s:String) -> [Int] {
    var zeroCnt = 0, binaryCnt = 0
    var copyS = s
    while copyS != "1" {
        let number = removeZero(copyS)
        zeroCnt += copyS.count - number
        copyS = String(number, radix:2)
        binaryCnt += 1
    }

    return [binaryCnt, zeroCnt]
}

func removeZero2(_ s:String) -> Int {
    return s.filter { $0 != "0" }.count
}
