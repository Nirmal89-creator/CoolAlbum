//
//  AlbumView.swift
//  CoolAlbum
//
//  Created by Nirmal Mehra on 21/01/21.
//

import UIKit

class AlbumView: UIView {
    
    var albumTableView: UITableView = {
       var tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 50
        return tableView
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpViews() {
        addSubview(albumTableView)
    }
    
    private func setUpConstraints() {
        albumTableView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        albumTableView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        albumTableView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        albumTableView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }

}
