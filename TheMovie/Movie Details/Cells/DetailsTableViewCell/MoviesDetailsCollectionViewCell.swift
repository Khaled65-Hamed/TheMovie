//
//  MoviesDetailsCollectionViewCell.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import UIKit
import BusinessLayer

class MoviesDetailsCollectionViewCell : UICollectionViewCell {
    
    private let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        
        return view
    }()
    
    private let imageViewContainerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.layer.borderWidth = 1
        let borderColor : UIColor = UIColor.gray
        view.layer.borderColor = borderColor.cgColor
        
        
        return view
    }()
    
    private let itemImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    private let specialtyEntityName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelColor : UIColor = UIColor.black
        label.textColor = labelColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addConstraints()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(data: MovieDetailsCellModel) {
        if let poster_path = data.image {
            let imageURL = movieImageBaseUrl + poster_path
            itemImageView.loadImageFromUrl(imageUrl: imageURL)
        }
        
        self.specialtyEntityName.text = data.name
    }
    
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(imageViewContainerView)
        imageViewContainerView.addSubview(itemImageView)
        containerView.addSubview(specialtyEntityName)
    }
    
    private func addConstraints() {
        
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 0).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 0).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: 0).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: 0).isActive = true
        
        imageViewContainerView.topAnchor.constraint(equalTo: containerView.topAnchor , constant: 0).isActive = true
        imageViewContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor , constant: 0).isActive = true
        imageViewContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor , constant: 0).isActive = true
        imageViewContainerView.heightAnchor.constraint(equalTo: imageViewContainerView.widthAnchor).isActive = true
        
        itemImageView.topAnchor.constraint(equalTo: imageViewContainerView.topAnchor , constant: 0).isActive = true
        itemImageView.leadingAnchor.constraint(equalTo: imageViewContainerView.leadingAnchor , constant: 0).isActive = true
        itemImageView.trailingAnchor.constraint(equalTo: imageViewContainerView.trailingAnchor , constant: 0).isActive = true
        itemImageView.bottomAnchor.constraint(equalTo: imageViewContainerView.bottomAnchor , constant: 0).isActive = true
        
        
        specialtyEntityName.topAnchor.constraint(equalTo: imageViewContainerView.bottomAnchor, constant: 8).isActive = true
        specialtyEntityName.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        specialtyEntityName.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        specialtyEntityName.textAlignment = .center
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
}

