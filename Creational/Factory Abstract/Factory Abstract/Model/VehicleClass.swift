//
//  VehicleClass.swift
//  Factory Abstract
//
//  Created by Shashank Pali on 16/10/22.
//

import Foundation

class VehicleDecorator: VehicleProtocol {
   
    var name: String
    var model: String
    var maker: String
    
    var status: Status = .stopped
    
    required init(name: String, model: String, maker: String) {
        self.name = name
        self.model = model
        self.maker = maker
    }
    
    func start() {
        status = .started
    }
    
    func stop() {
        status = .stopped
    }
    
    func applyBreaks() {
        stop()
    }
    
    func move(_ direction: MoveDirection) {
        status = .moving(direction)
    }
    
    func getStatus() -> Status {
        return status
    }
    
    func getAverage() -> String { fatalError("Must Override") }
    
    func getLoadCapicity() -> String { fatalError("Must Override") }
    
    func numberOfWheels() -> Int { fatalError("Must Override") }
    
}
