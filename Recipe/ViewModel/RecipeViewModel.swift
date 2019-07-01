//
//  RecipeViewModel.swift
//  Recipe
//
//  Created by Suryakant Sharma on 25/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation

class RecipeViewModel : NSObject {
    let title: String?
    let chefName: String?
    let des: String?
    let imageUrl : URL?
    let tags : [String]?
    
    //init
    init(recipe: Recipe) {
        title = recipe.title
        chefName = ""
        des = recipe.description
        imageUrl = recipe.image?.file?.url
        tags = []
    }
}
