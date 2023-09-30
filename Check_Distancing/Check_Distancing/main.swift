//
//  main.swift
//  Check_Distancing
//
//  Created by 이민호 on 2023/09/28.
//

import Foundation

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]



let places = [["POOOP", "OXXOX", "OPXPX", "OOXOX", "POXXP"], ["POOPX", "OXPXP", "PXXXO", "OXXXO", "OOOPP"], ["PXOPX", "OXOXP", "OXPOX", "OXXOP", "PXPOX"], ["OOOXX", "XOOOX", "OOOXX", "OXOOX", "OOOOO"], ["PXPXP", "XPXPX", "PXPXP", "XPXPX", "PXPXP"]]

print(solution(places))

func solution(_ places:[[String]]) -> [Int] {
    var result: [Int] = []
    for place in places {
        if isDistancing(place) {
            result.append(1)
        } else {
            result.append(0)
        }
    }
    return result
}

func isDistancing(_ place: [String]) -> Bool {
    let p = place.map { string in return string.map { String($0) } }
    let row = p.count - 1
    let col = p[0].count - 1
    
    for y in 0...row {
        for x in 0...col {
            if p[y][x] == "P" && !isDistancing(p, x, y){
                return false
            }
        }
    }
    
    return true
}
    
func isDistancing(_ p: [[String]], _ x: Int, _ y:Int) -> Bool {
    for i in 0...3 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx >= 0 && nx < 5 && ny >= 0 && ny < 5 {
            if p[ny][nx] == "P" { return false}
            else if p[ny][nx] == "O" {
                if !isDistanced(p, nx, ny) { return false }
            }
        }
    }
    
    return true
}

func isDistanced(_ p: [[String]], _ x: Int, _ y:Int) -> Bool {
    var count = 0
    for i in 0...3 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx >= 0 && nx < 5 && ny >= 0 && ny < 5 {
            if p[ny][nx] == "P" { count += 1 }
        }
    }
    
    return count < 2
}
    

