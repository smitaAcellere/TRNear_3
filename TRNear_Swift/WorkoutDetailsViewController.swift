//
//  WorkoutDetailsViewController.swift
//  TRNear_Swift
//
//  Created by smita on 30/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit
import MapKit

class WorkoutDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,MKMapViewDelegate {

    @IBOutlet weak var dateTimeBackgroundView: UIView!
    @IBOutlet weak var dateBackgroundView: UIView!
    @IBOutlet weak var priceBackgroundView: UIView!
    @IBOutlet weak var locationbackView: UIView!
    @IBOutlet weak var aboutBackView: UIView!
    @IBOutlet weak var workoutDetailsTableView: UITableView!
    
    @IBOutlet weak var closeBarBtn: UIBarButtonItem!
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    
    var workoutDetailsDataArray = ["Methodology/Philosophy",
                                   "Certificate Information",
                                   "Training Rules",
                                   "Gym Membership Information",
                                   "10 Reviews",
                                   "",
                                   "Cancellation Policy"];

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.        
        UIApplication.sharedApplication().statusBarView?.backgroundColor = UIColor.clearColor()
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        
        workoutDetailsTableView.delegate = self
        workoutDetailsTableView.dataSource = self
        
        self.mainScrollView.contentSize = CGSize(width: self.view.frame.size.width,height:self.view.frame.height*2);
        
        dateTimeBackgroundView.addBorderTop(size: 2.0, color: GlobalVariables.Colors.border_light)
        dateTimeBackgroundView.addBorderBottom(size: 2.0, color: GlobalVariables.Colors.border_light)
        dateBackgroundView.addBorderRight(size: 2.0, color: GlobalVariables.Colors.border_light)
        locationbackView.addBorderBottom(size: 2.0, color: GlobalVariables.Colors.border_light)
        aboutBackView.addBorderBottom(size: 2.0, color: GlobalVariables.Colors.border_light)
        
        let cancelWorkoutButton: UIButton = UIButton()
        cancelWorkoutButton.frame = CGRectMake(0, self.view.frame.size.height-50, self.view.frame.size.width, 50)
        cancelWorkoutButton.setBackgroundImage(UIImage(named: "cancel-button")?.imageWithRenderingMode(.AlwaysOriginal), forState: .Normal)
        self.view.addSubview(cancelWorkoutButton)
        

    }
    
// MARK: - UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if indexPath.row == 5
        {
            return 250
        }else{
            return 53
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.layoutMargins = UIEdgeInsetsZero
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.workoutDetailsDataArray[indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(18)
        
        if indexPath.row == 4{
            
        }
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
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

