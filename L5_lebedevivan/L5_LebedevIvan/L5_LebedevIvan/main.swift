//
//  main.swift
//  L5_LebedevIvan
//
//  Created by Иван Лебедев on 06/12/2018.
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

 protocol Car {
    var model: String {get set}
    var date: Int {get set}
    var trunkState: Int {get set}
}

extension Car {
 
    
    func windowStatus (action: WindowState) {
        switch action {
        case .open:
            print ("Окно открыто")
        case .close:
            print ("Окно закрыто")
        }
    }
    func EngineStatus (action: Engine) {
        switch action {
        case .on:
            print ("Двигатель заведён")
        case .off:
            print ("Двигатель не заведён")
        }
    }
}
class SportCar: Car {
    var model: String
    
    var date: Int
    
    var trunkState: Int
    
    var spoilerState: SpoilerState
    init (model: String, date: Int, windowState: WindowState, engine: Engine, trunkState: Int, spoilerState: SpoilerState) {
        self.spoilerState = spoilerState
        self.model = model
        self.date = date
        self.trunkState = trunkState
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
}
extension SportCar: CustomStringConvertible {
    var description: String {
        return ("Спорт кар  \(self.model), дата выпуска \(self.date), объём багажника: \(self.trunkState), состояние спойлера: \(self.spoilerState)")
    }
}

class TrunkCar: Car {
    var model: String
    
    var date: Int
    
    var trunkState: Int
    
    var trailerPresence: TrailerPrecense
    init (model: String, date: Int, windowState: WindowState, engine: Engine, trunkState: Int, trailerPresence: TrailerPrecense) {
        self.trailerPresence = trailerPresence
        self.model = model
        self.date = date
        self.trunkState = trunkState
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
}
extension TrunkCar: CustomStringConvertible {
    var description: String {
        return ("Грузовик  \(self.model), дата выпуска \(self.date), объём багажника: \(self.trunkState), наличие прицепа: \(self.trailerPresence)")
    }
}



var C1 = SportCar (model: "Mercedes", date: 2018, windowState: .open, engine: .on, trunkState: 50,  spoilerState: .open)
var C2 = TrunkCar (model: "KIA", date: 1995, windowState: .close, engine: .off, trunkState: 60, trailerPresence: .off)

print(C1)
print(C2)
C1.SpoilerInfo()
C2.trailerInfo()
