//
//  WorkoutDetailsViewController.swift
//  TRNear_Swift
//
//  Created by smita on 30/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit

class WorkoutDetailsViewController: UIViewController {

    @IBOutlet weak var closeBarBtn: UIBarButtonItem!
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.        
        UIApplication.sharedApplication().statusBarView?.backgroundColor = UIColor.clearColor()
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        
        self.mainScrollView.contentSize = CGSize(width: self.view.frame.size.width,height:self.view.frame.height*2);
    }
    
    @IBAction func closeBarBtnAction(sender: UIButton!) {
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

extension UIApplication {
    var statusBarView: UIView? {
//        return value(forKey: "statusBar") as? UIView
        return valueForKey("statusBar") as? UIView
    }
}

