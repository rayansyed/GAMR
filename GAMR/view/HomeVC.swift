//
//  HomeVC.swift
//  GAMR
//
//  Created by Rayan Syed on 2019-11-25.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

         self.navigationItem.setHidesBackButton(true, animated:true);

         navigationController?.navigationBar.isTranslucent = true
         navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
         navigationController?.navigationBar.shadowImage = UIImage() //remove pesky 1 pixel line
         navigationController?.navigationBar.tintColor = UIColor(red:1.00, green:0.38, blue:0.85, alpha:1.0)

                let test = UIBarButtonItem(image: UIImage(named: "pub.png"), style: .done, target: self, action: #selector(tapCreate))
                let test2 = UIBarButtonItem(image: UIImage(named: "list.png"), style: .done, target: self, action: #selector(tapList))
                let test3 = UIBarButtonItem(image: UIImage(named: "craft.png"), style: .done, target: self, action: #selector(tapCreate))
                let test4 = UIBarButtonItem(image: UIImage(named: "explore.png"), style: .done, target: self, action: #selector(tapMap))
                let test5 = UIBarButtonItem(image: UIImage(named: "home.png"), style: .done, target: self, action: #selector(tapHome))


                self.navigationItem.rightBarButtonItems = [test,test2,test3,test4,test5]
        
      

        


        // Do any additional setup after loading the view.
    }
    
    
    @objc func tapCreate(){
        openCreateScene()
    }
    @objc func tapMap(){
        openMapScene()
    }
    @objc func tapHome(){
        openCreateScene()
    }
    @objc func tapList(){
        openListScene()
    }


    func openCreateScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = mainSB.instantiateViewController(withIdentifier: "CreateScene") as! CreateEventVC
        homeVC.modalPresentationStyle = .fullScreen
        //self.present(homeVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    func openListScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = mainSB.instantiateViewController(withIdentifier: "ListScene") as! ListEventsVC
        homeVC.modalPresentationStyle = .fullScreen
        //self.present(homeVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(homeVC, animated: true)
    }
    func openMapScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = mainSB.instantiateViewController(withIdentifier: "MapScene") as! EventMapVC
        homeVC.modalPresentationStyle = .fullScreen
        //self.present(homeVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(homeVC, animated: true)
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
