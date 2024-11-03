//
//  ViewController+TableView.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation
import UIKit

extension MoviesViewController : UITableViewDataSource , UITableViewDelegate {
    
    func registerTableView() {
        self.tableView.separatorStyle = .none
        self.tableView.register(UINib(nibName: moviesCellID, bundle: nil), forCellReuseIdentifier: moviesCellID)
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: moviesCellID, for: indexPath) as? MovieTableViewCell {
            let cellModel = MovieTableViewCellModel(characterModel: self.dataSource[indexPath.row])
            cell.configureModel(model: cellModel)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let characterModel = self.dataSource[indexPath.row]
        self.navigateToCharacterDetails(characterModel: characterModel)
    }

}

extension MoviesViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchBar.text = searchText
        self.searchBar.showsCancelButton = !searchText.isEmpty
        self.getSearchResults(searchText: searchText)
    }
}
