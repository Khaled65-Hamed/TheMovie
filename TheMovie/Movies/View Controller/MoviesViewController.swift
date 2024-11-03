//
//  MoviesViewController.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import UIKit
import BusinessLayer
import APIGate

class MoviesViewController: UIViewController {

    
    @IBOutlet weak var tableView : UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel : CharactersViewModelProtocol!
    
    let indicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    var dataSource : [MovieModel] = []
   
    let moviesCellID = "MovieTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.getExchangeRates()
        self.registerTableView()
        self.configureUI()
        self.configureSearchBar()
    }
    
    init(viewModel : CharactersViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: "MoviesViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureUI() {
        self.navigationItem.title = "Movies"
    }

    private func getExchangeRates() {
        self.configureIndicator()
        self.getInitialMovies()
    }
    
    private func configureSearchBar() {
        self.searchBar.delegate = self
    }
    
    private func getInitialMovies(){
        self.indicator.startAnimating()
        self.viewModel.getCharacters(onSuccess: { [weak self] characters in
            guard let self = self else {return}
            DispatchQueue.main.async {
                self.removeIndicator()
                self.viewModel.originalCharactersArray = characters.results
                self.dataSource = self.viewModel.originalCharactersArray
                self.tableView.reloadData()
            }
        }, onFailure: { error in
            
        })
    }
    
    private func configureIndicator() {
         indicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
         indicator.tag = 5
         indicator.center = view.center
         self.view.addSubview(indicator)
        self.view.bringSubviewToFront(indicator)
    }
    
    private func removeIndicator() {
        for subView in self.view.subviews {
            if subView.tag == indicator.tag {
                self.view.sendSubviewToBack(subView)
                subView.removeFromSuperview()
                
            }
        }
    }
    
    func getSearchResults(searchText: String) {
        guard !searchText.isEmpty else {
            self.getInitialMovies()
            return
        }
        self.viewModel.getSearchResultsWithText(text: searchText) { [weak self] searchResults in
            guard let self = self else {return}
            self.dataSource = searchResults.results
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } onFailure: { error in
            print(error)
        }

    }
    
    func navigateToCharacterDetails(characterModel : MovieModel) {
        let movieDetailsApiGate = MovieDetailsApiGate()
        let moviesDetailsViewModel = MovieDetailsViewModel(movieID: "\(characterModel.id)", apiGate: movieDetailsApiGate)
        
        let moviesDetailsViewController = MovieDetailsViewController(viewModel: moviesDetailsViewModel)
        
        self.navigationController?.pushViewController(moviesDetailsViewController, animated: true)
    }

}


