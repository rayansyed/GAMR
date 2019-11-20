//
//  CreateEventVC.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit
import FirebaseDatabase



class CreateEventVC: UIViewController {
    @IBOutlet var eventTitle : UITextField!
    @IBOutlet var eventDesc : UITextField!
    @IBOutlet var eventLocation : UITextField!
    @IBOutlet var eventDate : UIDatePicker!
    
    var etitle : String = ""
    var edesc : String = ""
    var elocation : String = ""
    var edate : String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventTitle.useUnderline()
        eventLocation.useUnderline()
        eventDesc.useUnderline()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createEvent(_ sender: UIButton){
        print("Creating Event")
        etitle = eventTitle.text ?? "Unknown"
        edesc = eventDesc.text ?? "Unknown"
        elocation = eventLocation.text ?? "Unknown"
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-YYYY h:mm a"
        let strDate = dateFormatter.string(from: eventDate.date)
        edate = strDate
        
        let newEvent = Event(Title: etitle, Desc: edesc, Location: elocation, Date: edate)
        print(newEvent.Title)
        print(newEvent.Desc)
        print(newEvent.Location)
        print(newEvent.Date)
        
        let EventInfoDictionary = ["title" : newEvent.Title ,"desc" : newEvent.Desc, "date" : newEvent.Date ,"location" : newEvent.Location]
        
        let ref = Database.database().reference().child("events").child("\(newEvent.Title)")
        ref.setValue(EventInfoDictionary)
        
        self.openReceiptScene()
        
    }
    
    func openReceiptScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let receiptVC = mainSB.instantiateViewController(withIdentifier: "ReceiptScene") as! EventReceiptVC
        receiptVC.dbTitle = self.etitle
        self.present(receiptVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(receiptVC, animated: true)
    }
    
    @IBAction func handleTap(tapGestureRecognizer: UITapGestureRecognizer){
        guard tapGestureRecognizer.view != nil else { return }
               
          if tapGestureRecognizer.state == .ended {
             self.view.endEditing(true)
          }
    }
    
    
}



