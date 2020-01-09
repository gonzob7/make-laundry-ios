//
//  MachinesViewController.swift
//  MakeLaundry
//
//  Created by Gonzalo Birrueta on 1/9/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit

class MachinesViewcontroller: UIViewController{
    
    
    
    override func viewDidLoad() {
        
        
    }
    
    @IBAction func machinePressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "VACANT"{
            self.performSegue(withIdentifier: "vacantVC", sender: nil)
        }else if sender.titleLabel?.text == "FINISHED"{
            self.performSegue(withIdentifier: "finishedVC", sender: nil)
        }else{
            self.performSegue(withIdentifier: "notFinishedVC", sender: nil)
        }
    }
    
}
