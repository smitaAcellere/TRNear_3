//
//  TraineeWorkoutsViewController.swift
//  TRNear_Swift
//
//  Created by smita on 20/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit

class TraineeWorkoutsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var workoutTableView : UITableView!
    
    @IBOutlet weak var upcomingButton : UIButton!
    @IBOutlet weak var favoriteButton : UIButton!
    @IBOutlet weak var pastButton : UIButton!
    
    var upcomingFlag : Bool = true
    var favoriteFlag : Bool = false
    var pastFlag : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        workoutTableView.tag = 100
        
        upcomingButton.titleLabel!.font =  UIFont.boldSystemFontOfSize(18)
    }
    
    @IBAction func upcomingButtonAction(sender: UIButton!) {
        
        upcomingFlag = true
        favoriteFlag = false
        pastFlag = false
        
        workoutTableView.tag = 100
        workoutTableView.reloadData()
        
        upcomingButton.titleLabel?.textColor = UIColor.blackColor()
        upcomingButton.titleLabel!.font =  UIFont.boldSystemFontOfSize(18)

        favoriteButton.titleLabel?.textColor = GlobalVariables.Colors.border_light
        favoriteButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)

        pastButton.titleLabel?.textColor = GlobalVariables.Colors.border_light
        pastButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)


    }
    
    @IBAction func favoriteButtonAction(sender: UIButton!) {
        
        upcomingFlag = false
        favoriteFlag = true
        pastFlag = false
        
        workoutTableView.tag = 1
        workoutTableView.reloadData()
        
        upcomingButton.titleLabel?.textColor = GlobalVariables.Colors.border_light
        upcomingButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)

        favoriteButton.titleLabel?.textColor = UIColor.blackColor()
        favoriteButton.titleLabel!.font =  UIFont.boldSystemFontOfSize(18)

        pastButton.titleLabel?.textColor = GlobalVariables.Colors.border_light
        pastButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)

        
    }
    
    @IBAction func pastButtonAction(sender: UIButton!) {
        
        upcomingFlag = false
        favoriteFlag = false
        pastFlag = true
        
        workoutTableView.tag = 200
        workoutTableView.reloadData()
        
        upcomingButton.titleLabel?.textColor = GlobalVariables.Colors.border_light
        upcomingButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)

        favoriteButton.titleLabel?.textColor = GlobalVariables.Colors.border_light
        favoriteButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)

        pastButton.titleLabel?.textColor = UIColor.blackColor()
        pastButton.titleLabel!.font =  UIFont.boldSystemFontOfSize(18)

    }
    
//    Delegate and Datasource methods of UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.workoutTableView.tag == 100
        {
            return 2
        }else if self.workoutTableView.tag == 200{
            return 5
        }else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = self.workoutTableView.dequeueReusableCellWithIdentifier("CellIdentifier") as! WorkoutTableViewCell
        
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
