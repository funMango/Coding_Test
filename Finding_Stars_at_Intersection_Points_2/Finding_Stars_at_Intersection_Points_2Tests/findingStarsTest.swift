//
//  findingStarsTest.swift
//  Finding_Stars_at_Intersection_Points_2Tests
//
//  Created by 이민호 on 2023/09/27.
//

import XCTest
@testable import Finding_Stars_at_Intersection_Points_2

final class findingStarsTest: XCTestCase {
    func testFindingStars() {
        let test = FindingStars()
        let inputs = [
            (
                [[2, -1, 4], [-2, -1, 4], [0, -1, 1], [5, -8, -12], [5, 8, 12]],
                ["....*....", ".........", ".........", "*.......*", ".........", ".........", ".........", ".........", "*.......*"]
            ),
            (
                [[0, 1, -1], [1, 0, -1], [1, 0, 1]],
                ["*.*"]
            ),
            (
                [[1, -1, 0], [2, -1, 0]],
                ["*"]
            ),
            (
                [[1, -1, 0], [2, -1, 0], [4, -1, 0]],
                ["*"]
            )
        ]
        
        for input in inputs {
            let line = input.0
            let expected = input.1
            XCTAssertEqual(test.solution(line), expected)
        }
        
    }

}
