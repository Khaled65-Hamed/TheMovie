//
//  MovieTableViewCellModel.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import Foundation
import BusinessLayer

struct MovieTableViewCellModel {
    var characterModel : MovieModel
    
    init(characterModel: MovieModel) {
        self.characterModel = characterModel
    }
}
