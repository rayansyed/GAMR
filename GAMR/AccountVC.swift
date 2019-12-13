//
//  AccountVC.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit
import FirebaseDatabase

class AccountVC: UIViewController {
    
    @IBOutlet var displayName : UILabel!
    @IBOutlet var displayEmail : UILabel!
    @IBOutlet var displayUsername : UILabel!
    @IBOutlet var displayPassword : UILabel!
    
    var userController = UserController()

    var dbUsername : String = ""
    var dbPassword : String = ""
    var dbEmail : String = ""
    var dbName : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference()
          ref.child("users").child(dbUsername).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let value = snapshot.value as? NSDictionary
            let name = value?["name"] as? String ?? ""
            let email = value?["email"] as? String ?? ""
            let username = value?["username"] as? String ?? ""
            let password = value?["password"] as? String ?? ""
            print("Receipt")
            self.dbName = name
            self.dbPassword = password
            self.dbUsername = username
            self.dbEmail = email
            self.displayName.text = name
            self.displayEmail.text = email
            self.displayPassword.text = password
            self.displayUsername.text = username

          // ...
          }) { (error) in
            print(error.localizedDescription)
        }

        // Do any additional setup after loading the view.
    }

     @IBAction func removeUser() {

        userController.deleteUser(username:self.dbUsername)
        openLoginScene()
    }

    
    @IBAction func openLoginScene(){
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let LoginVC = mainSB.instantiateViewController(withIdentifier: "LogInScene") as! LoginVC
        LoginVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(LoginVC, animated: true)
    }
    
    @IBAction func openEditScene(){
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let EditVC = mainSB.instantiateViewController(withIdentifier: "EditScene") as! EditAccountVC
        EditVC.modalPresentationStyle = .fullScreen
        EditVC.dbUsername = self.dbUsername
        EditVC.dbEmail = self.dbEmail
        EditVC.dbName = self.dbName
        EditVC.dbPassword = self.dbPassword
        self.navigationController?.pushViewController(EditVC, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
