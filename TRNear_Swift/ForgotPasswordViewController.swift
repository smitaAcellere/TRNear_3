//
//  ForgotPasswordViewController.swift
//  TRNear_Swift
//
//  Created by smita on 03/10/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil);
        
        self.txtEmail.delegate = self
    }
    
    @IBAction func forgotPasswordButtonAction(sender: UIButton) {
        
        let emailText = txtEmail.text
        
        if (emailText?.characters.count)! == 0{
            
            var error_message = ""
            if emailText == ""{
                error_message = "Please enter Email ID!"
            }
            alertView("Warning", message: error_message)
            
        }else if isValidEmail(emailText!) == false{
            alertView("Warning", message: "Please enter valid email address!")
        }else{
            
        }
    }
    
    @IBAction func backButtonAction(sender: UIButton!) {
        
        self.navigationController?.popViewControllerAnimated(true)

    }
    
    // MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(textField: UITextField) {
        
    }
    
    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.txtEmail.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?){
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
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
