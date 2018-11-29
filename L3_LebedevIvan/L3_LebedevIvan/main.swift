//
//  main.swift
//  L3_LebedevIvan
//
//  Created by Иван Лебедев on 26/11/2018.
//  Copyright © 2018 Иван Лебедев. All rights reserved.
//

import Foundation


enum WindowState {
    case open, close
}
enum Engine {
    case on, off
}

struct Car {
    var model: String
    var date: Int
    var windowState: WindowState
    var engine: Engine
    var trunkState: Int
    var trunkStateNumber: Int {
        didSet {
            if trunkStateNumber > trunkState {
                print ("Багажник переполнен")
                trunkStateNumber = oldValue
            } else if trunkStateNumber < 0 {
                print ("Отрицательное значение")
                trunkStateNumber = oldValue
            }
        }
    }
    
    mutating func trunkStateIncrease (weight: Int) {
        self.trunkStateNumber += weight
        if trunkStateNumber > trunkState {
            print ("Багажник переполнен")
        }
    }
    mutating func trunkStateDecrease (weight: Int) {
        self.trunkStateNumber -= weight
    }
        
    mutating func WindowStatus (state: WindowState) {
        switch windowState {
        case .open:
            self.windowState = .open;
            print ("Окно открыто")
        case .close:
            self.windowState = .close;
            print ("Окно закрыто")
        }
    }
    mutating func EngineStatus (state: Engine) {
        switch engine {
        case .on:
            self.engine = .on;
            print ("Двигатель заведён")
        case .off:
            self.engine = .off;
            print ("Двигатель не заведён")
}
}
    func showDate () {
        print (date)
    }
    func showModel () {
        print (model)
    }
    func showTrunkStatus () {
        print (trunkStateNumber)
    }
    func ShowInfo () {
        print ("Марка: \(self.model) \nГод: \(self.date) \nСостояние двигателя: \(self.engine) \nЗаполненность багажника:  \(self.trunkStateNumber)")
    }
 }

var C1 = Car (model: "Mercedes", date: 2018, windowState: .open, engine: .on, trunkState: 50, trunkStateNumber: 40)
var C2 = Car (model: "KIA", date: 1995, windowState: .close, engine: .off, trunkState: 60, trunkStateNumber: 30)

C1.ShowInfo()
C1.trunkStateIncrease (weight: 15)
C1.EngineStatus (state: .on)
C1.WindowStatus (state: .close)
C1.ShowInfo()

C2.ShowInfo()
C2.trunkStateDecrease (weight: 20)
C2.showModel()
C2.showDate()
C2.showTrunkStatus()

