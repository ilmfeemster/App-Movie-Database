//
//  ViewController.swift
//  App-Movie-Database
//
//  Created by Immanuel Matthews-Feemster on 11/5/23.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Variables
    private var images: [UIImage] = []

    
    // MARK: - UI Compponents
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.alwaysBounceVertical = true
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        collectionView.register(CollectionViewSubtitle.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionViewSubtitle.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        for _ in 0...25 {
            images.append(UIImage(named: "1")!)
            images.append(UIImage(named: "2")!)
            images.append(UIImage(named: "3")!)
            images.append(UIImage(named: "4")!)
            images.append(UIImage(named: "5")!)
        }
        
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10),
            
            collectionView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
    }
}

extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.identifier, for: indexPath) as? CustomCollectionViewCell else {
            fatalError("Failed to dequeue CustomCollectionViewCell in HomeController.")
        }
        
        let image = self.images[indexPath.row]
        cell.configure(with: image)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = (self.view.frame.width / 2) - 20
        return CGSize(width: size, height: size * (16/9))
    }
    
    //Veritcal Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    //Horizontal Spacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //Collection View Header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let collectionViewSubtitle = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionViewSubtitle.identifier, for: indexPath) as! CollectionViewSubtitle
            collectionViewSubtitle.label.text = "\"Whats the difference between my 458 and your 488?\""
                 return collectionViewSubtitle
            } else { //No footer in this case but can add option for that
                 return UICollectionReusableView()
            }
    }
    
    //Header Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 40)
    }
}
