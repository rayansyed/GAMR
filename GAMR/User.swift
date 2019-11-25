//
//  User.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import Foundation


class User{
    var name : String = ""
    var username : String = ""
    var password : String = ""
    var email : String = ""
    
    init(Name : String, Username : String, Password : String, Email : String){
        self.name = Name
        self.username = Username
        self.password = Password
        self.email = Email
    }
    
}
