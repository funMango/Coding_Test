//
//  main.swift
//  String_compression
//
//  Created by 이민호 on 10/2/23.
//

import Foundation

func solution(_ s:String) -> Int {
    var min = Int.max
    for size in 1...s.count {
        let tokens = split(s, size)
        let result = compress(tokens)
        if min > result.count { min = result.count }
    }
    return min
}

func compress(_ tokens: [String]) -> String {
    var result = NSMutableString(string: "")
    var last = ""
    var count = 1
    for token in tokens {
        if last == token {
            count += 1
        } else {
            if count > 1 { result.append("\(count)") }
            result.append(last)
            count = 1
            last = token
        }
    }
    
    if count > 1 { result.append("\(count)") }
    result.append(last)
    
    return result as String
}

func split(_ s:String, _ size: Int) -> [String] {
    var tokens: [String] = []
    let strings = s.map { String($0) }
    for start in stride(from: 0, to: s.count, by: size) {
        var end = start + size-1
        if end > strings.count-1 {
            end = strings.count-1
        }
        tokens.append(strings[start...end].joined(separator: ""))
    }
    return tokens
}
