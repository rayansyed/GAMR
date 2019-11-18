//
//  CreateEventVC.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit



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
        print(edate)
        
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
