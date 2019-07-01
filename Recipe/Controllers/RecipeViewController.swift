//
//  RecipeViewController.swift
//  Recipe
//
//  Created by Suryakant Sharma on 25/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {
    
    private var recipesList :RecipeListViewModel!
    private var dataSource :TableViewDataSource<RecipeCell,RecipeViewModel>!
    private var dataManager: RecipeDataManager!
    
    lazy var recipeTableView : UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = RecipeCellConstants.defaultCellHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.register(RecipeCell.self, forCellReuseIdentifier: CellIdentifiersConstants.recipeCell)
        tableView.backgroundColor = .white
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateView()
    }
    
    private func setupView(){
        self.title = "recipes.list.header.title".localize()
        view.backgroundColor = .white
        view.addSubview(recipeTableView)
        recipeTableView.fillSuperview()
    }
    
    private func updateView() {
        ActivityIndicator.shared.start(to: view)
        self.recipesList = RecipeListViewModel()
        // setting up the bindings
        self.recipesList.bindToSourceViewModels = {
            self.updateDataSource()
        }
        self.recipesList.errorToSourceViewModels = { (error: NetworkError?) in
            //handle all the error here
            ActivityIndicator.shared.stop()
            handleError(error: error, for: self);
        }
    }
    
    private func updateDataSource() {
        self.dataSource = TableViewDataSource(cellIdentifier: CellIdentifiersConstants.recipeCell, items: self.recipesList.recipeViewModels) { cell, ViewModel in
            cell.recipe = ViewModel
        }
        DispatchQueue.main.async {
            self.recipeTableView.dataSource = self.dataSource
            self.recipeTableView.delegate = self.dataSource
            self.recipeTableView.reloadData()
            ActivityIndicator.shared.stop()
        }
    }
}
