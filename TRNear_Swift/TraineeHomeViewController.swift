//
//  TraineeHomeViewController.swift
//  TRNear_Swift
//
//  Created by smita on 16/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit


class TraineeHomeViewController: UIViewController,UIScrollViewDelegate {
    
    var mainScrollView = UIScrollView()
    let upcomingScrollView = UIScrollView()
    let height = CGFloat(324.0)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        self.mainScrollView.addSubview(upcomingScrollView)
        
        var x = CGFloat(12)
        let width = self.view.frame.size.width - x - x - 10
        
        var infoView : UIView!
        for _ in 0..<3 {
            
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
        self.mainScrollView.addSubview(popularScrollView)
        
        var x_pos = CGFloat(12)
        let width_pos = self.view.frame.size.width - x_pos - x_pos - 10
        
        var infoView_pos : UIView!
        for _ in 0..<3 {
            
            infoView_pos = UIView.viewFromNibName("favoritesCustomView") as? favoritesCustomView
            infoView_pos?.frame = CGRect(x: x_pos, y: 0, width: width_pos, height: height)
            infoView_pos?.layer.borderColor = GlobalVariables.Colors.border_light.CGColor
            infoView_pos?.layer.borderWidth = 1.0
            popularScrollView.addSubview(infoView_pos!);
            
            x_pos += width_pos + 10
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
        self.mainScrollView.addSubview(recommendedScrollView)
        
        var xPos = CGFloat(12)
        let widthPos = self.view.frame.size.width - xPos - xPos - 10
        
        var infoViewPos : UIView!
        for _ in 0..<3 {
            
            infoViewPos = UIView.viewFromNibName("favoritesCustomView") as? favoritesCustomView
            infoViewPos?.frame = CGRect(x: xPos, y: 0, width: widthPos, height: height)
            infoViewPos?.layer.borderColor = GlobalVariables.Colors.border_light.CGColor
            infoViewPos?.layer.borderWidth = 1.0
            recommendedScrollView.addSubview(infoViewPos!);
            
            xPos += widthPos + 10
        }
        recommendedScrollView.contentSize = CGSize(width: (infoViewPos.frame.width*3 + 60),height: height)
        
        self.mainScrollView.contentSize = CGSize(width: self.view.frame.size.width,height:height*5)

        // Incomplete Profile
        
        let profileStatusLable = UILabel(frame: CGRect(x: 12, y: recommendedScrollView.frame.maxY + 50, width: self.view.frame.size.width-24, height: 30))
        profileStatusLable.textAlignment = NSTextAlignment.Center
        profileStatusLable.backgroundColor = UIColor.clearColor()
        profileStatusLable.text = "Your Profile is 10% complete"
        profileStatusLable.font = UIFont.boldSystemFontOfSize(24)
        self.mainScrollView.addSubview(profileStatusLable)
        
        let profileStatusSubLable = UILabel(frame: CGRect(x: 20, y: profileStatusLable.frame.maxY, width: self.view.frame.size.width-40, height: 30))
        profileStatusSubLable.textAlignment = NSTextAlignment.Center
        profileStatusSubLable.backgroundColor = UIColor.clearColor()
        profileStatusSubLable.text = "Here are few things to do to improve your experience"
        profileStatusSubLable.font = UIFont(name: "Helvetica", size: 14)
        profileStatusSubLable.numberOfLines = 2
        self.mainScrollView.addSubview(profileStatusSubLable)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
