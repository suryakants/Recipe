//
//  ListViewModel.swift
//  Recipe
//
//  Created by Suryakant Sharma on 01/07/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation

protocol ListViewModelViewDelegate: class
{
    func itemsDidChange(_ viewModel: RecipeViewModel)
}

protocol ListViewModelCoordinatorDelegate: class
{
    func listViewModelDidSelectData(_ viewModel: RecipeViewModel)
}

protocol ListViewModel
{
    var viewDelegate: ListViewModelViewDelegate? { get set }
    var coordinatorDelegate: ListViewModelCoordinatorDelegate? { get set}
}
