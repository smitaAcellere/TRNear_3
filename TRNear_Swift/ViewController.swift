//
//  ViewController.swift
//  TRNear_Swift
//
//  Created by smita on 29/08/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var trainerButtonAction: UIButton!
    @IBOutlet weak var traineeButtonAction: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.navigationController?.navigationBarHidden = true;
        
//        let mask = CAShapeLayer()
//        mask.frame = trainerView.layer.bounds
//        
//        let width = trainerView.layer.frame.size.width
//        let height = trainerView.layer.frame.size.height
//        
//        let path = CGPathCreateMutable()
//        
//        CGPathMoveToPoint(path, nil, 0, height)
//        CGPathAddLineToPoint(path, nil, width, height/2)
//        CGPathAddLineToPoint(path, nil, width, 0)
//        CGPathAddLineToPoint(path, nil, 0, 0)
//
//        mask.path = path
//        trainerView.layer.mask = mask
//        
//        trainerView.clipsToBounds = true
//        
//        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(self.buttonAction(_:)))
//        
//        trainerView.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func trainerButtonAction(sender: UIButton) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("signupEmailVC") as! SignupWithEmailViewController
        viewController.userType = ""
        self.navigationController?.pushViewController(viewController, animated:true)
    }
    
    @IBAction func traineeButtonAction(sender: UIButton) {
        selectUser("Trainee",loginMode : "Signup")
    }
    
    @IBAction func loginbuttonAction(sender: UIButton) {
        selectUser("",loginMode : "Login")
    }
    
    func selectUser(userType: String, loginMode: String) {
        
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("signupVC") as! SignupViewController
        viewController.userType = userType
        viewController.loginMode = loginMode
        self.navigationController?.pushViewController(viewController, animated:true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

