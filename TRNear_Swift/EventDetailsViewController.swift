//
//  EventDetailsViewController.swift
//  TRNear_Swift
//
//  Created by smita on 13/10/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit

class EventDetailsViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    var dateString : String!
    @IBOutlet weak var dateBackground: UIView!
    @IBOutlet weak var eventTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("dateString :: ",dateString)
        
        eventTableView.dataSource = self
        eventTableView.delegate = self
        
        dateBackground.addBorderBottom(size: 1.0, color: GlobalVariables.Colors.border_light)

    }

    @IBAction func backBarButton(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    //    Delegate and Datasource methods of UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 335
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell
        
            cell = self.eventTableView.dequeueReusableCellWithIdentifier("workoutCellIdentifier") as! WorkoutTableViewCell
            
            let infoViewPos = UIView.viewFromNibName("workoutCustomView") as? workoutCustomView
            infoViewPos?.frame = CGRect(x: 20, y: 20, width: cell.contentView.frame.width-40, height: cell.contentView.frame.height-20)
//            infoViewPos?.baseBackView.layer.borderColor = GlobalVariables.Colors.border_light.CGColor
            infoViewPos?.layer.borderWidth = 1.0
            infoViewPos?.layer.borderColor = GlobalVariables.Colors.border_light.CGColor
//            infoViewPos?.baseBackView.layer.borderWidth = 1.0
        
            cell.contentView.addSubview(infoViewPos!)
            
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
