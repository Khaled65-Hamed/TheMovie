//
//  CharacterResponseModel.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation


public class MoviesResponseModelData : Codable {
    internal init(results: [MovieModel] = []) {
        self.results = results
    }
    
    public var results : [MovieModel] = []
    
    enum CodingKeys : String , CodingKey {
        case results
    }
}


public struct MovieModel : Codable {
    
    
    public var id : Int
    public var title : String
    public var originalTitle : String?
    public var overview : String?
    public var popularity : Float?
    public var poster_path : String?
    public var release_date : String?
    public var video : Bool = false
    public var vote_count : Int?
    
    
    enum CodingKeys : String , CodingKey {
        case id
        case title
        case originalTitle
        case overview
        case popularity
        case poster_path
        case release_date
        case video
        case vote_count
    }
}

