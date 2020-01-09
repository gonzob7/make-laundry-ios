//
//  ViewController.swift
//  MakeLaundry
//
//  Created by Gonzalo Birrueta on 1/7/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SwiftSoup

class LoginViewController: UIViewController {

    
    @IBOutlet weak var emailLoginField: UITextField!
    @IBOutlet weak var passwordLoginField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         Do any additional setup after loading the view.

        
    }

    
    
    @IBAction func loginPressed(_ sender: Any) {
            let headers : HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]

        AF.request("https://make-laundry.herokuapp.com/api/csrf", headers: headers).response { response in
                debugPrint(response)
                
                let email = self.emailLoginField.text
                let password = self.passwordLoginField.text
                
            
                let parameters = [ "email" : email, "password" : password, "_csrf" : response] as [String : Any]
            
                let headers : HTTPHeaders = ["Content-Type": "application/x-www-form-urlencoded"]


                AF.request("https://make-laundry.herokuapp.com/api/login", method: .post, parameters: parameters, encoding: URLEncoding.httpBody, headers: headers)
                .responseJSON { response in
                    debugPrint(response)
                }
            }
    
        
        

        
        

    }


    }

