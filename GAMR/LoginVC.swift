//
//  LoginVC.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit
import FirebaseDatabase

class LoginVC: UIViewController, UITextFieldDelegate{
    
    @IBOutlet var pictor : UIImageView!
    @IBOutlet var userField : UITextField!
    @IBOutlet var passField : UITextField!
    @IBOutlet var quoteLabel : UILabel!
    var quotes: [String] = []
    var ref = Database.database().reference()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    
        userField.useUnderline()
        passField.useUnderline()
        
        self.userField.delegate = self
        self.passField.delegate = self

        getQuotes()
        
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
    
    @IBAction func signIn()
    {
        
        
        let username = userField.text ?? ""
        let password = passField.text ?? ""
        
        if(username != "" && password != "")
        {
            print(username)
            ref.child("users").child("\(username)").observeSingleEvent(of: .value)
            {(snapshot) in
                let values = snapshot.value as? NSDictionary
                let dbusername = values?["username"] as? String ?? ""
                let dbpassword = values?["password"] as? String ?? ""

                if(username == dbusername && password == dbpassword)
                {
                    print("YOURE A BOZO")
                }
                else
                {
                    print("Account Does Not Exist")
                    let alert = UIAlertController(title: "Account Credentials Error", message: "The username or password is incorrect", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }
        else
        {
            let alert = UIAlertController(title: "Account Credentials Error", message: "Please fill in the remaining fields", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func signUp()
    {
        openSignUpScene()
    }
    
    
    func openSignUpScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let signUpVC = mainSB.instantiateViewController(withIdentifier: "SignUpScene") as! SignUpVC
        signUpVC.modalPresentationStyle = .fullScreen
        self.present(signUpVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
    
    
    func getQuotes(){
            print("Getting Quotes")
            
            

            let launchString = "http://www.objgen.com/json/models/NcE2"
            
            //create a URL from the string
            let quoteURL = URL(string: launchString)
            
            //create a task to execute URL Request
            let dataTask = URLSession.shared.dataTask(with: quoteURL!){(data: Data?, response: URLResponse?, error: Error?) in
                
                //check if unsuccessful attempt to execute request
                if let error = error{
                    print("Error : \(error)")
                }else{
                    //successful execution of request
                    //get the data received from the request
                    if let jsonData = data{
                        //convert data type into String
                        let dataString = String(data: jsonData, encoding: String.Encoding.utf8)
                        
                        print(dataString)
                        
                        //convert string into jsonObject
                        if let jsonObj = try?JSONSerialization.jsonObject(with: jsonData, options: .mutableContainers) as? NSDictionary{
                            
                            
                            print(jsonObj)
                        
                    
                            if let famousquotes = jsonObj.value(forKey: "Quote") as?
                                NSArray{

                                for quote in famousquotes
                                {
                                    self.quotes.append(quote as! String)
                                }

                            }else{
                                print("Unable to quotes")
                            }
                            
                            DispatchQueue.main.async {
                                
                            }
                    
                            
                        }else{
                            print("Unable to convert into jsonObject")
                        }
                        
                    }else{
                        print("Cannot get data from the URL Request")
                    }
                }
            }
            //execute the url request
            dataTask.resume()
        for x in self.quotes
        {
            print(x)
        }
        }

}


extension UITextField {

    func useUnderline() {
        
        let pink = UIColor(red: 255/255, green: 97/255, blue: 210/255, alpha: 1)
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = pink.cgColor
        border.frame = CGRect(origin: CGPoint(x: 0,y :self.frame.size.height - borderWidth), size: CGSize(width: self.frame.size.width, height: self.frame.size.height))
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
        
    }
    
}
