//
//  solution3.swift
//  Repeat_binary_transformation
//
//  Created by 이민호 on 10/2/23.
//

import Foundation

func solution3(_ s:String) -> [Int] {
    var zeroCnt = 0, binaryCnt = 0
    var copiedS = s
    while copiedS != "1" {
        zeroCnt += copiedS.replacingOccurrences(of: "1", with: "").count
        copiedS = String(copiedS.replacingOccurrences(of: "0", with: "").count, radix: 2)
        binaryCnt += 1
    }

    return [binaryCnt, zeroCnt]
}
