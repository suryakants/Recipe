//
//  StringExtension.swift
//  
//
//  Created by Suryakant Sharma on 11/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func localize(comment: String = "") -> String {
        let localizeStr = NSLocalizedString(self, comment: "")
        return localizeStr
    }
}
