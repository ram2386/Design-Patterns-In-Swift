//
//  Car.swift
//  Factory Abstract
//
//  Created by Shashank Pali on 16/10/22.
//

import Foundation

class Car: VehicleDecorator {
    
    override func getAverage() -> String {
        return "39 km/l"
    }
    
    override func getLoadCapicity() -> String {
        return "480 kg"
    }
    
    override func numberOfWheels() -> Int {
        return 4
    }
    
}
