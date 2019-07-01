//
//  Constants.swift
//  
//
//  Created by Suryakant Sharma on 10/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation
import UIKit

public struct RecipeCellConstants{
    static let defaultCellHeight : CGFloat = 380.0
}

public struct RecipeImageConstants{
    static let padding: UIEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    static let detailPadding: UIEdgeInsets = UIEdgeInsets(top: 70, left: 10, bottom: 10, right: 10)
    static let size : CGSize = CGSize(width: 100, height: 100)
    static let detailSize : CGSize = CGSize(width: 300, height: 300)
    static let corderRadius: CGFloat = 5.0
}

// constants use for Firebase
public struct ContentfulConstantKey {
    static let spaceIdKey = "CONTENTFUL_SPACE_ID"
    static let accessTokenKey = "CONTENTFUL_ACCESS_TOKEN"
}

public struct ReachabilityConstant {
    static let kNetworkReachability = -100
    static let kErrorDomain = "com.recipe"
    static let kReachabilityChange = "ReachabilityChangedNotification"
}

public enum NetworkError {
    case noData
    case noNetwork
    case someError
    case invalidSyntax
    case noValidSpaceIdOrToken
    case noError
}

public struct FontSizeContant {
    static let title: CGFloat = 20.0
    static let subtitle: CGFloat =  16.0
}

struct CellIdentifiersConstants {
    static let recipeCell = "recipeCellIdentifier"
}



