//
//  SignupViewController.swift
//  TRNear_Swift
//
//  Created by smita on 04/10/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    var valueToPass = ""

    @IBOutlet weak var selectionLbl: UILabel!
    @IBOutlet weak var selectionLbl2: UILabel!
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtActivationCode: UITextField!
    @IBOutlet weak var dividerLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if valueToPass == "Trainee"{
            txtActivationCode.hidden = true
            dividerLbl.hidden = true
        }else{
            selectionLbl.text = "I'm here to help people get fit."
            selectionLbl2.text = "Sign up as a personal trainer."
        }
    }

    @IBAction func backButtonAction(sender: UIButton) {
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
