//
//  CyclicPermutation.swift
//  Graph1
//
//  Created by Uji Saori on 2021-03-25.
//

import Foundation

// input
/*
2
8
3 2 7 8 1 4 5 6
10
2 1 3 4 5 6 7 9 10 8

*/
// output
/*
3
7
*/
func cylces() {
    let t = Int(readLine()!)! // test case
    
    print("===== Cycles =====")
    for _ in 0 ..< t {
        let n = Int(readLine()!)!

        var directNodes = readLine()!.split(separator: " ").map { Int(String($0))! }
        directNodes.insert(0, at: 0)    // skip index 0 to match on Node number
        
        func search(stNode: Int, cycle: inout [Int]) {
            if 0 < stNode && stNode < directNodes.count && directNodes[stNode] != 0 {
                cycle.append(stNode)
                let nextNode = directNodes[stNode]
                directNodes[stNode] = 0 // visited
                search(stNode: nextNode, cycle: &cycle)
            }
        }
        
        var res = [[Int]]()
        for node in 1 ... n {
            var cycle = [Int]()
            search(stNode: node, cycle: &cycle)
            if cycle.count > 0 { res.append(cycle) }
        }
        print(res.count)
    }
}

