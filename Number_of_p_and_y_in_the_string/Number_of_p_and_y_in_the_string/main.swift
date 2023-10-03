//
//  main.swift
//  Number_of_p_and_y_in_the_string
//
//  Created by 이민호 on 10/3/23.
//

import Foundation

func solution(_ s:String) -> Bool {
    let pCount = s.lowercased().filter { $0 == "p"}.count
    let yCount = s.lowercased().filter { $0 == "y"}.count
    return pCount == yCount
}

