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

        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
        
    }

    
    
    @IBAction func loginPressed(_ sender: Any) {
                
        let email = self.emailLoginField.text
        let password = self.passwordLoginField.text

        let parameters = [ "email" : email, "password" : password]
        


        AF.request("https://make-laundry.herokuapp.com/api/login", method: .post, parameters: parameters, encoding: JSONEncoding.default)
        .responseJSON { response in
           switch response.result {
            case .success(let value):
                print(value)
                print("Logged in!")
                
                
                self.performSegue(withIdentifier: "loggedIn", sender: nil)
            case .failure(let error):
                print(error)
                print("Not logged in!")
            }
                                
        }
            

        
        

    }


    }

