//
//  ViewController.swift
//  xyz-machine
//
//  Created by exxe on 27.10.18.
//  Copyright © 2018 exxe. All rights reserved.
//

import UIKit
import CoreMotion


class ViewController: UIViewController {

    @IBOutlet weak var xLbl: UILabel!
    @IBOutlet weak var yLbl: UILabel!
    @IBOutlet weak var zLbl: UILabel!
    
    var motionManager: CMMotionManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLbl)
        
        
    }
    
    func updateLbl(data: CMAccelerometerData?, error: Error?) {
        guard let accelerometerData = data else { return }
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        
        let x = formatter.string(for: accelerometerData.acceleration.x)
        let y = formatter.string(for: accelerometerData.acceleration.y)
        let z = formatter.string(for: accelerometerData.acceleration.z)
        
        xLbl.text = "X: \(x!)"
        yLbl.text = "Y: \(y!)"
        zLbl.text = "Z: \(z!)"
    }

}












