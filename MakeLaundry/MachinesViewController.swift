//
//  MachinesViewController.swift
//  MakeLaundry
//
//  Created by Gonzalo Birrueta on 1/9/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class MachinesViewcontroller: UIViewController{
    
    @IBOutlet weak var floorNumber: UILabel!
    @IBOutlet weak var floorNumber2: UILabel!
    @IBOutlet weak var machineLabel1: UILabel!
    
    @IBOutlet weak var machineLabel3: UILabel!
    @IBOutlet weak var machineLabel4: UILabel!
    @IBOutlet weak var machineLabel5: UILabel!
    @IBOutlet weak var machineLabel6: UILabel!
    
    override func viewDidLoad() {
        loadCards()
    }
    
    @IBAction func machinePressed(_ sender: UIButton) {
        if sender.titleLabel?.text == "VACANT"{
            self.performSegue(withIdentifier: "vacantVC", sender: nil)
        }else if sender.titleLabel?.text == "FINISHED"{
            self.performSegue(withIdentifier: "finishedVC", sender: nil)
        }else if sender.accessibilityIdentifier == "WASHERINUSE"{
            self.performSegue(withIdentifier: "notFinishedVC", sender: nil)
        }
        
    }
        
    
    func loadCards(){
        AF.request("https://make-laundry.herokuapp.com/api/group/5e17dcea72d7dfb65f94a008").validate().responseJSON { response in
            switch response.result {
            case .success:
                print("Validation Successful)")

                if let json = response.data {
                    do{
                        let data = try JSON(data: json)
                        
                        let floor = data["sets"][0]["name"].string
                        let floor2 = data["sets"][1]["name"].string
                        
                        let location = data["name"].string
                        
                        let machine1 = data["sets"][1]["groups"][0]["machines"][0]["name"].string
                        
                        let machine3 = data["sets"][0]["groups"][0]["machines"][0]["name"].string
                        let machine4 = data["sets"][0]["groups"][0]["machines"][1]["name"].string
                        let machine5 = data["sets"][0]["groups"][1]["machines"][0]["name"].string
                        let machine6 = data["sets"][0]["groups"][1]["machines"][1]["name"].string


                        self.floorNumber.text = floor
                        self.floorNumber2.text = floor2
                        self.navigationItem.title = location
                        self.machineLabel1.text = machine1
                        self.machineLabel3.text = machine3
                        self.machineLabel4.text = machine4
                        self.machineLabel5.text = machine5
                        self.machineLabel6.text = machine6
                        
                    }
                    catch{
                    print("JSON Error")
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
        
        

        
    }
    
}


