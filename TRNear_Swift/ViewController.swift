//
//  ViewController.swift
//  TRNear_Swift
//
//  Created by smita on 29/08/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

import GoogleSignIn
import GGLSignIn

class ViewController: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate {

    @IBOutlet weak var adidasImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBarHidden = true;
        
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


}

