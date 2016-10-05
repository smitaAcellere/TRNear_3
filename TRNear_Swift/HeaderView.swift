//
//  HeaderView.swift
//  TRNear_Swift
//
//  Created by smita on 29/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit
import JTAppleCalendar

class HeaderView: JTAppleHeaderView {

    @IBOutlet weak var monthTextlabel: UILabel!
    
    func setupHeaderBeforeDisplay(startDate: NSDate, endDate: NSDate, identifier: String) {
        // Setup Cell text
        monthTextlabel.text =  identifier
        
        // Setup text color
//        configureTextColor(cellState)
    }
}
