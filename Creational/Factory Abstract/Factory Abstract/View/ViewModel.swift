//
//  ViewModel.swift
//  Factory Abstract
//
//  Created by Shashank Pali on 16/10/22.
//

import Foundation

protocol ViewModelProtocol {
    init(transform: CGAffineTransform, delegate: ViewProtocol, vehicle: VehicleProtocol)
    
    func started()
    func vehicleMove(id: Int)
    func breakApplied()
}

class ViewModel: ViewModelProtocol {
    
    var timer = Timer()
    var value = 0
    var transform: CGAffineTransform
    var delegate: ViewProtocol?
    var vehicle: VehicleProtocol
    
    required init(transform: CGAffineTransform, delegate: ViewProtocol, vehicle: VehicleProtocol) {
        self.transform = transform
        self.delegate  = delegate
        self.vehicle = vehicle
    }
        
    func started() {
        guard timer.isValid == false else {return}
        timer = Timer.scheduledTimer(timeInterval: 0.04, target: self, selector: #selector(loopGif), userInfo: nil, repeats: true)
        //
        vehicle.start()
        printMe()
    }
    
    func vehicleMove(id: Int) {
        let rotate = [201: (.pi * 1.5, MoveDirection.up), // 90 up
                      202: (.pi * 2, MoveDirection.right), // 360 right
                      203: (.pi / 2, MoveDirection.down), // 90 down
                      204: (.pi, MoveDirection.left)][id]! // 180 left
        delegate?.rotateImage(transform.rotated(by: rotate.0))
        //
        vehicle.move(rotate.1)
        printMe()
    }
    
    func breakApplied() {
        timer.invalidate()
        vehicle.applyBreaks()
        //
        printMe()
    }
    
}

extension ViewModel {
    
    @objc func loopGif() {
        var count = String(value)
        
        if count.count == 2 {
            count = "0" + count
        }else if count.count == 1 {
            count = "00" + count
        }
        
        delegate?.updateImage("frame_\(count)_delay-0.04s")
        
        if value == 119 {value = 0} else {value += 1}
     }
    
    func printMe() {
        print(vehicle.model, vehicle.getStatus(), vehicle.getAverage(), vehicle.getLoadCapicity(), "\n \n")
    }
}
