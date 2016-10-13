//
//  MessengerViewController.swift
//  TRNear_Swift
//
//  Created by smita on 12/10/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit

class MessengerViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var userDetailsBackView: UIView!
    @IBOutlet weak var messagesTableView: UITableView!

    var jsonResponse : String! = nil
    
    
//    print("dictionaryString ::: ",jsonResponse)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        jsonResponse = "data:[{\"message_text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\",\"message_time\":\"2 days ago\",\"user_image\":\"\",\"user_id\":\"10\"},{\"message_text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\",\"message_time\":\"2 days ago\",\"user_image\":\"\",\"user_id\":\"11\"},{\"message_text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\",\"message_time\":\"2 days ago\",\"user_image\":\"\",\"user_id\":\"10\"},{\"message_text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\",\"message_time\":\"2 days ago\",\"user_image\":\"\",\"user_id\":\"11\"},{\"message_text\":\"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.\",\"message_time\":\"2 days ago\",\"user_image\":\"\",\"user_id\":\"10\"}]\""
        
        bottomView.addBorderTop(size: 1.0, color: GlobalVariables.Colors.border_light)
        userDetailsBackView.addBorderBottom(size: 1.0, color: GlobalVariables.Colors.border_light)
        
        messagesTableView.delegate = self
        messagesTableView.dataSource = self
        
        messagesTableView.estimatedRowHeight = 100.0
        messagesTableView.rowHeight = UITableViewAutomaticDimension
    }
    
    // MARK: - UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 7
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell
        if indexPath.row % 2 == 0{
            cell = self.messagesTableView.dequeueReusableCellWithIdentifier("leftRowCellIdentifier") as! MessagesRowCell
        }else{
            
            cell = self.messagesTableView.dequeueReusableCellWithIdentifier("rightRowCellIdentifier") as! MessagesRowCell
        }
        
        
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
