//
//  SignUpVC.swift
//  GAMR
//
//  Created by Rayan Syed on 2019-11-25.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    var userController = UserController()
    
    @IBOutlet var name : UITextField!
    @IBOutlet var username : UITextField!
    @IBOutlet var password : UITextField!
    @IBOutlet var cPassword : UITextField!
    @IBOutlet var email : UITextField!
    
    
    var uName : String = ""
    var uUser : String = ""
    var uPass : String = ""
    var uCPass : String = ""
    var uEmail : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func createUser(){
        print("Creating User")
        uName = name.text ?? ""
        uUser = username.text ?? ""
        uPass = password.text ?? ""
        uCPass = cPassword.text ?? ""
        uEmail = email.text ?? ""
        
        if(name.text != "" && username.text != "" && password.text != "" && cPassword.text != "" && email.text != "" && password.text == cPassword.text)
        {
            let newUser = User(Name: uName, Username: uUser, Password: uPass, Email: uEmail)
            userController.insertUser(newUser: newUser)
        }
        
    }

}
