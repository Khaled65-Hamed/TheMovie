//
//  MoviesApiGateProtocol.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation

public protocol MoviesApiGateProtocol {
    func getMovies(pageNumber : Int, onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void)
    
    func getSearchResultsWithText(pageNumber : String , text : String, onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void)
}
