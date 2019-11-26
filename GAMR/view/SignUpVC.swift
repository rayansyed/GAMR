//
//  SignUpVC.swift
//  GAMR
//
//  Created by Rayan Syed on 2019-11-25.
//  Copyright © 2019 Rayan Syed. All rights reserved.
// hello
// hellooo

import UIKit
import FirebaseDatabase

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
        
        name.useUnderline()
        username.useUnderline()
        password.useUnderline()
        cPassword.useUnderline()
        email.useUnderline()

       
    }
    
    func openLogInScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let logInVC = mainSB.instantiateViewController(withIdentifier: "LogInScene") as! LoginVC
        logInVC.modalPresentationStyle = .fullScreen
        //self.present(logInVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(logInVC, animated: true)
    }
    
    @IBAction func goToLogin()
    {
        openLogInScene()
    }
    

    @IBAction func createUser(){
        uName = name.text ?? ""
        uUser = username.text ?? ""
        uPass = password.text ?? ""
        uCPass = cPassword.text ?? ""
        uEmail = email.text ?? ""
        
        
        if(name.text != "" && username.text != "" && password.text != "" && cPassword.text != "" && email.text != "" && password.text == cPassword.text)
        {
            Database.database().reference().child("users").observeSingleEvent(of: .value, with: {(snapshot) in

                if snapshot.hasChild("\(self.uName)")
                {
                    let alert = UIAlertController(title: "Account Credentials Error", message: "Username Already Exists", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                else
                {
                    let newUser = User(Name: self.uName, Username: self.uUser, Password: self.uPass, Email: self.uEmail)
                    self.userController.insertUser(newUser: newUser)
                    self.openLogInScene()
                    
                }


            })
        
        }
        else
        {
            let alert = UIAlertController(title: "Account Credentials Error", message: "Please Ensure All Fields Are Filled", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
           nextField.becomeFirstResponder()
        } else {
           // Not found, so remove keyboard.
           textField.resignFirstResponder()
        }
    // Do not add a line break
    return false
    }
    
    
    @IBAction func handleTap(tapGestureRecognizer: UITapGestureRecognizer){
        guard tapGestureRecognizer.view != nil else { return }
               
          if tapGestureRecognizer.state == .ended {
             self.view.endEditing(true)
          }
    }

}
