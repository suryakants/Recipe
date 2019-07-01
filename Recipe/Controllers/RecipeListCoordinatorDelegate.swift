//
//  RecipeViewController+UITableView.swift
//  Recipe
//
//  Created by Suryakant Sharma on 25/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation
import UIKit

protocol RecipeListCoordinatorDelegate: class{
    func presentRecipeDetailViewController(viewModel: RecipeListViewModel)
}
