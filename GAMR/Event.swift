//
//  Event.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import Foundation

class Event{
    var Title : String = ""
    var Desc : String = ""
    var Location : String = ""
    var Date : String = ""
    var Creator : String = ""
    
    init(Title : String, Desc : String, Location : String, Date : String, Creator: String){
        self.Title = Title
        self.Desc = Desc
        self.Location = Location
        self.Date = Date
        self.Creator = Creator
    }
    
}

