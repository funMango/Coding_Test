//
//  main.swift
//  Repeat_binary_transformation
//
//  Created by 이민호 on 10/2/23.
//
import Foundation

func solution(_ s:String) -> [Int] {
    var zeroCnt = 0
    var count = 0
    var number = s
    while number != "1" {
        let token = removeZero(number)
        zeroCnt += number.count - token.count
        number = change(token.count)
        count += 1
    }

    return [count, zeroCnt]
}

func removeZero(_ s:String) -> String {
    let str = s.map { String($0) }.filter { $0 != "0" }.joined(separator:"")
    return str
}

func change(_ num: Int) -> String {
    var result = ""
    var number = num
    while number > 0 {
        let remain = number % 2
        number /= 2
        result = "\(remain)" + result
    }
    return result
}
