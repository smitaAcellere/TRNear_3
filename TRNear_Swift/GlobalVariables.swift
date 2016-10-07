//
//  GlobalVariables.swift
//  TRNear_Swift
//
//  Created by smita on 21/09/16.
//  Copyright © 2016 Acellere. All rights reserved.
//

import UIKit
import AFNetworking

class GlobalVariables {
    
    // These are the properties you can store in your singleton
    
    struct Colors {
        
        // hex : #c7c7cd
        static let border_light = UIColor.init(colorLiteralRed: 199.0/255.0, green: 199.0/255.0, blue: 205.0/255.0, alpha: 1.0)
    }
    
}

extension UIViewController {
    
    func getData(urlString:String,parameters: AnyObject, completionHandler:(data: String, error: NSError) -> ()) -> () {
        
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.setValue("608c6c08443c6d933576b90966b727358d0066b4", forHTTPHeaderField: "X-Auth-Token")
        
        manager.GET(urlString,
        parameters: parameters,
        progress: nil,
        success: {(task: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
            
            completionHandler(data: (responseObject?.description)!, error: NSError(domain: "com.example", code: 200, userInfo: nil))
        },
        failure: {(task: NSURLSessionDataTask?, error: NSError) -> Void in
            completionHandler(data: "", error: error)

        });
        
        //{email:"smita@gamil.com",password: "aaaaaa", activation_code:""} // signup
        
    }
    
    func postData(urlString:String,parameters: AnyObject?, completionHandler:(data: String, error: NSError) -> ()) -> () {
        
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.setValue("608c6c08443c6d933576b90966b727358d0066b4", forHTTPHeaderField: "X-Auth-Token")
        
        manager.POST(urlString,
        parameters: parameters,
        progress: nil,
        success: {(task: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
            
            completionHandler(data: (responseObject?.description)!, error: NSError(domain: "com.example", code: 200, userInfo: nil))
        },
        failure: {(task: NSURLSessionDataTask?, error: NSError) -> Void in
            completionHandler(data: "", error: error)
            
        });
    }
    
    func putData(urlString:String,parameters: AnyObject?,completionHandler:(data: String, error: NSError) -> ()) -> () {
        
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.setValue("608c6c08443c6d933576b90966b727358d0066b4", forHTTPHeaderField: "X-Auth-Token")
        
        manager.PUT(urlString,
        parameters: parameters,
        success: {(task: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
            
            completionHandler(data: (responseObject?.description)!, error: NSError(domain: "com.example", code: 200, userInfo: nil))
        },
        failure: {(task: NSURLSessionDataTask?, error: NSError) -> Void in
            completionHandler(data: "", error: error)
        
        });
    }

    func deletedata(urlString:String,parameters: AnyObject?, completionHandler:(data: String, error: NSError) -> ()) -> () {
        
        let manager = AFHTTPSessionManager()
        manager.requestSerializer.setValue("608c6c08443c6d933576b90966b727358d0066b4", forHTTPHeaderField: "X-Auth-Token")
        
        manager.DELETE(urlString,
        parameters: parameters,
        success: {(task: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
            
            completionHandler(data: (responseObject?.description)!, error: NSError(domain: "com.example", code: 200, userInfo: nil))
        },
        failure: {(task: NSURLSessionDataTask?, error: NSError) -> Void in
            completionHandler(data: "", error: error)
            
        });
        
    }
    
    func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0
    }
    
//    func keyboardWillShow(notification: NSNotification) {
//        
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
//            if self.view.frame.origin.y == 0{
//                self.view.frame.origin.y -= keyboardSize.height
//            }
//        }
//        
//    }
//    
//    func keyboardWillHide(notification: NSNotification) {
//        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
//            if self.view.frame.origin.y != 0{
//                self.view.frame.origin.y += keyboardSize.height
//            }
//        }
//    }

}
