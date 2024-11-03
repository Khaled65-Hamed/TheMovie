//
//  MovieDetailsCellModel.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation

struct MovieDetailsCellModel {
    
    internal init(image: String?, name: String, id: Int) {
        self.image = image
        self.name = name
        self.id = id
    }
    
    var image : String?
    var name : String
    var id : Int
    
}
 
