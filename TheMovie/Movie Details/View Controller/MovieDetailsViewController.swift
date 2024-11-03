//
//  MovieDetailsViewController.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import UIKit
import BusinessLayer

enum MovieDetailsViewControllerSections {
    case movieDetails
    case similarMovies
    case actors
    case directors
}

class MovieDetailsViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel : MovieDetailsViewModelProtocol!
    
    let movieDetailsCellID = "MovieInfoTableViewCell"
    let similarMoviesCellID = "MovieDetailsTableViewCell"
    
    var sections: [MovieDetailsViewControllerSections] {
        return [.movieDetails, .similarMovies, .actors, .directors]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureUI()
        self.configureTableView()
        self.loadData()
        
        
    }
    
    init(viewModel : MovieDetailsViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "MovieDetailsViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func loadData() {
        self.getMovieDetails()
        self.getSimilarMovies()
        self.getSimilarMoviesCasts()
    }
    private func configureUI() {
        self.navigationItem.title = "Movie Details"
    }
    
    private func getMovieDetails() {
        self.viewModel.getMoveDetails { movieDetails in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } onFailure: { error in
            print(error)
        }

    }
    
    private func getSimilarMovies() {
        self.viewModel.getSimilarMovies { similarMovies in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } onFailure: { error in
            print(error)
        }
    }
    
    private func getSimilarMoviesCasts() {
        self.viewModel.getSimilarMovieCast { similarMovieCast in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } onFailure: { error in
            print(error)
        }

    }
    
    func getSimilarMoviesWrapper() -> [MovieDetailsCellModel]{
        guard let similarMovies = self.viewModel.similarMovies else { return [] }
        let wrappers :  [MovieDetailsCellModel] = similarMovies.map {
            return MovieDetailsCellModel(image: $0.poster_path, name: $0.title, id: $0.id)
        }
        return wrappers
    }
    
    func getSimilarMoviesActorsWrapper() -> [MovieDetailsCellModel]{
        guard let similarMovieCast = self.viewModel.actors else { return [] }
        let wrappers :  [MovieDetailsCellModel] = similarMovieCast.map {
            return MovieDetailsCellModel(image: $0.profile_path, name: $0.name ?? "", id: $0.id)
        }
        return wrappers
    }
    
    func getSimilarMoviesDirectorsWrapper() -> [MovieDetailsCellModel]{
        guard let similarMovieCast = self.viewModel.directors else { return [] }
        let wrappers :  [MovieDetailsCellModel] = similarMovieCast.map {
            return MovieDetailsCellModel(image: $0.profile_path, name: $0.name ?? "", id: $0.id)
        }
        return wrappers
    }
}
