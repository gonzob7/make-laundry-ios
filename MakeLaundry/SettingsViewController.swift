//
//  SettingsViewController.swift
//  MakeLaundry
//
//  Created by Gonzalo Birrueta on 1/8/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class SettingsViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func logOut(_ sender: Any) {
        AF.request("https://make-laundry.herokuapp.com/api/logout").responseJSON { response in
        switch response.result {
         case .success(let value):
             print(value)
             print("Logged Out!")
             let controller = self.storyboard!.instantiateViewController(withIdentifier: "loginVC")
             controller.modalPresentationStyle = .fullScreen
            self.present(controller, animated: true, completion: nil)
         


         case .failure(let error):
             print(error)
             print("Not logged in!")
         }
         
        
    }
    
    
}
}
