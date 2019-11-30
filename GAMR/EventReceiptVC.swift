//
//  EventReceiptVC.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit
import FirebaseDatabase


class EventReceiptVC: UIViewController {
    
    //todo: continue button takes u back to home screen
    @IBOutlet var diplayTitle : UILabel!
    @IBOutlet var displayDesc : UILabel!
    @IBOutlet var displayLocation : UILabel!
    @IBOutlet var displayDate : UILabel!
    
    var dbTitle : String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference()
          ref.child("events").child(dbTitle).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user value
            let value = snapshot.value as? NSDictionary
            let title = value?["title"] as? String ?? ""
            let desc = value?["desc"] as? String ?? ""
            let location = value?["location"] as? String ?? ""
            let date = value?["date"] as? String ?? ""
            print("Receipt")
            self.displayDesc.text = desc
            self.displayDate.text = date
            self.diplayTitle.text = title
            self.displayLocation.text = location

          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
        
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
