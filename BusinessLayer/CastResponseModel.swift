//
//  CastResponseModel.swift
//  BusinessLayer
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation

public class CastResponseModel : Codable {
    internal init(cast: [castModel] = []) {
        self.cast = cast
    }
    
    public var cast : [castModel] = []
    
    enum CodingKeys : String , CodingKey {
        case cast
    }
}


public struct castModel : Codable {
    
    public var id : Int
    public var known_for_department : String
    public var name : String?
    public var original_name : String?
    public var popularity : Float?
    public var profile_path : String?
    public var cast_id : Int?
    public var character : String?
    public var credit_id : String?
    public var order : Int
    
    
    
    enum CodingKeys : String , CodingKey {
        case id
        case known_for_department
        case name
        case original_name
        case popularity
        case profile_path
        case cast_id
        case character
        case credit_id
        case order
    }
}


