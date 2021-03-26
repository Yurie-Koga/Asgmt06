//
//  RepeatingSequence.swift
//  Graph1
//
//  Created by Uji Saori on 2021-03-25.
//

import Foundation

// input
/*
57 2

*/
// output
// 4

func repeatingSeq() {
    let inputs = readLine()!.split(separator: " ").map { Int(String($0))! }
    let a = inputs[0]
    let p = inputs[1]

    func convertIntToArr(val: Int, ints: inout [Int]) {
        if val < 10 { ints.append(val)}
        else {
            ints.append(val % 10)
            convertIntToArr(val: val / 10, ints: &ints)
        }
    }
    
    func sumOfInts(ints: [Int]) -> Int {
//        var res = 0
//        for i in ints {
//            res += Int(pow(Double(i), Double(p)))
//        }
        return ints.reduce(0) { sum, e in sum + Int(pow(Double(e), Double(p))) }
    }
   
    func isRepeating(repeating: inout Bool, patterns: inout [Int], repeatStIndex: inout Int, arr: [Int], curCheckingIndex: inout Int, e: Int) -> Bool {
        if !arr.contains(e) { return false }
        
        if !repeating || !patterns.contains(e) {
            guard let lastIndex = arr.lastIndex(of: e) else { return false }
            
            if curCheckingIndex == -1 { curCheckingIndex = lastIndex }
            repeating = true    // start repeating
            patterns.append(e)
            if repeatStIndex == -1 { repeatStIndex = curCheckingIndex }
            if curCheckingIndex >= arr.count - 1 {
                return true     // the end of array
            }
            curCheckingIndex += 1   // move to next
            
        } else if repeating && patterns.contains(e) {
            // the next repetation appears
            repeating = false   // stop repeating
            return true
        }
        return false
    }
    
    var sums = [a]
    var curIndex = -1
    var repeating = false
    var patterns = [Int]()
    var repeatStIndex = -1
    var val = a
    while (true) {
        var ints = [Int]()
        convertIntToArr(val: val, ints: &ints)
        val = sumOfInts(ints: ints)
        if isRepeating(repeating: &repeating, patterns: &patterns, repeatStIndex: &repeatStIndex, arr: sums, curCheckingIndex: &curIndex, e: val) {
            break
        }
        sums.append(val)
    }
    print("read numbers         : \(sums)")
    print("repeatation starts at: \(repeatStIndex)")
    print("patterns             : \(patterns)")
    print("outside repetation   : \(sums[0..<repeatStIndex])")
    //    [57, 74, 65, 61, 37, 58, 89, 145, 42, 20, 4, 16, 37, 58, 89, 145, 42, 20, 4, 16, 37, 58, 89, 145, 42, 20, 4, 16, 37, 58, 89, 145]
        //                                                 ^^  ^^  ^^  ^^^  ^^  ^^  ^  ^^  !!
        
}



