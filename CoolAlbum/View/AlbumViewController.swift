//
//  AlbumViewController.swift
//  CoolAlbum
//
//  Created by Nirmal Mehra on 21/01/21.
//

import UIKit
import Combine

class AlbumViewController: UIViewController, UISearchBarDelegate {

    let albumView = AlbumView()
    private let albumViewModel = AlbumViewModel()
    let searchController = UISearchController()
    var cancellables = Set<AnyCancellable>()
    
    override func loadView() {
        super.loadView()
        view = albumView
        setUpTableView()
        setUpSearchBarView()
        bindViewModelToView()
    }
    
    func setUpTableView() {
        albumView.albumTableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: AlbumTableViewCell.identifier)
        albumView.albumTableView.delegate = self
        albumView.albumTableView.dataSource = self
    }
    
    func setUpSearchBarView() {
        navigationItem.searchController = searchController
        navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        navigationItem.title = "Albums"
        searchController.searchBar.placeholder = "Search Albums"
    }
    
    func bindViewModelToView() {
        
        let listHandler: ([String]) -> Void = { [weak self] _ in
            self?.albumView.albumTableView.reloadData()
        }
        
        albumViewModel.$albumPublishedList
            .receive(on: RunLoop.main)
            .sink(receiveValue: listHandler)
            .store(in: &cancellables)
    }
    
    //MARK:- SearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.count == 0 {
            albumViewModel.shouldShowSearchResults = false;
            albumView.albumTableView.reloadData()
            } else {
                let searchString = searchController.searchBar.text
                albumViewModel.filteredArray = albumViewModel.albumList.filter({ (item) -> Bool in
                    let albumText: NSString = item as NSString
                    return (albumText.range(of: searchString ?? "", options: NSString.CompareOptions.caseInsensitive).location) != NSNotFound
                })
                
                print("Filtered Array --> \(albumViewModel.filteredArray)")
                
                if(albumViewModel.filteredArray.count == 0){
                    albumViewModel.shouldShowSearchResults = false;
                } else {
                    albumViewModel.shouldShowSearchResults = true;
                }
                albumView.albumTableView.reloadData()
            }
    }
    
}

// MARK:- TableView Delegates and DataSource

extension AlbumViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albumViewModel.shouldShowSearchResults ? albumViewModel.filteredArray.count : albumViewModel.albumList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dequeuedCell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.identifier, for: indexPath)
        
        guard let albumCell = dequeuedCell as? AlbumTableViewCell else {
            fatalError("Could not dequeue a cell")
        }
        
        if albumViewModel.shouldShowSearchResults {
            albumCell.albumNameLabel.text = albumViewModel.filteredArray[indexPath.row]
            print("Show search results")
        } else {
            albumCell.albumNameLabel.text = albumViewModel.albumList[indexPath.row]
            print("Dont show search results")
        }
        return albumCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(DetailViewController(), animated: false)
    }
    
}
