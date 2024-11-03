//
//  MovieTableViewCell.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import UIKit
import BusinessLayer

class MovieTableViewCell : UITableViewCell {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var characterContainerView: UIView!
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet private weak var characterParentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureUI()
    }
    
    private func configureUI() {
        
        self.selectionStyle = .none
        self.containerView.clipsToBounds = true
        self.containerView.layer.cornerRadius = 8
        self.containerView.layer.borderWidth = 1
        self.containerView.layer.borderColor = UIColor.lightGray.cgColor
        
        self.characterImageView.clipsToBounds = true
        self.characterImageView.layer.cornerRadius = 8
        self.characterImageView.backgroundColor = .clear
        
        
        self.characterNameLabel.font = .boldSystemFont(ofSize: 16)
        self.characterNameLabel.textColor = .black
        
        self.characterParentLabel.font = .systemFont(ofSize: 14)
        self.characterParentLabel.textColor = .gray
        
    }
    
    func configureModel(model : MovieTableViewCellModel?) {
        guard let model =  model else {return}
        if let posterPath = model.characterModel.poster_path {
            let imagePath = movieImageBaseUrl + posterPath
            self.characterImageView.loadImageFromUrl(imageUrl: imagePath)
        }
        
        self.characterNameLabel.text = model.characterModel.title
        
        if let overview = model.characterModel.overview {
            self.characterParentLabel.text = overview
        }
    }
}
