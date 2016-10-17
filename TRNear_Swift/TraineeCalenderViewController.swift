//
//  TraineeCalenderViewController.swift
//  TRNear_Swift
//
//  Created by smita on 28/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit
import JTAppleCalendar

class TraineeCalenderViewController: UIViewController {
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var listViewBarButton: UINavigationBar!
    var monthLabel: String!

    let formatter = NSDateFormatter()
    let testCalendar: NSCalendar! = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
    
    var eventDateArray = ["2016 10 09","2016 11 11","2016 10 20"];
    
    lazy var todayDate : String = {
        [weak self] in
        let aString = self!.c.stringFromDate(NSDate())
        return aString
        }()
    lazy var c : NSDateFormatter = {
        let f = NSDateFormatter()
        f.dateFormat = "yyyy-MM-dd"
        
        return f
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.calendarView.dataSource = self
        self.calendarView.delegate = self
        self.calendarView.registerCellViewXib(fileName: "CalenderCellView")
        calendarView.registerHeaderViewXibs(fileNames: ["CalenderHeaderView"]) // headers are Optional. You can register multiple if you want.

        self.calendarView.direction = .Vertical
        self.calendarView.allowsMultipleSelection = false
        self.calendarView.firstDayOfWeek = .Sunday
        self.calendarView.scrollEnabled = true
        self.calendarView.scrollingMode = .StopAtEachCalendarFrameWidth
        self.calendarView.itemSize = nil
        self.calendarView.rangeSelectionWillBeUsed = false
        self.calendarView.cellInset = CGPoint(x: 3, y: 6)
        
    }
    
    @IBAction func listBarButtonAction(sender: UIBarButtonItem) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupViewsOfCalendar(startDate: NSDate, endDate: NSDate) {
        let month = testCalendar.component(NSCalendarUnit.Month, fromDate: startDate)
        let monthName = NSDateFormatter().monthSymbols[(month-1) % 12] // 0 indexed array
        let year = NSCalendar.currentCalendar().component(NSCalendarUnit.Year, fromDate: startDate)
        self.monthLabel = monthName + " " + String(year)
        print(monthName + " " + String(year))
        
    }
    
    func printSelectedDates() {
        print("Selected dates --->")
        for date in calendarView.selectedDates {
            print(formatter.stringFromDate(date))
        }
    }

}

extension TraineeCalenderViewController: JTAppleCalendarViewDataSource, JTAppleCalendarViewDelegate  {
    // Setting up manditory protocol method
    func configureCalendar(calendar: JTAppleCalendarView) -> (startDate: NSDate, endDate: NSDate, numberOfRows: Int, calendar: NSCalendar) {
        // You can set your date using NSDate() or NSDateFormatter. Your choice.
        let formatter = NSDateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        
        let firstDate = NSDate()
        let secondDate = formatter.dateFromString("2016 12 11")
        let numberOfRows = 6
        let aCalendar = NSCalendar.currentCalendar() // Properly configure your calendar to your time zone here
        setupViewsOfCalendar(firstDate, endDate: secondDate!)

        return (startDate: firstDate, endDate: secondDate!, numberOfRows: numberOfRows, calendar: aCalendar)
    }
    
    func calendar(calendar: JTAppleCalendarView, isAboutToDisplayCell cell: JTAppleDayCellView, date: NSDate, cellState: CellState) {
        (cell as? CalenderCellView)?.setupCellBeforeDisplay(cellState, date: date, eventDateArray: eventDateArray)
    }
    
    func calendar(calendar: JTAppleCalendarView, didDeselectDate date: NSDate, cell: JTAppleDayCellView?, cellState: CellState) {
        (cell as? CalenderCellView)?.cellSelectionChanged(cellState)
    }
    
    func calendar(calendar: JTAppleCalendarView, didSelectDate date: NSDate, cell: JTAppleDayCellView?, cellState: CellState) {
//        (cell as? CalenderCellView)?.cellSelectionChanged(cellState)
                
        for eventDate in eventDateArray {
            
            if date.equalToDate(c.dateFromString(eventDate)!) {
                
                if c.dateFromString(eventDate)!.isGreaterThanDate(c.dateFromString(todayDate)!) {
                    
                    let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("eventDetailsVC") as! EventDetailsViewController
                    viewController.dateString = eventDate
                    self.navigationController?.pushViewController(viewController, animated:true)
                    
                }else{
                    // Past
                }
            }
        }

    }
    
    func calendar(calendar: JTAppleCalendarView, isAboutToResetCell cell: JTAppleDayCellView) {
        (cell as? CalenderCellView)?.selectedView.hidden = true
    }
    
    func calendar(calendar: JTAppleCalendarView, didScrollToDateSegmentStartingWithdate startDate: NSDate, endingWithDate endDate: NSDate) {
        setupViewsOfCalendar(startDate, endDate: endDate)
    }
    
    func calendar(calendar : JTAppleCalendarView, sectionHeaderIdentifierForDate dateRange: (start: NSDate, end: NSDate), belongingTo month: Int) -> String {
        
        return "CalenderHeaderView"
    }
    
    func calendar(calendar : JTAppleCalendarView, sectionHeaderSizeForDate dateRange: (start: NSDate, end: NSDate), belongingTo month: Int) -> CGSize {
        
        return CGSize(width: 200, height: 50)
        
    }
    
    func calendar(calendar : JTAppleCalendarView, isAboutToDisplaySectionHeader header: JTAppleHeaderView, dateRange: (start: NSDate, end: NSDate), identifier: String) {
        
        let headerCell = (header as? CalenderHeaderView)
        setupViewsOfCalendar(dateRange.start, endDate: dateRange.end)
        headerCell?.title.text = self.monthLabel
        
    }
}

func delayRunOnMainThread(delay:Double, closure:()->()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

extension NSDate {
    func isGreaterThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isGreater = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedDescending {
            isGreater = true
        }
        
        //Return Result
        return isGreater
    }
    
    func isLessThanDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isLess = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedAscending {
            isLess = true
        }
        
        //Return Result
        return isLess
    }
    
    func equalToDate(dateToCompare: NSDate) -> Bool {
        //Declare Variables
        var isEqualTo = false
        
        //Compare Values
        if self.compare(dateToCompare) == NSComparisonResult.OrderedSame {
            isEqualTo = true
        }
        
        //Return Result
        return isEqualTo
    }
    
    func addDays(daysToAdd: Int) -> NSDate {
        let secondsInDays: NSTimeInterval = Double(daysToAdd) * 60 * 60 * 24
        let dateWithDaysAdded: NSDate = self.dateByAddingTimeInterval(secondsInDays)
        
        //Return Result
        return dateWithDaysAdded
    }
    
    func addHours(hoursToAdd: Int) -> NSDate {
        let secondsInHours: NSTimeInterval = Double(hoursToAdd) * 60 * 60
        let dateWithHoursAdded: NSDate = self.dateByAddingTimeInterval(secondsInHours)
        
        //Return Result
        return dateWithHoursAdded
    }
}

