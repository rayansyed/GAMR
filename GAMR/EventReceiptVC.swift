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
    var dbUsername : String = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference()
          ref.child("events").child(dbTitle).observeSingleEvent(of: .value, with: { (snapshot) in

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

          }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    @IBAction func openHomeScene(){
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let listVC = mainSB.instantiateViewController(withIdentifier: "HomeScene") as! HomeVC
        listVC.dbUsername = dbUsername
        listVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    
    
}

