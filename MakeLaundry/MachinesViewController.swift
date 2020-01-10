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
    @IBOutlet weak var machineLabel2: UILabel!
    @IBOutlet weak var machineLabel3: UILabel!
    @IBOutlet weak var machineLabel4: UILabel!
    @IBOutlet weak var machineLabel5: UILabel!
    @IBOutlet weak var machineLabel6: UILabel!
    
    @IBOutlet weak var machine1Btn: DesignableButton!
    @IBOutlet weak var machine2Btn: DesignableButton!
    
    @IBOutlet weak var machine3Btn: DesignableButton!
    @IBOutlet weak var machine4Btn: DesignableButton!
    
    
    override func viewDidLoad() {
        loadCards()
        loadButtons()
    }
    
    @IBAction func machinePressed(_ sender: UIButton) {
        if sender.accessibilityIdentifier == "vacant"{
            self.performSegue(withIdentifier: "vacantVC", sender: nil)
        }else if sender.accessibilityIdentifier == "finished"{
            self.performSegue(withIdentifier: "finishedVC", sender: nil)
        }else if sender.accessibilityIdentifier == "inuse"{
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
                        let machine2 = data["sets"][1]["groups"][1]["machines"][0]["name"].string
                        let machine3 = data["sets"][0]["groups"][0]["machines"][0]["name"].string // washer 1 floor 2
                        let machine4 = data["sets"][0]["groups"][0]["machines"][1]["name"].string
                        let machine5 = data["sets"][0]["groups"][1]["machines"][0]["name"].string
                        let machine6 = data["sets"][0]["groups"][1]["machines"][1]["name"].string

                        
                        let machine1Status = data["sets"][1]["groups"][0]["machines"][0]["status"]["timerSeconds"].int
                        
                        let machine2Status = data["sets"][1]["groups"][1]["machines"][0]["status"]["timerSeconds"].int
                        
                        let machine3Status = data["sets"][0]["groups"][0]["machines"][0]["status"]["timerSeconds"].int
                        
                        let machine3CurrentUser = data["sets"][0]["groups"][0]["machines"][0]["status"]["currentUser"]["name"].string
                        
                        let machine4Status = data["sets"][0]["groups"][0]["machines"][1]["status"]["timerSeconds"].int
                        
                        let machine5Status = data["sets"][0]["groups"][1]["machines"][0]["status"]["timerSeconds"].int
                        
                        let machine6Status = data["sets"][0]["groups"][1]["machines"][1]["status"]["timerSeconds"].int



                        self.floorNumber.text = floor
                        self.floorNumber2.text = floor2
                        self.navigationItem.title = location
                        self.machineLabel1.text = machine1
                        self.machineLabel2.text = machine2
                        self.machineLabel3.text = machine3
                        self.machineLabel4.text = machine4
                        self.machineLabel5.text = machine5
                        self.machineLabel6.text = machine6
                        
                        if machine1Status == nil{
                            print("MACHINE 1 IS VACANT")
                            self.machine1Btn.accessibilityIdentifier = "vacant"
                        }else if machine1Status == 0{
                            print("MACHINE 1 IS FINISHED")
                            self.machine1Btn.accessibilityIdentifier = "finished"
                        }else if machine1Status != nil && machine1Status != 0{
                            print("MACHINE 1 IN USE")
                            self.machine1Btn.accessibilityIdentifier = "inuse"
                        }
                        
                        if machine2Status == nil{
                            print("MACHINE 2 IS VACANT")
                            self.machine2Btn.accessibilityIdentifier = "vacant"
                        }else if machine2Status == 0{
                            print("MACHINE 2 IS FINISHED")
                            self.machine2Btn.accessibilityIdentifier = "finished"
                        }else if machine2Status != nil && machine2Status != 0{
                            print("MACHINE 2 IN USE")
                            self.machine2Btn.accessibilityIdentifier = "inuse"
                        }
                        
                        
                        if machine3Status == nil{
                            print("MACHINE 3 IS VACANT")
                            print(machine3CurrentUser)
                            print(machine3Status)
                            self.machine3Btn.accessibilityIdentifier = "vacant"
                        }else if machine3Status == 0{
                            print("MACHINE 3 IS FINISHED")
                            self.machine3Btn.accessibilityIdentifier = "finished"
                        }else if machine3Status != nil && machine3Status != 0{
                            print("MACHINE 3 IN USE")
                            self.machine3Btn.accessibilityIdentifier = "inuse"
                        }
                        
                        if machine4Status == nil{
                            print("MACHINE 4 IS VACANT")
                            self.machine4Btn.accessibilityIdentifier = "vacant"
                        }else if machine4Status == 0{
                            print("MACHINE 4 IS FINISHED")
                            self.machine4Btn.accessibilityIdentifier = "finished"
                        }else if machine4Status != nil && machine4Status != 0{
                            print("MACHINE 4 IN USE")
                            self.machine4Btn.accessibilityIdentifier = "inuse"
                        }
                        
                        
                        if machine5Status == nil{
                            print("MACHINE 5 IS VACANT")
//                            self.machine5Btn.accessibilityIdentifier = "vacant"
                        }else if machine5Status == 0{
                            print("MACHINE 5 IS FINISHED")
//                            self.machine5Btn.accessibilityIdentifier = "finished"
                        }else if machine5Status != nil && machine5Status != 0{
                            print("MACHINE 5 IN USE")
//                            self.machine5Btn.accessibilityIdentifier = "inuse"
                        }
                        
                        
                        if machine6Status == nil{
                            print("MACHINE 6 IS VACANT")
//                            self.machine4Btn.accessibilityIdentifier = "vacant"
                        }else if machine6Status == 0{
                            print("MACHINE 6 IS FINISHED")
//                            self.machine6Btn.accessibilityIdentifier = "finished"
                        }else if machine6Status != nil && machine6Status != 0{
                            print("MACHINE 6 IN USE")
//                            self.machine6Btn.accessibilityIdentifier = "inuse"
                        }

                        

                        
                        
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
    
    func loadButtons(){
        print()
        
        
    }
}


