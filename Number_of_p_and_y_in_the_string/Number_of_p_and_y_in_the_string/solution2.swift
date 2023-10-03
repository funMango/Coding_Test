//
//  solution2.swift
//  Number_of_p_and_y_in_the_string
//
//  Created by 이민호 on 10/3/23.
//

import Foundation

func solution2(_ s:String) -> Bool
{
    let string = s.lowercased()
    return string.components(separatedBy: "p").count == string.components(separatedBy: "y").count
}
