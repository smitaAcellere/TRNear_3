//
//  SignupWithEmailViewController.swift
//  TRNear_Swift
//
//  Created by smita on 06/10/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class SignupWithEmailViewController: UIViewController, UITextFieldDelegate{
    
    var userType = ""
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    @IBOutlet weak var txtActivationCode: UITextField!
    
    @IBOutlet weak var trainerTypeImageView: UIImageView!
    @IBOutlet weak var activationCodeDetailsView: UIView!

    @IBOutlet weak var activationCodeInfoButton: UIButton!
    @IBOutlet weak var termsOfServicesButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.txtEmail.delegate = self
        self.txtPassword.delegate = self
        self.txtConfirmPassword.delegate = self
        self.txtActivationCode.delegate = self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name:UIKeyboardWillShowNotification, object: nil);
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name:UIKeyboardWillHideNotification, object: nil);
        
        if userType == "Trainee"{
            txtActivationCode.hidden = true
            activationCodeInfoButton.hidden = true
            termsOfServicesButton.frame.origin.y = termsOfServicesButton.frame.origin.y - (activationCodeInfoButton.frame.size.height + 50)
            
            trainerTypeImageView.image = UIImage(named: "trainee_signup")?.imageWithRenderingMode(.AlwaysOriginal)
            
            print(termsOfServicesButton.frame.origin.y)
            
        }else{
            txtActivationCode.hidden = false
            activationCodeInfoButton.hidden = false
        }

    }
    
    @IBAction func infoButtonAction(sender: UIButton) {
        
//        activationCodeDetailsView.hidden = false
//        signupButton.enabled = false
    }
    
    @IBAction func closeButtonAction(sender: UIButton) {
        activationCodeDetailsView.hidden = true
        signupButton.enabled = true

    }
    @IBAction func signupButtonAction(sender: UIButton) {
        
        let parameters: [String: AnyObject] = [
            "email":txtEmail.text!,
            "password":txtPassword.text!
        ]
        
        getData("http://trnear.in/api/user/signup", parameters: parameters,completionHandler: {(responseData,error)->()in
            
            if error.code == 200{
                // Successful
                print("responseData ::: ", responseData)
                if self.userType == "Trainee"{// Trainee
                    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("traineeDashboardViewController") as! TraineeDashboardViewController
                    self.navigationController?.pushViewController(viewController, animated:true)
                }else{// Trainer
                    
                }
                
                
            }else{
                // Error
                print("Error ::: ", error)

            }
            
        })
    }
    
    @IBAction func backButtonAction(sender: UIButton) {
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
        self.txtConfirmPassword.resignFirstResponder()
        self.txtActivationCode.resignFirstResponder()
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
