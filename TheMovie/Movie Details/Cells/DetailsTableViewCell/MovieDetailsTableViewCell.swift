//
//  movieDetailsTableViewCell.swift
//  TheMovie
//
//  Created by Khaled Hamed on 02/11/2024.
//

import UIKit
import BusinessLayer
import APIGate


class MovieDetailsTableViewCell: UITableViewCell {
    
    private let moviesDetailsCollectionViewCellID = "MoviesDetailsCollectionViewCell"
    
    
    private var similarMovies: [MovieDetailsCellModel] = []
    
    private lazy var collectionView: UICollectionView! = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.isScrollEnabled = true
        collectionView.bounces = true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MoviesDetailsCollectionViewCell.self, forCellWithReuseIdentifier: moviesDetailsCollectionViewCellID)
        return collectionView
    }()

    private let headerTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        let labelColor : UIColor = UIColor.black
        label.textColor = labelColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        return label
    }()

    
    private let titleStackView : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        view.axis = .horizontal
        return view
    }()
    
    private let containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor.white
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        addConstraints()
        configureUI()
        backgroundColor = .clear
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - CONFIGURATION
    private func addSubviews() {
        contentView.addSubview(containerView)
        containerView.addSubview(collectionView)
        containerView.addSubview(titleStackView)
        titleStackView.addArrangedSubview(headerTitleLabel)
    }
    
    private func addConstraints() {
        
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor , constant: 4).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor , constant: 4).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor , constant: -4).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor , constant: 16).isActive = true

        collectionView.topAnchor.constraint(equalTo: headerTitleLabel.bottomAnchor, constant: 8).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16).isActive = true
        
        titleStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16).isActive = true
        titleStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16).isActive = true
        titleStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16).isActive = true

    }
    
    private func configureUI() {
        
        self.headerTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        self.headerTitleLabel.text = "Similar Movies"
        
        self.containerView.clipsToBounds = true
        self.containerView.layer.cornerRadius = 8
        self.containerView.translatesAutoresizingMaskIntoConstraints = false

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    
    func configure(title : String, data: [MovieDetailsCellModel]) {
        similarMovies = data
        collectionView.heightAnchor.constraint(equalToConstant: 180).isActive = true
        self.headerTitleLabel.text = title
        self.collectionView.reloadData()
    }
}
//MARK: - COLLECTION VIEW DATASOURCE & DELEGATE
extension MovieDetailsTableViewCell : UICollectionViewDataSource , UICollectionViewDelegate , UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.similarMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: moviesDetailsCollectionViewCellID, for: indexPath) as? MoviesDetailsCollectionViewCell {
            if self.similarMovies.count > indexPath.row {
                let model = self.similarMovies[indexPath.row]
                cell.configure(data: model)
            }
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 120
        let height = 170
        return CGSize(width: width, height: height)
    }
    
}
