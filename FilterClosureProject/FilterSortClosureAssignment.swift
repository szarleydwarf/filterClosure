//
//  FilterSortClosureAssignment.swift
//  FilterClosureProject
//
//  Created by MAC on 7/30/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import Foundation

struct FilterSortClosureAssignment {
    //requirements
//No matter what is returned in closure, if empty array is passed in, it should remain empty
      
    //selection sorting could not figure out why it is throwing an error
  func selectionSort(array: [Int], sortClosure: (Int, Int) -> Bool) -> [Int] {
    //TODO: Students fill out this function
    guard array.count > 1 else { return array }
    var sortedArray: [Int] = array
    
    for n1 in 0..<sortedArray.count {
        var key = n1
        var n2 = n1
        while n1 < sortedArray.count - 1{
            //index out of range
            if sortClosure(sortedArray[key], sortedArray[n2]){
                key = n2
            }
            n2 += 1
        }
        if n1 != key {
            sortedArray.swapAt(n1, key)
        }
    }
    return sortedArray
  }
    //insertion sort
    func sort(array:[Int], sortClosure: (Int,Int) -> Bool) -> [Int] {
        guard array.count > 1 else {return array}
        var sortedArray:[Int] = array
        
        for i1 in 0..<sortedArray.count {
            let key = sortedArray[i1]
            var i2 = i1
            
            while i2 > -1 {
                if sortClosure(key, sortedArray[i2]) {
                    sortedArray.remove(at: i2+1)
                    sortedArray.insert(key, at: i2)
                }
                i2 -= 1
            }
        }
        
        return sortedArray
    }
    
  
//No matter what is returned in closure, if empty array is passed in, it should remain empty
//If always passes true, nothing should be filtered
//If always passes false, everything should be filtered
  
  func filter(array: [Int], filterClosure: (Int) -> Bool) -> [Int] {
    //TODO: Students fill out this function
        var filteredArray = [Int]()
        for n in array {
            if filterClosure(n) {
                filteredArray.append(n)
            }
        }
        return filteredArray
    }

  
  func test() {
    //Students may run tests here to make sure that theit functions work as expected.
    print("Hello")
    let emptyArr:[Int]=[]
    let array1 = [1,3,-2,6,-12]
    let array2 = [98, 6362, 1, 920, 555, 545, -1]
    
    var filtered = filter(array: emptyArr, filterClosure:{ (n) -> Bool in return n < 5})
    print("empty filter -> \(filtered)")
    filtered = filter(array: array1, filterClosure: { (n) -> Bool in return n > 0})
    print("array1 filter -> \(filtered)")
    filtered = filter(array: array1, filterClosure: { (n) -> Bool in return n < 0})
    print("array1 filter -> \(filtered)")
    filtered = filter(array: array2, filterClosure: { (n) -> Bool in return n < 0})
    print("array2 filter -> \(filtered)")
    
    var sorted = sort(array: emptyArr) { (n1, n2) -> Bool in return n1 < n2}
    print("empty sorted -> \(sorted)")
    sorted = sort(array: array1) { (n1, n2) -> Bool in return n1 < n2}
    print("array1 sorted -> \(sorted)")
    sorted = sort(array: array1) { (n1, n2) -> Bool in return n1 > n2}
    print("array1 sorted -> \(sorted)")

  }
}

