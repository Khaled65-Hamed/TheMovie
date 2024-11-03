//
//  MovieDetailsResponseModel.swift
//  BusinessLayer
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation

public struct MovieDetailsResponseModel : Codable {
    
    
    public var id : Int
    public var title : String
    public var tagline : String?
    public var overview : String?
    public var popularity : Float?
    public var backdrop_path : String?
    public var release_date : String?
    public var video : Bool = false
    public var vote_count : Int?
    public var revenue : Int?
    public var status : String?
    
    
    enum CodingKeys : String , CodingKey {
        case id
        case title
        case tagline
        case overview
        case popularity
        case backdrop_path
        case release_date
        case video
        case vote_count
        case revenue
        case status
    }
}
