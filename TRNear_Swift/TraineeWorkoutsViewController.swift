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
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default

        workoutTableView.delegate = self
        workoutTableView.dataSource = self
        workoutTableView.tag = 100
    }
    
    @IBAction func upcomingButtonAction(sender: UIButton!) {
        
        upcomingFlag = true
        favoriteFlag = false
        pastFlag = false
        
        workoutTableView.tag = 100
        workoutTableView.reloadData()
        
//        upcomingButton.titleLabel?.textColor = UIColor.blackColor()
        upcomingButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        upcomingButton.titleLabel!.font =  UIFont.boldSystemFontOfSize(18)

        favoriteButton.setTitleColor(GlobalVariables.Colors.border_light, forState: UIControlState.Normal)
        favoriteButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)

        pastButton.setTitleColor(GlobalVariables.Colors.border_light, forState: UIControlState.Normal)
        pastButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)


    }
    
    @IBAction func favoriteButtonAction(sender: UIButton!) {
        
        upcomingFlag = false
        favoriteFlag = true
        pastFlag = false
        
        workoutTableView.tag = 300
        workoutTableView.reloadData()
        
        upcomingButton.setTitleColor(GlobalVariables.Colors.border_light, forState: UIControlState.Normal)
        upcomingButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)

        favoriteButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        favoriteButton.titleLabel!.font =  UIFont.boldSystemFontOfSize(18)

        pastButton.setTitleColor(GlobalVariables.Colors.border_light, forState: UIControlState.Normal)
        pastButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)

        
    }
    
    @IBAction func pastButtonAction(sender: UIButton!) {
        
        upcomingFlag = false
        favoriteFlag = false
        pastFlag = true
        
        workoutTableView.tag = 200
        workoutTableView.reloadData()
        
        upcomingButton.setTitleColor(GlobalVariables.Colors.border_light, forState: UIControlState.Normal)
        upcomingButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)

        favoriteButton.setTitleColor(GlobalVariables.Colors.border_light, forState: UIControlState.Normal)
        favoriteButton.titleLabel!.font =  UIFont(name: "Helvetica", size: 18)

        pastButton.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        pastButton.titleLabel!.font =  UIFont.boldSystemFontOfSize(18)

    }
    
//    Delegate and Datasource methods of UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if self.workoutTableView.tag == 100
        {
            return 2
        }else if self.workoutTableView.tag == 200{
            return 5
        }else if self.workoutTableView.tag == 300{
            return 3
        }else{
            return 0
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        if self.workoutTableView.tag == 300
        {
            return 335
        }else{
            return 100
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell
        
        if self.workoutTableView.tag == 300
        {
            cell = self.workoutTableView.dequeueReusableCellWithIdentifier("favoriteCellIdentifier") as! WorkoutTableViewCell
            
            let infoViewPos = UIView.viewFromNibName("favoritesCustomView") as? favoritesCustomView
            infoViewPos?.frame = CGRect(x: 20, y: 20, width: cell.contentView.frame.width-40, height: cell.contentView.frame.height-20)
            infoViewPos?.baseBackView.layer.borderColor = GlobalVariables.Colors.border_light.CGColor
            infoViewPos?.layer.borderWidth = 1.0
            infoViewPos?.layer.borderColor = GlobalVariables.Colors.border_light.CGColor
            infoViewPos?.baseBackView.layer.borderWidth = 1.0
                        
            cell.contentView.addSubview(infoViewPos!)
            
        }else{
            cell = self.workoutTableView.dequeueReusableCellWithIdentifier("CellIdentifier") as! WorkoutTableViewCell
        }
        
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        if self.workoutTableView.tag == 300
        {
            
        }else{
        
            let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("workoutDetailsVC") as! WorkoutDetailsViewController
            self.navigationController?.pushViewController(viewController, animated:true)
        }
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
