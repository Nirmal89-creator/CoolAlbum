//
//  DetailCollectionViewCell.swift
//  CoolAlbum
//
//  Created by Nirmal Mehra on 22/01/21.
//

import UIKit

class DetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "DetailCell"
    
    let detailImageView: UIImageView = {
       let imgView = UIImageView()
        imgView.backgroundColor = .orange
        imgView.clipsToBounds = true
        imgView.contentMode = .scaleAspectFit
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(detailImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        detailImageView.frame = contentView.bounds
    }
    
}
