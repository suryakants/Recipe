//
//  RecipeDetailViewController.swift
//  Recipe
//
//  Created by Suryakant Sharma on 29/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import UIKit
import SDWebImage

class RecipeDetailViewController: UIViewController {
    
    let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "default-dish")
        imageView.backgroundColor = .clear
        return imageView
    }()
    
    var recipeDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: FontSizeContant.subtitle)
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let recipeTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .appThemeColor
        label.font = UIFont.systemFont(ofSize: FontSizeContant.title)
        return label
    }()

    init(recipe: RecipeViewModel) {
        super.init(nibName: nil, bundle: nil)
        if let imageUrl = recipe.imageUrl {
            recipeImageView.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "default-dish"));
        }
        recipeTitle.text = recipe.title
        recipeDescription.text = recipe.des
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "recipe.detail.header.title".localize()
        setupView()
    }
    
    private func setupView(){
        view.backgroundColor = .white
        view.addSubview(recipeImageView)
        view.addSubview(recipeTitle)
        view.addSubview(recipeDescription)
        recipeImageView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding:RecipeImageConstants.detailPadding, size: RecipeImageConstants.detailSize);
        recipeTitle.anchor(top: recipeImageView.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding:RecipeImageConstants.padding);
        recipeDescription.anchor(top: recipeTitle.bottomAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor,padding:RecipeImageConstants.padding);

    }
}
