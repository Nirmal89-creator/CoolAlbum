//
//  AlbumTableViewCell.swift
//  CoolAlbum
//
//  Created by Nirmal Mehra on 21/01/21.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    static let identifier = "AlbumCell"
    
    let albumNameLabel: UILabel = {
       let label = UILabel()
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(albumNameLabel)
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpConstraints() {
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
        albumNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        albumNameLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

}
