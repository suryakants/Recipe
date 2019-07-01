//
//  TableViewDataSource.swift
//  Recipe
//
//  Created by Suryakant Sharma on 30/06/19.
//  Copyright © 2019 Suryakant Sharma. All rights reserved.
//

import Foundation
import UIKit

class TableViewDataSource<Cell :UITableViewCell,ViewModel> : NSObject, UITableViewDataSource, UITableViewDelegate {
    private var cellIdentifier :String!
    private var items :[ViewModel]!
    var configureCell :(Cell,ViewModel) -> ()
    
    init(cellIdentifier :String, items :[ViewModel], configureCell: @escaping (Cell,ViewModel) -> ()) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    //MARK:- TableView Datasource method
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: self.cellIdentifier, for: indexPath) as! Cell
        let item = self.items[indexPath.row]
        self.configureCell(cell,item)
        return cell
    }
    
    //MARK:- TableView Datasource method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let recipe = items[indexPath.row]
        RecipeListCoordinator.shared.tableViewDidSelect(viewModel: recipe)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}



