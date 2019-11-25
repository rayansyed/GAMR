//
//  UserController.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import Foundation
import FirebaseDatabase

public class UserController{
    
    
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

    }
    
    func deleteUser(email: String){

        
    }
    
//    func validateUser(email: String, password: String) -> Bool{
//
//    }
//
//    func getAllUsers() -> [NSManagedObject]?{
//
//    }
}
