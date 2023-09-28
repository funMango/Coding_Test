//
//  main.swift
//  Triangle_Snails
//
//  Created by 이민호 on 2023/09/28.
//

import Foundation

let n = 4


print(solution(n))

func solution(_ n: Int) -> [Int] {
    var arr = Array(repeating: Array(repeating: 0, count: n), count: n)
    let dx = [0, 1, -1]
    let dy = [1, 0, -1]
    let lastV = (1...n).reduce(0, +)
    
    var v = 1
    var x = 0
    var y = 0
    var i = 0
    
    while true {
        if v > lastV { break }
        
        arr[y][x] = v
        v += 1
        
        
        var nx = x + dx[i]
        var ny = y + dy[i]
        
        if nx == -1 || nx == arr[0].count || ny == -1 || ny == arr.count || arr[ny][nx] != 0 {
            i = (i + 1) % 3
            nx = x + dx[i]
            ny = y + dy[i]
        }
        x = nx
        y = ny
    }
    
    
    return arr.flatMap { $0 }.filter { $0 != 0 }
}

