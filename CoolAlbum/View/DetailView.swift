//
//  DetailView.swift
//  CoolAlbum
//
//  Created by Nirmal Mehra on 21/01/21.
//

import UIKit

class DetailView: UIView {
    
    var detailCollectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 60, height: 60)
        var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .white
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpViews() {
        addSubview(detailCollectionView)
    }
    
    func setUpConstraints() {
        detailCollectionView.topAnchor.constraint(equalTo: topAnchor, constant: 120).isActive = true
        detailCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        detailCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        detailCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setUpConstraints()
    }

}
