//
//  Vechicle.swift
//  Factory Abstract
//
//  Created by Shashank Pali on 16/10/22.
//

import Foundation

enum MoveDirection {
    case up, down, left, right
}

enum Status {
    case started, moving(MoveDirection), stopped
}

protocol VehicleProtocol {
    // properties
    var name: String {get}
    var model: String {get}
    var maker: String {get}
    
    // initiate
    init(name: String, model: String, maker: String)
    
    // commands
    func start()
    func stop()
    func applyBreaks()
    func move(_ direction: MoveDirection)
    
    // getter
    func getStatus() -> Status
    func getAverage() -> String
    func getLoadCapicity() -> String
    func numberOfWheels() -> Int
}
