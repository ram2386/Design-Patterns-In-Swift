//
//  Bike.swift
//  Factory Abstract
//
//  Created by Shashank Pali on 16/10/22.
//

import Foundation

class Bike: VehicleDecorator {
    
    override func getAverage() -> String {
        return "80 km/l"
    }
    
    override func getLoadCapicity() -> String {
        return "180 kg"
    }
    
    override func numberOfWheels() -> Int {
        return 2
    }
    
}
