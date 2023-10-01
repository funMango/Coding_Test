//
//  main.swift
//  Caesar_code
//
//  Created by 이민호 on 2023/10/01.
//

import Foundation

func solution(_ s:String, _ n:Int) -> String {
    return s.compactMap {
        let ascii = Int($0.utf8.first!)
        if ascii >= 97 && ascii <= 122 {
            let num = ascii + n > 122 ? (ascii + n) % 123 + 97 : ascii + n
            return String(UnicodeScalar(num)!)
        } else if ascii >= 65 && ascii <= 90 {
            let num = ascii + n > 90 ? (ascii + n) % 91 + 65 : ascii + n
            return String(UnicodeScalar(num)!)
        } else {
            return String(UnicodeScalar(ascii)!)
        }
    }.joined(separator:"")
}

func solution2(_ s:String, _ n:Int) -> String {
    let alphabets = "abcdefghijklmnopqrstuvwxyz".map { $0 }
    return String(s.map {
        guard let index = alphabets.firstIndex(of: Character($0.lowercased())) else { return $0 }
        let letter = alphabets[(index + n) % alphabets.count]
        return $0.isUppercase ? Character(letter.uppercased()) : letter
    })
}
