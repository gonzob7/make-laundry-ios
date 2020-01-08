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


class LoginViewController: UIViewController {
    

    struct Login: Encodable {
        let email: String
        let password: String
    }

    @IBOutlet weak var emailLoginField: UITextField!
    @IBOutlet weak var passwordLoginField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

    }
    
    
    @IBAction func loginPressed(_ sender: Any) {
        Alamofire.request("https://make-laundry.herokuapp.com/login?email=" + emailLoginField.text! + "&password=" + passwordLoginField.text!, method: .post, encoding: JSONEncoding.default).response { response in
            debugPrint(response)
        }

    }
    

}

