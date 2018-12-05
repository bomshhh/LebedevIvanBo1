//
//  main.swift
//  L4_LebedevIvan
//
//  Created by Иван Лебедев on 05/12/2018.
//  Copyright © 2018 Иван Лебедев. All rights reserved.
//

import Foundation


enum WindowState {
    case open, close
}
enum Engine {
    case on, off
}
enum SpoilerState {
    case open, close
}
enum TrailerPrecense {
    case on, off
}

class Car {
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
    static var CarCount = 0
    
    
    init (model: String, date: Int, windowState: WindowState, engine: Engine, trunkState: Int, trunkStateNumber: Int) {
        self.model = model
        self.date = date
        self.windowState = windowState
        self.engine = engine
        self.trunkState = trunkState
        self.trunkStateNumber = trunkStateNumber
        Car.CarCount += 1
    }
    
    func trunkStateIncrease (weight: Int) {
        self.trunkStateNumber += weight
        if trunkStateNumber > trunkState {
            print ("Багажник переполнен")
        }
    }
    func trunkStateDecrease (weight: Int) {
        self.trunkStateNumber -= weight
    }
    
    func WindowStatus (state: WindowState) {
        switch windowState {
        case .open:
            self.windowState = .open;
            print ("Окно открыто")
        case .close:
            self.windowState = .close;
            print ("Окно закрыто")
        }
    }
    func EngineStatus (state: Engine) {
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
class SportCar: Car {
    var spoilerState: SpoilerState
    init (model: String, date: Int, windowState: WindowState, engine: Engine, trunkState: Int, trunkStateNumber: Int, spoilerState: SpoilerState) {
        self.spoilerState = spoilerState
        super.init (model: model, date: date, windowState: windowState, engine: engine, trunkState: trunkState, trunkStateNumber: trunkStateNumber)
    }
    
    func SpoilerPosition (State: SpoilerState) {
        switch spoilerState {
        case .open:
            self.spoilerState = .open
            print("Spoiler is on")
        case .close:
            self.spoilerState = .close
            print ("Spoiler is off")
        }
    }
    func SpoilerInfo () {
        print (spoilerState)
    }
    override func ShowInfo () {
        print ("Марка: \(self.model) \nГод: \(self.date) \nСостояние двигателя: \(self.engine) \nЗаполненность багажника:  \(self.trunkStateNumber) \nПозиция спойлера: \(self.spoilerState)")
    }
}
class TrunkCar: Car {
    var trailerPresence: TrailerPrecense
    init (model: String, date: Int, windowState: WindowState, engine: Engine, trunkState: Int, trunkStateNumber: Int, trailerPresence: TrailerPrecense) {
        self.trailerPresence = trailerPresence
        super.init (model: model, date: date, windowState: windowState, engine: engine, trunkState: trunkState, trunkStateNumber: trunkStateNumber)
    }
    func TrailerPosition (State: TrailerPrecense) {
        switch trailerPresence {
        case .on:
            self.trailerPresence = .on
            print ("Pricep imeetsya")
            case .off:
            self.trailerPresence = .off
            print ("Pricep otsutstvuet")
            
        }
    }
    func trailerInfo () {
        print (trailerPresence)
    }
    override func ShowInfo () {
        print ("Марка: \(self.model) \nГод: \(self.date) \nСостояние двигателя: \(self.engine) \nЗаполненность багажника:  \(self.trunkStateNumber) \nНаличие прицепа: \(self.trailerPresence)")
    }
}


var C1 = SportCar (model: "Mercedes", date: 2018, windowState: .open, engine: .on, trunkState: 50, trunkStateNumber: 40, spoilerState: .open)
var C2 = TrunkCar (model: "KIA", date: 1995, windowState: .close, engine: .off, trunkState: 60, trunkStateNumber: 30, trailerPresence: .off)

C1.ShowInfo()
C2.ShowInfo()
C1.SpoilerInfo()
C2.trailerInfo()



