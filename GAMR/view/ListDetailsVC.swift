//
//  ListDetailsVC.swift
//  GAMR
//
//  Created by Rayan Syed on 2019-12-13.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ListDetailsVC: UIViewController {
    
    @IBOutlet var displayTitle:UILabel!
    @IBOutlet var displayDesc:UILabel!
    @IBOutlet var displayLocation:UILabel!
    @IBOutlet var displayDate:UILabel!
    @IBOutlet var displayHost:UILabel!
    @IBOutlet var deleteButton : UIButton!
    
    var eTitle : String = ""
    var eDesc : String = ""
    var eLocation : String = ""
    var eDate : String = ""
    var eHost : String = ""
    var dbUsername : String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (dbUsername != eHost)
        {
            deleteButton.isHidden = true
        }
        
        displayDate.text = eDate
        displayDesc.text = eDesc
        displayTitle.text = eTitle
        displayLocation.text = eLocation
        displayHost.text = eHost

        // Do any additional setup after loading the view.
    }
    
    @IBAction func deleteEvent(){
        
        let ref = Database.database().reference().child("events").child(eTitle)
        ref.removeValue { error, _ in
            print(error)
        }
        
        let alert = UIAlertController(title: "Event Deleted", message: "Event is Now removed from the list", preferredStyle: UIAlertController.Style.alert)
         alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
         self.present(alert, animated: true, completion: nil)
        deleteButton.isHidden = true
        
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
