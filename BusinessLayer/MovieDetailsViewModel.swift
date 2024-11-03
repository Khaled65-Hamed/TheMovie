//
//  MovieDetailsViewModel.swift
//  BusinessLayer
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation

public protocol MovieDetailsViewModelProtocol {
    func getMoveDetails(onSuccess : @escaping (MovieDetailsResponseModel) -> Void , onFailure : @escaping (BaseNetworkError) -> Void)
    
    func getSimilarMovies(onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void)
    
    func getSimilarMovieCast(onSuccess : @escaping (CastResponseModel) -> Void , onFailure : @escaping (BaseNetworkError) -> Void)
    
    var movieDetails : MovieDetailsResponseModel? {get}
    
    var similarMovies : [MovieModel]? {get}
    
    var actors : [castModel]? {get}
    
    var directors : [castModel]? {get}
}

public class MovieDetailsViewModel : MovieDetailsViewModelProtocol {
    public var movieDetails: MovieDetailsResponseModel?
    
    public var similarMovies : [MovieModel]?
    
    
    public var actors : [castModel]?
    
    public var directors: [castModel]?
    
    private let apiGate : MovieDetailsApiGateProtocol!
    
    private let movieID : String
    
    public init (movieID : String, apiGate : MovieDetailsApiGateProtocol) {
        self.movieID = movieID
        self.apiGate = apiGate
    }
    
    public func getMoveDetails(onSuccess : @escaping (MovieDetailsResponseModel) -> Void , onFailure : @escaping (BaseNetworkError) -> Void) {
        
        self.apiGate.getMovieDetails(movieID: self.movieID){ result in
            self.movieDetails = result
            onSuccess(result)
        } onFailure: { error in
            onFailure(error)
        }
    }
    
    public func getSimilarMovies(onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void) {
        
        self.apiGate.getSimilarMovies(movieID: movieID) { similarMoviesResponse in
            let sliceFive = similarMoviesResponse.results.prefix(upTo: 5)
            self.similarMovies = Array(sliceFive)
            onSuccess(similarMoviesResponse)
        } onFailure: { error in
            onFailure(error)
        }
    }
    
    public func getSimilarMovieCast(onSuccess : @escaping (CastResponseModel) -> Void , onFailure : @escaping (BaseNetworkError) -> Void) {
        
        self.apiGate.getSimilarMovieCast(movieID: movieID) { [weak self] cast in
            self?.configureCast(castResponse: cast)
            onSuccess(cast)
        } onFailure: { error in
            onFailure(error)
        }

    }
    
    private func configureCast(castResponse : CastResponseModel) {
        guard castResponse.cast.count > 0 else { return }
        let actors = castResponse.cast.filter{
            return $0.known_for_department.contains("Acting")
        }
        
        let directors = castResponse.cast.filter{
            return $0.known_for_department.contains("Directing")
        }
        
        let actorsSortedWithPopularity = actors.sorted { $0.popularity ?? 0 > $1.popularity ?? 0 }
        
        let directorsSortedWithPopularity = directors.sorted { $0.popularity ?? 0 > $1.popularity ?? 0 }
        
        let firstFiveActorsSortedWithPopularity = Array(actorsSortedWithPopularity.prefix(5))
        
        let firstFiveDirectorSortedWithPopularity = Array(directorsSortedWithPopularity.prefix(5))
        
        self.actors = firstFiveActorsSortedWithPopularity
        self.directors = firstFiveDirectorSortedWithPopularity
        
    }
    
}
