//
//  AppCoordinator.swift
//  Recipe
//
//  Created by Suryakant Sharma on 01/07/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator
{
    func start(){
        let recipeListCoordinator = RecipeListCoordinator.shared
        recipeListCoordinator.start()
    }
}
