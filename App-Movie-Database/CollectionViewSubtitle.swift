//
//  CollectionViewSubtitle.swift
//  App-Movie-Database
//
//  Created by Immanuel Matthews-Feemster on 12/16/23.
//

import UIKit

class CollectionViewSubtitle: UICollectionReusableView {
    
    static let identifier = "CollectionViewSubtitle"
    
     var label: UILabel = {
         let label: UILabel = UILabel()
         label.textColor = .gray
         label.font = UIFont.systemFont(ofSize: 16, weight: .light)
         label.sizeToFit()
         return label
     }()

     override init(frame: CGRect) {
         super.init(frame: frame)

         addSubview(label)
         label.translatesAutoresizingMaskIntoConstraints = false
         
         NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            label.rightAnchor.constraint(equalTo: self.rightAnchor),
         ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
