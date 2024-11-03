//
//  CharactersViewModel.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation

public protocol CharactersViewModelProtocol {
    func getCharacters(onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void)
    
    var pageNumber : Int {get set}
    var originalCharactersArray : [MovieModel] {get set}
    func getSearchResultsWithText(text : String, onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void)
}

public class MoviesViewModel : CharactersViewModelProtocol {
    
    var charactersApiGate : MoviesApiGateProtocol!
    public var pageNumber : Int = 1
    
    public var originalCharactersArray : [MovieModel] = []
    
    public init(charactersApiGate: MoviesApiGateProtocol) {
        self.charactersApiGate = charactersApiGate
    }
    
    public func getCharacters(onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void) {
        self.charactersApiGate.getMovies(pageNumber: pageNumber, onSuccess: { rates in
            onSuccess(rates)
        }, onFailure: { error in
            onFailure(error)
        })
    }
    
    public func getSearchResultsWithText(text : String, onSuccess : @escaping (MoviesResponseModelData) -> Void , onFailure : @escaping (BaseNetworkError) -> Void) {
        
        self.charactersApiGate.getSearchResultsWithText(pageNumber: "\(pageNumber)", text: text) { results in
            onSuccess(results)
        } onFailure: { error in
            onFailure(error)
        }
    }
}
