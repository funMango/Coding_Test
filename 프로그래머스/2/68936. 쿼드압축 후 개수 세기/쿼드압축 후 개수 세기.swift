import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    let result: Count = count(0, 0, arr.count, arr)
    return [result.zero, result.one]
}

func count(_ offsetX: Int, _ offsetY: Int, _ size: Int, _ arr: [[Int]]) -> Count {    
    let h = size / 2
    
    if size == 1 || check(offsetX, offsetY, size, arr) {           
        return getCount(offsetX, offsetY, arr)
    }
        
    return count(offsetX, offsetY, h, arr)
            .add(count(offsetX + h, offsetY, h, arr))
            .add(count(offsetX, offsetY + h, h, arr))
            .add(count(offsetX + h, offsetY + h, h, arr))            
}

func check(_ offsetX: Int, _ offsetY: Int, _ size: Int, _ arr: [[Int]]) -> Bool {
    var last = arr[offsetY][offsetX]
    
    for y in (offsetY..<offsetY + size) {
        for x in (offsetX..<offsetX + size) {
            if arr[y][x] != last { return false }        
        }
    }
    return true
}

func getCount(_ offsetX: Int, _ offsetY: Int, _ arr: [[Int]]) -> Count {
    if arr[offsetY][offsetX] == 0 {             
        return Count(1,0)
    } else {                        
        return Count(0,1)
    }        
}

class Count {
    var zero = 0, one = 0
    
    init (_ zero: Int, _ one: Int) {
        self.zero = zero
        self.one = one
    }    
    
    func add(_ other: Count) -> Count {
        return Count(self.zero + other.zero, self.one + other.one)
    }
}

