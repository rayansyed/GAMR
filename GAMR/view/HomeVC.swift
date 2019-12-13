//
//  HomeVC.swift
//  GAMR
//
//  Created by Rayan Syed on 2019-11-25.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {
    var dbUsername : String = ""


    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated:true);

        let accountTB = UIBarButtonItem(image: UIImage(named: "pub.png"), style: .done, target: self, action: #selector(tapAccount))
        let listTB = UIBarButtonItem(image: UIImage(named: "list.png"), style: .done, target: self, action: #selector(tapList))
        let craftTB = UIBarButtonItem(image: UIImage(named: "craft.png"), style: .done, target: self, action: #selector(tapCreate))
        let exploreTB = UIBarButtonItem(image: UIImage(named: "explore.png"), style: .done, target: self, action: #selector(tapMap))
               // self.navigationItem.rightBarButtonItems = [test,test2,test3,test4,test5]
        self.toolbarItems = [accountTB, listTB, craftTB, exploreTB]
            
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
        let createVC = mainSB.instantiateViewController(withIdentifier: "CreateScene") as! CreateEventVC
        createVC.modalPresentationStyle = .fullScreen
        createVC.dbUsername = self.dbUsername
        self.navigationController?.pushViewController(createVC, animated: true)
    }
    func openListScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let listVC = mainSB.instantiateViewController(withIdentifier: "ListScene") as! ListEventsVC
        listVC.modalPresentationStyle = .fullScreen
        listVC.dbUsername = self.dbUsername
        self.navigationController?.pushViewController(listVC, animated: true)
    }
    func openMapScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mapVC = mainSB.instantiateViewController(withIdentifier: "MapScene") as! EventMapVC
        mapVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(mapVC, animated: true)
    }
    func openAccountScene()
    {
        let mainSB : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let accountVC = mainSB.instantiateViewController(withIdentifier: "AccountScene") as! AccountVC
        accountVC.modalPresentationStyle = .fullScreen
        accountVC.dbUsername = self.dbUsername
        self.navigationController?.pushViewController(accountVC, animated: true)
    }

}
