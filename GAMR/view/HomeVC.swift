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

        let accountTB = UIBarButtonItem(image: UIImage(named: "pub.png"), style: .done, target: self, action: #selector(tapAccount))
        let listTB = UIBarButtonItem(image: UIImage(named: "list.png"), style: .done, target: self, action: #selector(tapList))
        let craftTB = UIBarButtonItem(image: UIImage(named: "craft.png"), style: .done, target: self, action: #selector(tapCreate))
        let exploreTB = UIBarButtonItem(image: UIImage(named: "explore.png"), style: .done, target: self, action: #selector(tapMap))
               // self.navigationItem.rightBarButtonItems = [test,test2,test3,test4,test5]
        self.toolbarItems = [accountTB, listTB, craftTB, exploreTB]
        
    
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
    @objc func tapAccount(){
        openAccountScene()
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
    func openAccountScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let homeVC = mainSB.instantiateViewController(withIdentifier: "AccountScene") as! AccountVC
        homeVC.modalPresentationStyle = .fullScreen
        //self.present(homeVC, animated: true, completion: nil)
        self.navigationController?.pushViewController(homeVC, animated: true)
    }

}
