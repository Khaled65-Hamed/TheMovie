//
//  MovieDetailsApiGate.swift
//  APIGate
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation
import BusinessLayer

public class MovieDetailsApiGate : BaseAPIHandler , MovieDetailsApiGateProtocol{

    
    
    
    private enum EndPoints : String {
        case getMovieDetails = "/movie/%@"
        case getSimilarMovies = "movie/%@/similar"
        case getSimilarMoviesCast = "movie/%@/credits"
    }
    
    private enum Attributes : String {
        case PageNumber = "page"
        case QueryText = "query"
    }
    
    public func getMovieDetails(movieID : String, onSuccess: @escaping (MovieDetailsResponseModel) -> Void, onFailure: @escaping (BaseNetworkError) -> Void) {
        
        let fullBath = EndPoints.getMovieDetails.rawValue.replacingOccurrences(of: "%@", with: movieID)
        
        let router = MoviesRouter(method: .get, path: fullBath)
        
        self.performNetworkRequest(forRouter: router, jsonDecoder: JSONDecoder()) { (result: Result<MovieDetailsResponseModel, BaseNetworkError>) in
            switch result {
            case .success(let response):
                print(response)
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
                print(error)
                
            }
        }
    }
    
 
    public func getSimilarMovies(movieID : String, onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void) {
        
        let fullBath = EndPoints.getSimilarMovies.rawValue.replacingOccurrences(of: "%@", with: movieID)
        
        let router = MoviesRouter(method: .get, path: fullBath)
        
        self.performNetworkRequest(forRouter: router, jsonDecoder: JSONDecoder()) { (result: Result<MoviesResponseModelData, BaseNetworkError>) in
            switch result {
            case .success(let response):
                print(response)
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
                print(error)
                
            }
        }
    }
    
    public func getSimilarMovieCast(movieID : String, onSuccess : @escaping (CastResponseModel) -> Void , onFailure : @escaping (BaseNetworkError) -> Void) {
        
        let fullBath = EndPoints.getSimilarMoviesCast.rawValue.replacingOccurrences(of: "%@", with: movieID)
        
        let router = MoviesRouter(method: .get, path: fullBath)
        
        self.performNetworkRequest(forRouter: router, jsonDecoder: JSONDecoder()) { (result: Result<CastResponseModel, BaseNetworkError>) in
            switch result {
            case .success(let response):
                print(response)
                onSuccess(response)
            case .failure(let error):
                onFailure(error)
                print(error)
                
            }
        }
    }
}
