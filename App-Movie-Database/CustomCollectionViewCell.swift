//
//  CustomCollectionViewCell.swift
//  App-Movie-Database
//
//  Created by Immanuel Matthews-Feemster on 12/16/23.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    // MARK: - Components
    private let myImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.image = UIImage(systemName: "questionmark")
        iv.tintColor = .white
        iv.clipsToBounds = true
        iv.layer.cornerRadius = 8
        return iv
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.text = "Title"
        return label
    }()
    
    public func configure(with image: UIImage, titled: String) {
        self.myImageView.image = image
        self.label.text = titled
        self.setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.addSubview(myImageView)
        self.addSubview(label)
        
        myImageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            myImageView.topAnchor.constraint(equalTo: self.topAnchor),
            myImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18),
            myImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
            label.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 5),
            label.centerXAnchor.constraint(equalTo: myImageView.centerXAnchor),
        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.myImageView.image = nil
    }
}
