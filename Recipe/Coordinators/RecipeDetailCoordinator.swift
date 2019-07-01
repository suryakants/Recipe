//
//  RecipeDetailCoordinator.swift
//  Recipe
//
//  Created by Suryakant Sharma on 01/07/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import UIKit


protocol RecipeDetailCoordinatorDelegate: class
{
    func detailCoordinatorDidFinish(detailCoordinator: RecipeDetailCoordinator)
}

class RecipeDetailCoordinator: Coordinator
{
    weak var delegate: RecipeDetailCoordinatorDelegate?
    let viewModel: RecipeViewModel
    
    init(viewModel: RecipeViewModel){
        self.viewModel = viewModel
    }
    
    func start(){
        
    }
    func start(with navigationController : UINavigationController){
        let detailViewController = RecipeDetailViewController(recipe: viewModel)
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
