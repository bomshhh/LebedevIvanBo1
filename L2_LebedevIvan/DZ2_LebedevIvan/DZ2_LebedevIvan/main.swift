//
//  main.swift
//  DZ2_LebedevIvan
//
//  Created by Иван Лебедев on 26/11/2018.
//  Copyright © 2018 Иван Лебедев. All rights reserved.
//

import Foundation

let x = 26

func checkdouble () {
    if x % 2 == 0 {
        print ("Число четное")}
    else if x % 2 == 1 {
        print ("Число нечетное")
}
}
checkdouble ()

print("=============")

func checktriple () {
    if x % 3 == 0 {
        print ("Делится без остатка")
    } else if x % 3 != 0 {
        print ("Не делится без остатка")
    }
}
checktriple()

print("=============")

var newArray = Array <Int> ()
for i in 1...100 {
    newArray.append(i)
}
print (newArray)

print("=============")

for value in newArray {
    if (value % 2) == 0 {
        newArray.remove(at: newArray.index(of: value)!)
    }
}
for value in newArray {
    if (value % 3) == 0 {
        newArray.remove(at: newArray.index(of: value)!)
    }
}
 print (newArray)
