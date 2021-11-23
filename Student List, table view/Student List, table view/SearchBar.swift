//
//  SearchBar.swift
//  Student List, table view
//
//  Created by Михаил on 23.11.21.
//

import UIKit

class SearchBar: UISearchBar {
    let searchController = UISearchController(searchResultsController: nil)
    
    extension MasterViewController: UISearchResultsUpdating {
      func updateSearchResults(for searchController: UISearchController) {
      }
    }

    searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    searchController.searchBar.placeholder = "Search Student"
    navigationItem.searchController = searchController
    definesPresentationContext = true
    
    var filteredData: StudentsViewController.data = []
    
    var isSearchBarEmpty: Bool {
      return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String,
                                    category: Data? = nil) {
      filteredData = data.filter { (data: Data) -> Bool in
        return data.name.lowercased().contains(searchText.lowercased())
      }
      
      tableView.reloadData()
    }

    let searchBar = searchController.searchBar
    filterContentForSearchText(searchBar.text!)
}
