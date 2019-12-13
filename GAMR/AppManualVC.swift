//
//  AppManualVC.swift
//  GAMR
//
//  Created by Mac on 2019-11-18.
//  Copyright © 2019 Rayan Syed. All rights reserved.
//

import UIKit
import MessageUI
import CallKit

class AppManualVC: UIViewController
{

        override func viewDidLoad()
        {
            super.viewDidLoad()

            
        }
        
    
    @IBAction func callMeButton(_ sender: UIButton)
    {
        let url:NSURL = URL(string: "TEL://18001114267")! as NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
    }
        
        
        @IBAction func emailMeButton(_ sender: UIButton)
        {
            
        
            if MFMailComposeViewController.canSendMail()
            {
                let mail = MFMailComposeViewController()
                mail.mailComposeDelegate = self as? MFMailComposeViewControllerDelegate
                mail.setToRecipients(["abc@gmail.com","xyz@gmail.com"])
                mail.setMessageBody("<h1>Hello there, This is a test.<h1>", isHTML: true)
                present(mail, animated: true)
                
            }
            else
            {
                print("Cannot send email")
            }
            func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?)
            {
                controller.dismiss(animated: true)
            }
            
            
        
        }
    
    
    @IBAction func doMessage(){
        
        if MFMessageComposeViewController.canSendText(){

            let messageVC = MFMessageComposeViewController()
            
            var phoneNumber : String = "TEL://18001114267"
            
            
            //set the message properties
            messageVC.body = "Hello Support, "
            //list of contact numbers to sent message to
            messageVC.recipients = ["\(phoneNumber)"]
            
            messageVC.messageComposeDelegate = self as? MFMessageComposeViewControllerDelegate
            
            self.present(messageVC, animated: true, completion: nil)
        }else{
            print("Can't send the messsage")
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
