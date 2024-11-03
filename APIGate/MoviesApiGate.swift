//
//  MoviesApiGate.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation
import BusinessLayer

public class MoviesApiGate : BaseAPIHandler , MoviesApiGateProtocol{
    
    
    private enum EndPoints : String {
        case getPopularMovies = "movie/popular"
        case getSearchResults = "search/movie"
    }
    
    private enum Attributes : String {
        case PageNumber = "page"
        case QueryText = "query"
    }
    
    public func getMovies(pageNumber : Int, onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void) {
        
        let params : [String : AnyObject] = [Attributes.PageNumber.rawValue : "\(pageNumber)" as AnyObject]
        let router = MoviesRouter(method: .get, path: EndPoints.getPopularMovies.rawValue, queryParams: params)
        
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
    
    public func getSearchResultsWithText(pageNumber : String , text : String, onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void) {
        
        var params : [String : AnyObject] = [Attributes.PageNumber.rawValue : "\(pageNumber)" as AnyObject]
        
        params[Attributes.QueryText.rawValue] = text as AnyObject
        
        let router = MoviesRouter(method: .get, path: EndPoints.getSearchResults.rawValue, queryParams: params)
        
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
}
