//
//  CommonUtility.swift
//  
//
//  Created by Suryakant Sharma on 12/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation
import UIKit

//MARK:- Network error handling

func handleError(error : NetworkError?, for viewController : UIViewController) {
    //display error here
    switch error {
    case .noNetwork?:
        showErrorMessage(at: viewController, title: "NoNetwork.title".localize(), messase: "Error.no.network.message".localize())
    default:
        showErrorMessage(at: viewController, title: "".localize(), messase: "Error.default.message".localize())
    }
}

func showErrorMessage(at viewController:UIViewController, title: String, messase:String) {
    let alertController = UIAlertController(title: title, message: messase, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
    DispatchQueue.main.async(execute: {
        viewController.present(alertController, animated: true, completion: nil)
    })
}

func infoForKey(_ key: String) -> String? {
    return (Bundle.main.infoDictionary?[key] as? String)?
        .replacingOccurrences(of: "\\", with: "")
}


