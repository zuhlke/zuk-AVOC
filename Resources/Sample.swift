//
//  Sample.swift
//
//
//  Created by Vrushali Jadhav on 29/09/2023.
//

import Foundation

func test() {
    true ? print("hello world") : print("hello moon")
    
    var tempVar : String?
    tempVar = "Don't force unwrap me"
    print(tempVar!)
    if tempVar != "" {
        print("Not empty")
    }

}

test()
