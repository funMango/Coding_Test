//
//  executeTest.swift
//  Triangular_snailTests
//
//  Created by 이민호 on 2023/09/28.
//

import XCTest
@testable import Triangular_snail

final class executeTest: XCTestCase {
    let test = Execute()
    
    func testGetArray() {
        let expected: [[Int?]] = [[nil,nil,nil,nil],[nil,nil,nil,nil],[nil,nil,nil,nil],[nil,nil,nil,nil]]
        XCTAssertEqual(test.getArray(4), expected)
    }
    
    func testRecursion() {
        let expected: [[Int?]] = [[1, nil, nil, nil], [2, 9, nil,nil], [3, 10, 8, nil], [4, 5, 6, 7]]
        let arr = test.getArray(4)
        var result = recursion(1, 0, 0, getLast(4), 0, arr)
        print(result)        
    }
    
    func recursion(_ number: Int, _ x: Int, _ y: Int, _ last: Int, _ idx: Int, _ arr: [[Int?]]) -> [[Int?]] {
        var copy = arr
        let dx = [0, 1, -1]
        let dy = [1, 0, -1]
        
        if number > last { return arr }
        copy[y][x] = number
        
        let Dx = x + dx[idx]
        let Dy = y + dy[idx]
        
        if Dx >= 0 && Dx < arr[0].count && Dy >= 0 && Dy < arr.count {
            recursion(number + 1, Dx, Dy, last, idx, copy)
        } else {
            let newIdx = (idx + 1) % 3
            let Nx = x + dx[newIdx]
            let Ny = y + dy[newIdx]
            recursion(number + 1, Nx, Ny, last, newIdx, copy)
        }
        return copy
    }
    
    func getLast(_ num: Int) -> Int {
        var sum = 0
        for i in 1...num {
            sum += i
        }
        return sum
    }
}
