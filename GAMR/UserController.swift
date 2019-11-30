//
//  UserController.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import Foundation
import FirebaseDatabase

public class UserController : UIViewController{
    
    
    var userArray : [String] = []
    
    
    func insertUser(newUser: User){
        
        let UserInfoDictionary = ["username" : newUser.username ,"password" : newUser.password, "name" : newUser.name ,"email" : newUser.email]
        
        let ref = Database.database().reference().child("users").child("\(newUser.username)")
        ref.setValue(UserInfoDictionary)
        
//
//        ref.child("users").child("\(newUser.username)").setValue("\(newUser.username)", forKey: "username")
//        ref.child("users").child("\(newUser.username)").setValue("\(newUser.name)", forKey: "name")
//        ref.child("users").child("\(newUser.username)").setValue("\(newUser.password)", forKey: "password")
//        ref.child("users").child("\(newUser.username)").setValue("\(newUser.email)", forKey: "email")
        
    }
    
    func updateUser(user : User){
//
//
//            let ref = Database.database().reference()
//            ref.child("users").observeSingleEvent(of: .value, with: { (snapshot) in
//                // Get user value
//                  for child in snapshot.children {
//                    let snap = child as! DataSnapshot
//                    let key = snap.key
//                    self.userArray.append(key)
//
//                  }
//              })
//
//            for username in userArray
//            {
//                if(username == user.username)
//                {
//                    return false
//                }
//            }
//
//            return true

    }
    
    func deleteUser(username: String){
        let ref = Database.database().reference().child("users").child(username)

        ref.removeValue { error, _ in

            print(error)
        }

        
    }
    
    func checkUser(user : User, check: String) -> Bool
    {
        var returnValue : Bool = false
        Database.database().reference().child("users").observeSingleEvent(of: .value, with: {(snapshot) in

            if snapshot.hasChild("\(user.username)")
            {
                
                returnValue = true
            }


        })
        
        return returnValue

        
    }
    
//    func validateUser(email: String, password: String) -> Bool{
//
//    }
//
//    func getAllUsers() -> [NSManagedObject]?{
//
//    }
}
