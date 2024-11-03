//
//  MovieDetailsApiGateProtocol.swift
//  BusinessLayer
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation


public protocol MovieDetailsApiGateProtocol {
    func getMovieDetails(movieID : String, onSuccess : @escaping (MovieDetailsResponseModel) -> Void , onFailure : @escaping (BaseNetworkError) -> Void)
    
    func getSimilarMovies(movieID : String, onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void)
    
    func getSimilarMovieCast(movieID : String, onSuccess : @escaping (CastResponseModel) -> Void , onFailure : @escaping (BaseNetworkError) -> Void)
}
