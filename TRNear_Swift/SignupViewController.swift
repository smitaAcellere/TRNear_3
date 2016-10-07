//
//  SignupViewController.swift
//  TRNear_Swift
//
//  Created by smita on 04/10/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

import GoogleSignIn
import GGLSignIn

class SignupViewController: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate  {
    
    var userType = ""
    var loginMode = ""

    @IBOutlet weak var adidasImageView : UIImageView!

    @IBOutlet weak var facebookBtn: UIButton!
    @IBOutlet weak var googleBtn: UIButton!
    @IBOutlet weak var emailBtn: UIButton!
    @IBOutlet weak var modeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if loginMode == "Login"{
            
            facebookBtn.setBackgroundImage(UIImage(named: "sign_in_facebook")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)

            googleBtn.setBackgroundImage(UIImage(named: "sign_in_google")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)
            
            emailBtn.setBackgroundImage(UIImage(named: "sign_in_email")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)
            
            modeButton.setBackgroundImage(UIImage(named: "don-t-have-an-accoun")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)
            
        }else{
            

        }
        
    }

    @IBAction func modeButtonAction(sender: UIButton) {
        
        if loginMode == "Login"{
            self.navigationController?.popViewControllerAnimated(true)
        }else{
            
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginViewController") as! LoginViewController
            self.navigationController?.pushViewController(viewController, animated:true)
            
        }
    }
    
    @IBAction func emailButtonAction(sender: UIButton) {
        if loginMode == "Login" {
            // loginview controller
            
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginViewController") as! LoginViewController
            self.navigationController?.pushViewController(viewController, animated:true)
            
        }else{
            // Trainee Signup view
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("signupEmailVC") as! SignupWithEmailViewController
            viewController.userType = userType
            self.navigationController?.pushViewController(viewController, animated:true)
            
        }
    }
    
    @IBAction func backButtonAction(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidAppear(animated: Bool) {
        GIDSignIn.sharedInstance().uiDelegate = self
    }
    
    
    @IBAction func facebookButtonAction(sender: UIButton!) {
        
        let facebookLogin = FBSDKLoginManager()
        
        facebookLogin.logOut()
        facebookLogin.logInWithReadPermissions(["public_profile", "email", "user_friends"], fromViewController: self, handler: {(facebookResult, facebookError) -> Void in
            if facebookError != nil {
                print("Facebook login failed. Error(facebookError)")
            } else if (facebookResult?.isCancelled)! {
                print("Facebook login was cancelled.")
            } else {
                self.returnUserData();
            }
        })
    }
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: ["fields":"id,interested_in,gender,birthday,email,age_range,name,picture.width(480).height(480)"])
        
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                let id : NSString = result.valueForKey("id") as! String
                print("User ID is: \(id)")
            }
        })
    }
    
    @IBAction func googleButtonAction(sender: UIButton!) {
        print("Button tapped", terminator: "")
        
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    func signIn(signIn: GIDSignIn!, didSignInForUser user: GIDGoogleUser!,
                withError error: NSError!) {
        if (error == nil) {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            
            print(userId, terminator: "")
            print(idToken, terminator: "")
            print(fullName, terminator: "")
            print(givenName, terminator: "")
            print(familyName, terminator: "")
            print(email, terminator: "")
            
            signIn.signOut()
            
        } else {
            print("\(error.localizedDescription)", terminator: "")
        }
    }
    func signIn(signIn: GIDSignIn!, didDisconnectWithUser user:GIDGoogleUser!,
                withError error: NSError!) {
        // Perform any operations when the user disconnects from app here.
        // ...
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
