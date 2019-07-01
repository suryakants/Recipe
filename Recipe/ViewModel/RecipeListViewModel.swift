//
//  RecipeListViewModel.swift
//  Recipe
//
//  Created by Suryakant Sharma on 30/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation
@objcMembers class RecipeListViewModel : NSObject {
    
    dynamic private(set) var recipeViewModels :[RecipeViewModel] = [RecipeViewModel]()

    private var tokenViewModel: NSKeyValueObservation?
    private var tokenError: NSKeyValueObservation?

    var bindToSourceViewModels :(() -> ()) = {  }
    var errorToSourceViewModels :((_ error :NetworkError?) -> ()) = { error in  }
    private var recipeDataManager: RecipeDataManager
    
    init(recipeDataManager: RecipeDataManager = RecipeDataManager.shared) {
        self.recipeDataManager = recipeDataManager
        super.init()
        tokenViewModel = self.observe(\.recipeViewModels) { _,_ in
            self.bindToSourceViewModels()
        }
        
        // call populate sources
        populateRecipes()
    }
    
    func invalidateObservers() {
        self.tokenViewModel?.invalidate()
    }
    
    func populateRecipes() {
        self.recipeDataManager.fetchRecipes { (recipes, error) in
            if error == .noError, let recipes = recipes {
                self.recipeViewModels = recipes
            }
            else {
                self.errorToSourceViewModels(error)
            }
        }
    }
    
    func addSource(recipe: RecipeViewModel) {
        self.recipeViewModels.append(recipe)
    }
    
    func recipe(at index:Int) -> RecipeViewModel {
        return self.recipeViewModels[index]
    }
}
