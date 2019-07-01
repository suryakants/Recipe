//
//  ActivityIndicator.swift
//  
//
//  Created by Suryakant Sharma on 12/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import UIKit

class ActivityIndicator: NSObject {
    
    static let shared = ActivityIndicator()
    
    //Initializer access level change now
    private override init(){}
    
    var activityIndicator : UIActivityIndicatorView?
    //Activity indicator
    func start(to view: UIView){
        // Create the Activity Indicator
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        
        // Add it to the view where you want it to appear
        view.addSubview(activityIndicator!)
        
        // Set up its size (the super view bounds usually)
        activityIndicator?.center = view.center
        activityIndicator?.backgroundColor = .clear;
        
        // Start the loading animation
        activityIndicator?.startAnimating()
    }
    
    func stop(){
        // To remove it, just call removeFromSuperview()
        DispatchQueue.main.async(execute: {
            self.activityIndicator?.removeFromSuperview()
            self.activityIndicator = nil;
        })
    }
    
}

