//
//  RecipeDataManager.swift
//  Recipe
//
//  Created by Suryakant Sharma on 25/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Contentful


class RecipeDataManager {
    static let shared = RecipeDataManager()
    lazy var recipes : [RecipeViewModel] = []
    //private Initializer
    private init(){}
    
    func fetchRecipes(completionHandler : @escaping ([RecipeViewModel]?,NetworkError?) -> Void){
        
        //check network reachablity and return if device is not connected with network.
        if(!ReachabilityManager.sharedInstance.isNetworkWorking){
            completionHandler(nil,.noNetwork)
            return;
        }
        if let spaceId = infoForKey(ContentfulConstantKey.spaceIdKey), let token = infoForKey(ContentfulConstantKey.accessTokenKey){
            let client = Client(spaceId: spaceId, accessToken: token, contentTypeClasses:[Recipe.self])
            client.fetchArray(of:Recipe.self) { (result: Result<ArrayResponse<Recipe>>) in
                switch result {
                case .success(let response):
                    self.createViewMode(items: response.items, completionHandler: completionHandler)
                case .error(let error):
                    print("Oh no something went wrong: \(error)")
                }
            }
        }
        else{
            completionHandler(nil,.noValidSpaceIdOrToken)
        }
    }
    
    func createViewMode(items: [Recipe], completionHandler : ([RecipeViewModel]?,NetworkError?) -> Void){
        items.forEach { (recipe) in
            let recipeViewItem = RecipeViewModel(recipe: recipe)
            recipes.append(recipeViewItem);
        }
        completionHandler(recipes, .noError);
    }
}
