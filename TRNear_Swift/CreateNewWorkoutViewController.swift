//
//  CreateNewWorkoutViewController.swift
//  TRNear_Swift
//
//  Created by smita on 30/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit

class CreateNewWorkoutViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var workoutTypeTableView: UITableView!
    
    var workoutTypeDataArray = ["Functional Training","Weight/Resistance","Bodyweight Fitness", "Yoga", "Dance & Aerobics", "Group Training", "Bootcamp", "HIT", "Rehab", "Deals & Pramotions", "Other"];

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default

        self.workoutTypeTableView.delegate = self
        self.workoutTypeTableView.dataSource = self
        
    }
    
    //    Delegate and Datasource methods of UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.workoutTypeDataArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.layoutMargins = UIEdgeInsetsZero
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.workoutTypeDataArray[indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(18)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
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
