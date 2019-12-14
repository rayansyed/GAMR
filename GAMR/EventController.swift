//
//  EventController.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//



import Foundation
import FirebaseDatabase

public class EventController{
    
    
    func insertEvent(newEvent: Event){
                
        let EventInfoDictionary = ["title" : newEvent.Title ,"desc" : newEvent.Desc, "date" : newEvent.Date ,"location" : newEvent.Location, "creator" : newEvent.Creator]
        
        let ref = Database.database().reference().child("events").child("\(newEvent.Title)")
        ref.setValue(EventInfoDictionary)
        
        

    }
    
    func retrieveEvent(eventTitle : String)
    {
        
    }
    


}


