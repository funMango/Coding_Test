//
//  findingStars.swift
//  Finding_Stars_at_Intersection_Points_2
//
//  Created by 이민호 on 2023/09/27.
//

import Foundation

class FindingStars {
    func solution(_ line:[[Int]]) -> [String] {
        let result = run(line)
        return result
    }

    func run(_ line: [[Int]]) -> [String] {
        var points: [pointer] = []
        for i in 0...(line.count - 1) {
            for j in i...(line.count - 1) {
                let point: pointer? = intersection(line[i][0], line[i][1], line[i][2],
                                         line[j][0], line[j][1], line[j][2])
                if let intersection = point {
                    points.append(intersection)
                }
            }
        }

        let minPoint = getMinPoint(points)
        let maxPoint = getMaxPoint(points)
        let width = Int(maxPoint.x - minPoint.x + 1)
        let length = Int(maxPoint.y - minPoint.y + 1)

        var arr = Array(repeating: Array(repeating: ".", count: width), count: length)

        for p in points {
            let x = Int(p.x - minPoint.x)
            let y = Int(maxPoint.y - p.y)
            arr[y][x] = "*"
        }

        let result = arr.map { $0.joined() }
        return result
    }

    class pointer {
        var x : CLong
        var y : CLong

        init(_ x: CLong, _ y: CLong) {
            self.x = x
            self.y = y
        }
    }

    func intersection(_ a1: CLong, _ b1: CLong, _ c1: CLong, _ a2: CLong, _ b2: CLong, _ c2: CLong) -> pointer? {
        let denominator = a1 * b2 - a2 * b1

        guard denominator != 0 else { return nil } // 분모가 0인 경우

        let x = Double(b1 * c2 - b2 * c1) / Double(denominator)
        let y = Double(a2 * c1 - a1 * c2) / Double(denominator)
        let divisor = 1.0

        if x.truncatingRemainder(dividingBy: divisor) != 0.0 || y.truncatingRemainder(dividingBy: divisor) != 0.0 {
            return nil
        }

        return pointer(CLong(x), CLong(y))
    }

    func getMinPoint(_ points: [pointer]) -> pointer {
        var x: CLong = CLong.max
        var y: CLong = CLong.max

        for p in points {
            if p.x < x { x = p.x }
            if p.y < y { y = p.y }
        }

        return pointer(x, y)
    }

    func getMaxPoint(_ points: [pointer]) -> pointer {
        var x: CLong = CLong.min
        var y: CLong = CLong.min

        for p in points {
            if p.x > x { x = p.x }
            if p.y > y { y = p.y }
        }

        return pointer(x, y)
    }
}

