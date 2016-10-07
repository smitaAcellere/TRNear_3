//
//  SelectionViewController.swift
//  TRNear_Swift
//
//  Created by smita on 04/10/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit

class SelectionViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var trainerBtn: UIButton!
    @IBOutlet weak var traineeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func trainerBtnAction(sender: UIButton) {
        selectUser("Trainer")
    }

    @IBAction func traineeBtnAction(sender: UIButton) {
        selectUser("Trainee")
    }
    
    func selectUser(valueToPass: String) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("signupVC") as! SignupViewController
//        viewController.valueToPass = valueToPass
        self.navigationController?.pushViewController(viewController, animated:true)
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
