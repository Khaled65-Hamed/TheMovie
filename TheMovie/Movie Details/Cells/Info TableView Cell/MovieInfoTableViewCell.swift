//
//  MovieInfoTableViewCell.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//


import UIKit
import BusinessLayer

class MovieInfoTableViewCell : UITableViewCell {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var characterContainerView: UIView!
    @IBOutlet private weak var characterImageView: UIImageView!
    @IBOutlet private weak var characterNameLabel: UILabel!
    @IBOutlet private weak var characterParentLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    @IBOutlet private weak var tagLineLabel: UILabel!
    @IBOutlet private weak var revenueLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.configureUI()
    }
    
    private func configureUI() {
    }
    
    func bindData(data : MovieDetailsResponseModel?) {
        guard let model = data else {return}
        
        if let posterPath = model.backdrop_path {
            let imagePath = movieImageBaseUrl + posterPath
            self.characterImageView.loadImageFromUrl(imageUrl: imagePath)
        }
        
        if let tagLine = model.tagline {
            self.tagLineLabel.text = tagLine
        }
        
        if let release_date = model.release_date {
            self.releaseDateLabel.text = release_date
        }
        if let revenue = model.revenue {
            self.revenueLabel.text = String(revenue)
        }
        
        if let overview = model.overview {
            self.overviewLabel.text = overview
        }
    }
    
}
