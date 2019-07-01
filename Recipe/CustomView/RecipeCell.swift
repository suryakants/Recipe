//
//  RecipeCell.swift
//  Recipe
//
//  Created by Suryakant Sharma on 25/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import UIKit
import Foundation
import SDWebImage

class RecipeCell : UITableViewCell {
    
    let recipeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "default-dish")
        imageView.translatesAutoresizingMaskIntoConstraints = false
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
    
    var recipe : RecipeViewModel? {
        didSet {
            if let recipe = recipe {
                self.recipeTitle.text = recipe.title
                self.recipeDescription.text = recipe.des
                if let imageUrl = recipe.imageUrl {
                    recipeImageView.sd_setImage(with: imageUrl, placeholderImage: #imageLiteral(resourceName: "default-dish"));
                }
            }
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
        
    //Set up all the subview component
    func setupView(){
        self.translatesAutoresizingMaskIntoConstraints = false
        setupImageView()
        setupLabels()
        recipeImageView.layer.cornerRadius = RecipeImageConstants.corderRadius
    }
    
    func setupImageView(){
        self.contentView.addSubview(recipeImageView)
            recipeImageView.anchor(top: self.contentView.topAnchor, leading: self.contentView.leadingAnchor, bottom: self.contentView.bottomAnchor, trailing: nil, padding: RecipeImageConstants.padding, size: RecipeImageConstants.size)
    }
    
    func setupLabels(){
        self.contentView.addSubview(recipeTitle)
        recipeTitle.anchor(top: self.contentView.topAnchor, leading: self.recipeImageView.trailingAnchor, bottom: nil, trailing: self.contentView.trailingAnchor, padding: RecipeImageConstants.padding)
    }
}
