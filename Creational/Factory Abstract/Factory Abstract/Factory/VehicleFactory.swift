//
//  VehicleFactory.swift
//  Factory Abstract
//
//  Created by Shashank Pali on 16/10/22.
//

import Foundation

enum VehicleType {
    case bike(model: String, maker: String), car(model: String, maker: String)
}

class VehicleFactory {
    
    static func getVehicle(_ type: VehicleType) -> VehicleProtocol {
        switch type {
        case .bike(let model, let maker):
            return Bike(name: "", model: model, maker: maker)
        case .car(let model, let maker):
            return Car(name: "", model: model, maker: maker)
        }
    }
    
}
