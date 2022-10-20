//
//  ViewController.swift
//  Factory Abstract
//
//  Created by Shashank Pali on 16/10/22.
//

import UIKit

protocol ViewProtocol {
    var viewModelProtocol: ViewModelProtocol? {get}
    
    func updateImage(_ string: String)
    func rotateImage(_ transform: CGAffineTransform)
}

class ViewController: UIViewController, ViewProtocol {
    
    var viewModelProtocol: ViewModelProtocol?
    
    @IBOutlet weak var vehicleGif: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let v = VehicleFactory.getVehicle(.bike(model: "FZ", maker: "Yamaha"))
        
        viewModelProtocol = ViewModel(transform: self.vehicleGif.transform, delegate: self, vehicle: v)
        
        print(v.model, v.getStatus(), v.getAverage(), v.getLoadCapicity(), "\n \n")
    }
    
    
    //MARK: - User interaction
    
    @IBAction func moveVehicle(_ sender: UIButton) {
        viewModelProtocol?.vehicleMove(id: sender.tag)
    }
    
    @IBAction func appliedBreaks(_ sender: UIButton) {
        viewModelProtocol?.breakApplied()
    }
    
    @IBAction func started(_ sender: UIButton) {
        viewModelProtocol?.started()
    }
        
}

extension ViewController {
   
    func updateImage(_ string: String) {
        self.vehicleGif.image = UIImage(named: string)
    }
    
    func rotateImage(_ transform: CGAffineTransform) {
        UIView.animate(withDuration: 0.5) {
            self.vehicleGif.transform = transform
        }
    }
}
