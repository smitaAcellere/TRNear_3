//
//  LoginViewController.swift
//  TRNear_Swift
//
//  Created by smita on 13/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logInButtonAction(sender: UIButton!) {
        
        // check here.. User is Trainee or Trainer        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("traineeDashboardViewController") as! TraineeDashboardViewController
        self.navigationController?.pushViewController(viewController, animated:true)
    }
    
    @IBAction func forgotPasswordButtonAction(sender: UIButton!) {

    }
    
    @IBAction func backToSignupAction(sender: UIButton!) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
