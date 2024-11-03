//
//  MoviesDetialsViewController+TableView.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation
import UIKit


extension MovieDetailsViewController: UITableViewDataSource {
    
    func configureTableView() {
        tableView.dataSource = self
        tableView.register(UINib(nibName: movieDetailsCellID, bundle: nil), forCellReuseIdentifier: movieDetailsCellID)
        
        tableView.register(MovieDetailsTableViewCell.self, forCellReuseIdentifier: similarMoviesCellID)
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionType = self.sections[section]
        
        switch sectionType {
        case .movieDetails:
            if let _ = self.viewModel.movieDetails {
                return 1
            }
            return 0
        case .similarMovies:
            if let similarMovies = self.viewModel.similarMovies , similarMovies.count > 0 {
                return 1
            }
            return 0
        case .actors:
            if let actors = self.viewModel.actors , actors.count > 0 {
                return 1
            }
            return 0
        case .directors:
            if let directors = self.viewModel.directors , directors.count > 0 {
                return 1
            }
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sectionType = self.sections[indexPath.section]
        switch sectionType {
        case .movieDetails:
            if let cell = tableView.dequeueReusableCell(withIdentifier: movieDetailsCellID) as? MovieInfoTableViewCell {
                cell.bindData(data: self.viewModel.movieDetails)
                return cell
            }
            return UITableViewCell()
        case .similarMovies:
            if let cell = tableView.dequeueReusableCell(withIdentifier: similarMoviesCellID) as? MovieDetailsTableViewCell {
                cell.configure(title: "Similar Movies", data: self.getSimilarMoviesWrapper())
                return cell
            }
        case .actors:
            if let cell = tableView.dequeueReusableCell(withIdentifier: similarMoviesCellID) as? MovieDetailsTableViewCell {
                cell.configure(title: "Actors", data: self.getSimilarMoviesActorsWrapper())
                return cell
            }
        case .directors:
            if let cell = tableView.dequeueReusableCell(withIdentifier: similarMoviesCellID) as? MovieDetailsTableViewCell {
                cell.configure(title: "directors", data: self.getSimilarMoviesDirectorsWrapper())
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }
}
