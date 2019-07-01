//
//  RecipeListCoordinator.swift
//  Recipe
//
//  Created by Suryakant Sharma on 01/07/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation
import UIKit

class RecipeListCoordinator: Coordinator
{
    
    static let shared = RecipeListCoordinator()
    //private Initializer
    private init(){}

    weak var delegate: RecipeListCoordinatorDelegate?
    var recipeDetailCoordinator: RecipeDetailCoordinator?
    var navController: UINavigationController?
    var recipeViewController: RecipeViewController?
    
    func start(){
        if let rootVC = setupRootViewCopntroller(), let window = UIApplication.shared.delegate?.window {
            window?.rootViewController = rootVC
        }
    }
    
    //setup of rootViewController here.
    func setupRootViewCopntroller() -> UINavigationController? {
        let recipeViewController = RecipeViewController()
        navController = UINavigationController(rootViewController: recipeViewController)
        UINavigationBar.appearance().barTintColor = .appThemeColor
        UINavigationBar.appearance().tintColor = UIColor.white
        //        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        return navController
    }
}

extension RecipeListCoordinator {
    func tableViewDidSelect<T>(viewModel: T) {
        if let viewModel = viewModel as? RecipeViewModel {
            let recipeDetailController = RecipeDetailCoordinator(viewModel: viewModel)
            if let navC = navController {
                recipeDetailController.start(with: navC)
            }
        }
    }
}

