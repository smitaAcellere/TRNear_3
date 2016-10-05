//
//  TraineeCalenderViewController.swift
//  TRNear_Swift
//
//  Created by smita on 28/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit
import JTAppleCalendar

class TraineeCalenderViewController: UIViewController, JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate {
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var monthLabel: UILabel!
    let formatter = NSDateFormatter()
    let testCalendar: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    
    @IBOutlet weak var workoutListBarButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        formatter.dateFormat = "yyyy MM dd"
        testCalendar.timeZone = NSTimeZone(abbreviation: "GMT")!
        
        self.calendarView.dataSource = self
        self.calendarView.delegate = self
        self.calendarView.registerCellViewXib(fileName: "CellView")
        self.calendarView.registerHeaderViewXibs(fileNames: ["PinkSectionHeaderView", "WhiteSectionHeaderView"])
        
        calendarView.cellInset = CGPoint(x: 0, y: 0)
        
        calendarView.direction = .Horizontal                                 // default is horizontal
        calendarView.cellInset = CGPoint(x: 0, y: 0)                         // default is (3,3)
        calendarView.allowsMultipleSelection = false                         // default is false
        calendarView.firstDayOfWeek = .Sunday                                // default is Sunday
        calendarView.scrollEnabled = true                                    // default is true
        calendarView.scrollingMode = .StopAtEachCalendarFrameWidth           // default is .StopAtEachCalendarFrameWidth
        calendarView.itemSize = nil                                          // default is nil. Use a value here to change the size of your cells
        calendarView.rangeSelectionWillBeUsed = false                        // default is false
        //_____________________________________________________________________________________________
        
        // Reloading the data on viewDidLoad() is only necessary if you made LAYOUT changes eg. number of row per month change
        // or changing the start day of week from sunday etc etc.
        calendarView.reloadData()
        
        // After reloading. Scroll to your selected date, and setup your calendar
        calendarView.scrollToDate(NSDate(), triggerScrollToDateDelegate: false, animateScroll: false) {
            let currentDate = self.calendarView.currentCalendarDateSegment()
            self.setupViewsOfCalendar(currentDate.dateRange.start, endDate: currentDate.dateRange.end)
        }
    }
    
    func setupViewsOfCalendar(startDate: NSDate, endDate: NSDate) {
        let month = testCalendar.component(NSCalendarUnit.Month, fromDate: startDate)
        let monthName = NSDateFormatter().monthSymbols[(month-1) % 12] // 0 indexed array
        let year = NSCalendar.currentCalendar().component(NSCalendarUnit.Year, fromDate: startDate)
        monthLabel.text = monthName + " " + String(year)
    }
    
    // JTAppleCalendarViewDataSource methods
    func configureCalendar(calendar: JTAppleCalendarView) -> (startDate: NSDate, endDate: NSDate, numberOfRows: Int, calendar: NSCalendar){
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let firstDate = formatter.dateFromString("2016 12 01")
        let secondDate = NSDate()
        let numberOfRows = 6
        let aCalendar = NSCalendar.currentCalendar() // Properly configure your calendar to your time zone here
        
        return (startDate: secondDate, endDate: firstDate!, numberOfRows: numberOfRows, calendar: aCalendar)
    }
    
    //JTAppleCalendarViewDelegate methods
    func calendar(calendar : JTAppleCalendarView, canSelectDate date : NSDate, cell: JTAppleDayCellView, cellState: CellState)->Bool{
        
        return true
    }
    func calendar(calendar : JTAppleCalendarView, canDeselectDate date : NSDate, cell: JTAppleDayCellView, cellState: CellState)->Bool{
        
        return true
    }
    func calendar(calendar : JTAppleCalendarView, didSelectDate date : NSDate, cell: JTAppleDayCellView?, cellState: CellState){
        
    }
    func calendar(calendar : JTAppleCalendarView, didDeselectDate date : NSDate, cell: JTAppleDayCellView?, cellState: CellState){
        
    }
    func calendar(calendar : JTAppleCalendarView, didScrollToDateSegmentStartingWithdate startDate: NSDate, endingWithDate endDate: NSDate){
        
    }
    func calendar(calendar: JTAppleCalendarView, isAboutToDisplayCell cell: JTAppleDayCellView, date: NSDate, cellState: CellState) {
        (cell as! CellView).setupCellBeforeDisplay(cellState, date: date)
    }
//    func calendar(calendar : JTAppleCalendarView, isAboutToDisplaySectionHeader header: JTAppleHeaderView, date: (startDate: NSDate, endDate: NSDate), identifier: String){
//        (header as! HeaderView).setupHeaderBeforeDisplay(date.startDate, endDate: date.endDate, identifier: identifier)
//        
//    }
//    func calendar(calendar : JTAppleCalendarView, sectionHeaderIdentifierForDate date: (startDate: NSDate, endDate: NSDate)) -> String?{
//        
//        return "September"
//    }
    
//    func calendar(calendar : JTAppleCalendarView, sectionHeaderSizeForDate date: (startDate: NSDate, endDate: NSDate)) -> CGSize{
//        
//        return CGSize(width: self.view.frame.width,height: 60)
//    }
    
    func calendar(calendar : JTAppleCalendarView, sectionHeaderIdentifierForDate dateRange: (start: NSDate, end: NSDate), belongingTo month: Int) -> String {
        if month % 2 > 0 {
            return "WhiteSectionHeaderView"
        }
        return "PinkSectionHeaderView"
    }
    
    func calendar(calendar : JTAppleCalendarView, sectionHeaderSizeForDate dateRange: (start: NSDate, end: NSDate), belongingTo month: Int) -> CGSize {
        if month % 2 > 0 {
            return CGSize(width: 200, height: 50)
        } else {
            return CGSize(width: 200, height: 100) // Yes you can have different size headers
        }
    }
    
    func calendar(calendar : JTAppleCalendarView, isAboutToDisplaySectionHeader header: JTAppleHeaderView, dateRange: (start: NSDate, end: NSDate), identifier: String) {
        switch identifier {
        case "WhiteSectionHeaderView":
            let headerCell = (header as? WhiteSectionHeaderView)
            headerCell?.title.text = "Design multiple headers"
        default:
            let headerCell = (header as? PinkSectionHeaderView)
            headerCell?.title.text = "In any color or size you want"
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
    
    func delayRunOnMainThread(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }

}
