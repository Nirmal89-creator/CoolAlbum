//
//  DetailViewController.swift
//  CoolAlbum
//
//  Created by Nirmal Mehra on 21/01/21.
//

import UIKit
import Combine
import SDWebImage

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    let detailViewModel: DetailViewModel
    private var bindings = Set<AnyCancellable>()
    
    init() {
        detailViewModel = DetailViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()
        view = detailView
        title = "Album Pics"
        setUpCollectionView()
        bindViewModelToView()
        detailViewModel.fetchAlbumData()
    }
    
    func setUpCollectionView() {
        detailView.detailCollectionView.register(DetailCollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCell.identifier)
        detailView.detailCollectionView.dataSource = self
        detailView.detailCollectionView.delegate = self
    }
    
    func bindViewModelToView() {
        detailViewModel.$albumData
            .receive(on: RunLoop.main)
            .sink { (albumData) in
                self.detailViewModel.albumItems = albumData
                self.detailView.detailCollectionView.reloadData()
            }
            .store(in: &bindings)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        detailView.detailCollectionView.frame = view.bounds
    }

}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // MARK:- CollectionView Delegate and DataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return detailViewModel.albumItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let dequeuedCell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCell.identifier, for: indexPath)
        guard let detailViewCell = dequeuedCell as? DetailCollectionViewCell else {
            fatalError("Could not dequeue a cell")
        }
        
        if detailViewModel.albumItems.count > 1 {
            let imageUrl = URL(string: detailViewModel.albumItems[indexPath.row].url)
            detailViewCell.detailImageView.sd_setImage(with: imageUrl, completed: nil)
        }
        
        return detailViewCell
    }
    
    //MARK:- FlowLayout Delegate
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(
            width: (view.frame.size.width/3)-3,
            height: (view.frame.size.width/3)-3
        )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }
}
