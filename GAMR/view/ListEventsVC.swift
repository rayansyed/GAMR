//
//  ListEventsVC.swift
//  GAMR
//
//  Created by Rayan Syed on 2019-11-22.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ListEventsVC: UITableViewController {
    
    var keyArray : [String] = []
    var eventTitle: String = ""
    


    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = Database.database().reference()
        ref.child("events").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
              for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                let value = snap.value
                print("key = \(key)  value = \(value!)")
                self.keyArray.append(key)
                
              }
            
            print(self.keyArray)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }

            }) { (error) in
              print(error.localizedDescription)
          }
    
    
        
      
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        return keyArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customcell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = keyArray[indexPath.item]
        cell.textLabel?.textColor = UIColor.white

        return cell
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
