//
//  TraineeHomeViewController.swift
//  TRNear_Swift
//
//  Created by smita on 16/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit


class TraineeHomeViewController: UIViewController,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
    var mainScrollView = UIScrollView()
    let height = CGFloat(324.0)
    var width = CGFloat(0)
    var numPages: Int = 3
    
    var profileDataArray = ["Add a profile Image","Add a payment method","Set your fitness goals"];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default

        width = self.view.frame.size.width - 34
        
        // Main Scrollview
        self.mainScrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.mainScrollView.bounces = false
        self.mainScrollView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(self.mainScrollView)
        
        let welcomeLable = UILabel(frame: CGRect(x: 20, y: 41, width: self.view.frame.size.width-40, height: 33))
        welcomeLable.textAlignment = NSTextAlignment.Center
        welcomeLable.backgroundColor = UIColor.clearColor()
        welcomeLable.text = "Welcome Back"
        welcomeLable.font = UIFont.boldSystemFontOfSize(24)
        self.mainScrollView.addSubview(welcomeLable)
        
        let usernameLable = UILabel(frame: CGRect(x: 20, y: 74, width: self.view.frame.size.width-40, height: 33))
        usernameLable.textAlignment = NSTextAlignment.Center
        usernameLable.backgroundColor = UIColor.clearColor()
        usernameLable.text = "Rachel Turner"
        usernameLable.font = UIFont.boldSystemFontOfSize(24)
        self.mainScrollView.addSubview(usernameLable)
        
        // Upcoming Workouts
        let upcomingWorkoutsLable = UILabel(frame: CGRect(x: 12, y: 148, width: self.view.frame.size.width-24, height: 24))
        upcomingWorkoutsLable.textAlignment = NSTextAlignment.Left
        upcomingWorkoutsLable.backgroundColor = UIColor.clearColor()
        upcomingWorkoutsLable.text = "Upcoming Workouts"
        upcomingWorkoutsLable.font = UIFont.boldSystemFontOfSize(18)
        self.mainScrollView.addSubview(upcomingWorkoutsLable)
        
        let upcomingScrollView = UIScrollView(frame:CGRect(x: 0, y: 182, width: self.view.frame.size.width+5, height: height))
        upcomingScrollView.bounces = false
        upcomingScrollView.backgroundColor = UIColor.whiteColor()
        upcomingScrollView.pagingEnabled = true
        upcomingScrollView.delegate = self
        self.mainScrollView.addSubview(upcomingScrollView)
        
        var x = CGFloat(12)
        
        var infoView : UIView!
        for _ in 0..<numPages {
            
            infoView = UIView.viewFromNibName("workoutCustomView") as? workoutCustomView
            infoView?.frame = CGRect(x: x, y: 0, width: width, height: height)
            infoView?.layer.borderColor = GlobalVariables.Colors.border_light.CGColor
            infoView?.layer.borderWidth = 1.0
            upcomingScrollView.addSubview(infoView!);
            
            x += width + 10
        }
        
        upcomingScrollView.contentSize = CGSize(width: (infoView.frame.width*3 + 60),height: height)
        
        // Popular Workouts
        let popularWorkoutsLable = UILabel(frame: CGRect(x: 12, y: 556, width: self.view.frame.size.width-24, height: 24))
        popularWorkoutsLable.textAlignment = NSTextAlignment.Left
        popularWorkoutsLable.backgroundColor = UIColor.clearColor()
        popularWorkoutsLable.text = "Popular Workouts"
        popularWorkoutsLable.font = UIFont.boldSystemFontOfSize(18)
        self.mainScrollView.addSubview(popularWorkoutsLable)
        
        let popularScrollView = UIScrollView(frame:CGRect(x: 0, y: 590, width: self.view.frame.size.width+5, height: height))
        popularScrollView.bounces = false
        popularScrollView.backgroundColor = UIColor.clearColor()
        popularScrollView.pagingEnabled = true
        popularScrollView.delegate = self
        self.mainScrollView.addSubview(popularScrollView)
        
        var x_pos = CGFloat(12)
        
        var infoView_pos : UIView!
        for _ in 0..<numPages {
            
            infoView_pos = UIView.viewFromNibName("favoritesCustomView") as? favoritesCustomView
            infoView_pos?.frame = CGRect(x: x_pos, y: 0, width: width, height: height)
            infoView_pos?.layer.borderColor = GlobalVariables.Colors.border_light.CGColor
//            infoView_pos?.favoriteButton.hidden = true
            infoView_pos?.layer.borderWidth = 1.0
            popularScrollView.addSubview(infoView_pos!);
            
            x_pos += width + 10
        }
        popularScrollView.contentSize = CGSize(width: (infoView_pos.frame.width*3 + 60),height: height)

        // Recommended Workouts
        let recommendedWorkoutsLable = UILabel(frame: CGRect(x: 12, y: 964, width: self.view.frame.size.width-24, height: 24))
        recommendedWorkoutsLable.textAlignment = NSTextAlignment.Left
        recommendedWorkoutsLable.backgroundColor = UIColor.clearColor()
        recommendedWorkoutsLable.text = "Recommended Workouts"
        recommendedWorkoutsLable.font = UIFont.boldSystemFontOfSize(18)
        self.mainScrollView.addSubview(recommendedWorkoutsLable)
        
        let recommendedScrollView = UIScrollView(frame:CGRect(x: 0, y: 998, width: self.view.frame.size.width+5, height: height))
        recommendedScrollView.contentSize = CGSize(width: (self.view.frame.size.width+5)*3,height: height)
        recommendedScrollView.bounces = false
        recommendedScrollView.backgroundColor = UIColor.clearColor()
        recommendedScrollView.pagingEnabled = true
        recommendedScrollView.delegate = self
        self.mainScrollView.addSubview(recommendedScrollView)
        
        var xPos = CGFloat(12)
        
        var infoViewPos : UIView!
        for _ in 0..<numPages {
            
            infoViewPos = UIView.viewFromNibName("favoritesCustomView") as? favoritesCustomView
            infoViewPos?.frame = CGRect(x: xPos, y: 0, width: width, height: height)
            infoViewPos?.layer.borderColor = GlobalVariables.Colors.border_light.CGColor
//            infoViewPos?.favoriteButton.hidden = true
            infoViewPos?.layer.borderWidth = 1.0
            recommendedScrollView.addSubview(infoViewPos!);
            
            xPos += width + 10
        }
        recommendedScrollView.contentSize = CGSize(width: (infoViewPos.frame.width*3 + 60),height: height)
        
        self.mainScrollView.contentSize = CGSize(width: self.view.frame.size.width,height:height*5.5)

        // Incomplete Profile
        
        let formattedString = NSMutableAttributedString()
        formattedString.normal("Your Profile is ").bold("10%").normal(" complete")
        
        let profileStatusLable = UILabel(frame: CGRect(x: 12, y: recommendedScrollView.frame.maxY + 50, width: self.view.frame.size.width-24, height: 30))
        profileStatusLable.textAlignment = NSTextAlignment.Center
        profileStatusLable.backgroundColor = UIColor.clearColor()
        profileStatusLable.font = UIFont(name: "Helvetica", size: 22)
        profileStatusLable.attributedText = formattedString
        self.mainScrollView.addSubview(profileStatusLable)
        
        let profileStatusSubLable = UILabel(frame: CGRect(x: 20, y: profileStatusLable.frame.maxY, width: self.view.frame.size.width-40, height: 60))
        profileStatusSubLable.textAlignment = NSTextAlignment.Center
        profileStatusSubLable.backgroundColor = UIColor.clearColor()
        profileStatusSubLable.text = "Here are few things to do to improve your experience"
        profileStatusSubLable.font = UIFont(name: "Helvetica", size: 14)
        profileStatusSubLable.numberOfLines = 2
        self.mainScrollView.addSubview(profileStatusSubLable)
        
        let profileDetailsTableView = UITableView(frame: CGRect(x: 0, y: profileStatusSubLable.frame.maxY + 20, width: self.view.frame.size.width, height: 44*3))
        profileDetailsTableView.delegate = self
        profileDetailsTableView.dataSource = self
        self.mainScrollView.addSubview(profileDetailsTableView)
        
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth:Float = Float(width + 12);
        let currentOffSet:Float = Float(scrollView.contentOffset.x)
        let targetOffSet:Float = Float(targetContentOffset.memory.x)
        var newTargetOffset:Float = 0
        
        if(targetOffSet > currentOffSet){
            newTargetOffset = ceilf(currentOffSet / pageWidth) * pageWidth
        }else{
            newTargetOffset = floorf(currentOffSet / pageWidth) * pageWidth
        }
        
        if(newTargetOffset < 0){
            newTargetOffset = 0;
        }else if (newTargetOffset > Float(scrollView.contentSize.width)){
            newTargetOffset = Float(scrollView.contentSize.width)
        }
        
        targetContentOffset.memory.x = CGFloat(currentOffSet)
        scrollView.setContentOffset(CGPointMake(CGFloat(newTargetOffset), 0), animated: true)
        
    }
    
    //    Delegate and Datasource methods of UITableView
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profileDataArray.count
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "cell")
        cell.layoutMargins = UIEdgeInsetsZero
        cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        cell.textLabel?.text = self.profileDataArray[indexPath.row]
        cell.textLabel?.font = UIFont.boldSystemFontOfSize(18)
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension NSMutableAttributedString {
    func bold(text:String) -> NSMutableAttributedString {
        let attrs:[String:AnyObject] = [NSFontAttributeName : UIFont(name: "Helvetica-Bold", size: 22)!]
        let boldString = NSMutableAttributedString(string:"\(text)", attributes:attrs)
        self.appendAttributedString(boldString)
        return self
    }
    
    func normal(text:String)->NSMutableAttributedString {
        let normal =  NSAttributedString(string: text)
        self.appendAttributedString(normal)
        return self
    }
}
