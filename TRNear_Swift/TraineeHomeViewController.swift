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
        
        print("page1 - Current Number = \(GlobalVariables.Colors.border_light)")

        // Main Scrollview
        self.mainScrollView.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        self.mainScrollView.bounces = false
        self.mainScrollView.backgroundColor = UIColor.clearColor()
        self.mainScrollView.contentSize = CGSize(width: self.view.frame.size.width,height: height*6)
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
        upcomingScrollView.contentSize = CGSize(width: (self.view.frame.size.width)*3,height: height)
        upcomingScrollView.bounces = false
        upcomingScrollView.backgroundColor = UIColor.whiteColor()
        upcomingScrollView.pagingEnabled = true
        self.mainScrollView.addSubview(upcomingScrollView)
        
        var x = CGFloat(12)
        let width = self.view.frame.size.width - x - x - 10
        
        for _ in 0..<3 {
            
            let contentView = UIView()
            contentView.frame = CGRect(x: x, y: 0, width: width, height: height)
            contentView.layer.borderColor = GlobalVariables.Colors.border_light.CGColor
            contentView.layer.borderWidth = 1.0
            upcomingScrollView.addSubview(contentView)
            
            x += width + 10
        }
        
        // Popular Workouts
        let popularWorkoutsLable = UILabel(frame: CGRect(x: 12, y: 556, width: self.view.frame.size.width-24, height: 24))
        popularWorkoutsLable.textAlignment = NSTextAlignment.Left
        popularWorkoutsLable.backgroundColor = UIColor.clearColor()
        popularWorkoutsLable.text = "Popular Workouts"
        popularWorkoutsLable.font = UIFont.boldSystemFontOfSize(18)
        self.mainScrollView.addSubview(popularWorkoutsLable)
        
        let popularScrollView = UIScrollView(frame:CGRect(x: 0, y: 590, width: self.view.frame.size.width+5, height: height))
        popularScrollView.contentSize = CGSize(width: (self.view.frame.size.width+5)*3,height: height)
        popularScrollView.bounces = false
        popularScrollView.backgroundColor = UIColor.clearColor()
        self.mainScrollView.addSubview(popularScrollView)
        
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
        self.mainScrollView.addSubview(recommendedScrollView)
        
        /*
        var y = CGFloat(0.0)
        
        for i in 0..<2 {
            
            //Adding viewOne
            let viewOne = self.createViewOne(i)
            viewOne.frame = CGRectMake(0, y, 320, 200)
            self.scrollView.addSubview(viewOne)
            
            //Adding CustomView
            let customView = self.createCustomView(i)
            customView.frame = CGRectMake(0, y, 320, 200)
            self.scrollView.addSubview(customView)
            
            y += height
        }
        */
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
