//
//  AppManualVC.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit
import MessageUI

class AppManualVC: UIViewController
{

        override func viewDidLoad()
        {
            super.viewDidLoad()

            
        }
        
    
    @IBAction func callMeButton(_ sender: UIButton)
    {
        let url:NSURL = URL(string: "TEL://6478662821")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
        
        
        @IBAction func emailMeButton(_ sender: UIButton)
        {
            if MFMailComposeViewController.canSendMail()
            {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self as! MFMailComposeViewControllerDelegate
                mail.setToRecipients(["support@gamr.com"])
                present(mail, animated: true)
                            
            }
            else
            {
                print("cannot send email")
            }
            
            func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
            {
                controller.dismiss(animated: true)
            }
            
        
        }
    
    
    override func viewWillAppear(_ animated: Bool) {
    AppDelegate.AppUtility.lockOrientation(UIInterfaceOrientationMask.portrait, andRotateTo: UIInterfaceOrientation.portrait)
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
