//
//  AlbumViewModel.swift
//  CoolAlbum
//
//  Created by Nirmal Mehra on 21/01/21.
//

import Foundation
import Combine

class AlbumViewModel: ObservableObject {
    
    @Published var albumPublishedList = [String]()
    var filteredArray = [String]()
    var shouldShowSearchResults = false
    var albumList = ["Nature", "People", "Health and Wellness", "Architecture", "Travel", "Street Photography", "Fashion", "Interiors", "Texture & Patterns", "Business & Work", "Experimental", "Athletics", "Food & Drink", "History", "Arts & Culture"]
    
    init() {
        getList()
    }

    func getList() {
        self.albumPublishedList = albumList
    }
}

    
