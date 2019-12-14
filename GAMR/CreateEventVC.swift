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
    var eventController = EventController()
    

    @IBOutlet var eventTitle : UITextField!
    @IBOutlet var eventDesc : UITextField!
    @IBOutlet var eventLocation : UITextField!
    @IBOutlet var eventDate : UIDatePicker!
    
    var etitle : String = ""
    var edesc : String = ""
    var elocation : String = ""
    var edate : String = ""
    var dbUsername : String = ""

    

    override func viewDidLoad() {
        super.viewDidLoad()

        eventTitle.useUnderline()
        eventLocation.useUnderline()
        eventDesc.useUnderline()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createEvent(_ sender: UIButton){
        
        etitle = eventTitle.text ?? ""
        edesc = eventDesc.text ?? ""
        elocation = eventLocation.text ?? ""
        
        if(etitle != "" && edesc != "" && elocation != ""){
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-YYYY h:mm a"
            let strDate = dateFormatter.string(from: eventDate.date)
            edate = strDate
            
            let newEvent = Event(Title: etitle, Desc: edesc, Location: elocation, Date: edate, Creator: dbUsername)
            eventController.insertEvent(newEvent: newEvent)

            
            self.openReceiptScene()
            
        }
        else{
            let alert = UIAlertController(title: "Create Event Error", message: "All fields are required", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        

        
    }
    
    func openReceiptScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let receiptVC = mainSB.instantiateViewController(withIdentifier: "ReceiptScene") as! EventReceiptVC
        receiptVC.dbTitle = self.etitle
        receiptVC.dbUsername = self.dbUsername
        
        //self.present(receiptVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(receiptVC, animated: true)
    }
    
    @IBAction func handleTap(tapGestureRecognizer: UITapGestureRecognizer){
        guard tapGestureRecognizer.view != nil else { return }
               
          if tapGestureRecognizer.state == .ended {
             self.view.endEditing(true)
          }
    }
    
    
}




