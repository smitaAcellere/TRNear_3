//
//  LoginViewController.swift
//  TRNear_Swift
//
//  Created by smita on 13/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit
import AFNetworking

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.txtEmail.delegate = self
        self.txtPassword.delegate = self
        
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil);
//        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil);

    }
    
    @IBAction func logInButtonAction(sender: UIButton!) {
        
        let emailText = txtEmail.text
        let passwordText = txtPassword.text
        
        if (emailText?.characters.count)! == 0 || (passwordText?.characters.count)! == 0{
            
            var error_message = ""
            if emailText == "" && passwordText == ""{
                error_message = "Please enter all the fields."
            }else if emailText == ""{
                error_message = "Please enter Email ID!"
            }else if passwordText == ""{
                error_message = "Please enter Password!"
            }
            alertView("Warning", message: error_message)
            
        }else if isValidEmail(emailText!) == false{
            alertView("Warning", message: "Please enter valid email address!")
        }else if passwordText?.characters.count <= 6 || passwordText?.characters.count >= 15{
            alertView("Warning", message: "Password should be minimum 6 and maximum 15 characters!")
        }else{
            
            /*
            getData("http://trnear.in/api/user/signup", parameters: "",completionHandler: {(responseData,error)->()in
                
                if error.code == 200{
                    // Successful
                    print("responseData ::: ", responseData)
                    
                    // check.. User is Trainee or Trainer
                    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("traineeDashboardViewController") as! TraineeDashboardViewController
                    self.navigationController?.pushViewController(viewController, animated:true)
                    
                }else{
                    // Error
                }
                
            })*/
        }
    }
    
    @IBAction func forgotPasswordButtonAction(sender: UIButton!) {

    }
    
    @IBAction func backToSignupAction(sender: UIButton!) {
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
        self.txtPassword.resignFirstResponder()
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
