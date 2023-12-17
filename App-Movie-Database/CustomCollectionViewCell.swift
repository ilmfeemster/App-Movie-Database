//
//  CustomCollectionViewCell.swift
//  App-Movie-Database
//
//  Created by Immanuel Matthews-Feemster on 12/16/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        return iv
    }()
    
    public func configure(with image: UIImage) {
        self.myImageView.image = image
        self.setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.addSubview(myImageView)
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
    }
}
