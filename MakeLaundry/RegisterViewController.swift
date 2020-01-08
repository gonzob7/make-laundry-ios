//
//  RegisterViewController.swift
//  MakeLaundry
//
//  Created by Gonzalo Birrueta on 1/7/20.
//  Copyright © 2020 Gonzalo Birrueta. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class RegisterViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //Listen for keyboard events
                NotificationCenter.default.addObserver(self, selector: #selector(RegisterViewController.keyboardWillChange), name: UIResponder.keyboardWillShowNotification, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(RegisterViewController.keyboardWillChange), name: UIResponder.keyboardWillHideNotification, object: nil)
                NotificationCenter.default.addObserver(self, selector: #selector(RegisterViewController.keyboardWillChange), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

    }
    
    
        
    deinit {
            //Stop listening for keyboard hide/show events
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
            NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: Notification){
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else{
            return
        }
        
        if notification.name == UIResponder.keyboardWillShowNotification || notification.name == UIResponder.keyboardWillChangeFrameNotification{
            
            view.frame.origin.y = -(keyboardRect.height-150)
            
        }else{
            
            view.frame.origin.y = 0
            
        }
        
    }
    
    @IBAction func registerPressed(_ sender: Any) {
        Alamofire.request("https://make-laundry.herokuapp.com/").response { response in
            debugPrint(response)
        }
        
    }
    
}


