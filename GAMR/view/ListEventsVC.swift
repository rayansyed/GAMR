//
//  ListEventsVC.swift
//  GAMR
//
//  Created by Rayan Syed on 2019-11-22.
//  Copyright © 2019 Rayan Syed. All rights reserved.


import UIKit
import FirebaseDatabase

class ListEventsVC: UITableViewController {
    
    var keyArray : [String] = []
    var valueArray : [Any?] = []
    var eventTitle: String = ""
    var SelectedEvent : String = ""
    var dbUsername : String = ""
    
    var eTitle : String = ""
    var eLocation : String = ""
    var eDesc : String = ""
    var eDate : String = ""
    var eHost : String = ""
    


    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        self.navigationItem

      
    }
    
    func getData()
    {
        let ref = Database.database().reference()
        ref.child("events").observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
              for child in snapshot.children {
                let snap = child as! DataSnapshot
                let key = snap.key
                let value = snap.value
                print("key = \(key)  value = \(value!)")
                self.keyArray.append(key)
                self.valueArray.append(value)
                
              }
            
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                

        SelectedEvent = keyArray[indexPath.row]
    
            let ref = Database.database().reference()
            ref.child("events").child(SelectedEvent).observeSingleEvent(of: .value, with: { (snapshot) in
            let value = snapshot.value as? NSDictionary
            self.eTitle = value?["title"] as? String ?? ""
            self.eDesc = value?["desc"] as? String ?? ""
            self.eLocation = value?["location"] as? String ?? ""
            self.eDate = value?["date"] as? String ?? ""
            self.eHost = value?["creator"] as? String ?? ""
            print(self.eTitle)
            let mainSB = UIStoryboard(name: "Main", bundle: nil)
            let detailsVC = mainSB.instantiateViewController(identifier: "detailsVC") as! ListDetailsVC;
                
            detailsVC.eTitle = self.eTitle
            detailsVC.eDate = self.eDate
            detailsVC.eDesc = self.eDesc
            detailsVC.eLocation = self.eLocation
            detailsVC.eHost = self.eHost
            detailsVC.dbUsername = self.dbUsername
            self.present(detailsVC, animated: true, completion: nil)

           // self.navigationController?.pushViewController(detailsVC, animated: true)

                

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
