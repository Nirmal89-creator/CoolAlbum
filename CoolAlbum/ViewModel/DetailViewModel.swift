//
//  DetailViewModel.swift
//  CoolAlbum
//
//  Created by Nirmal Mehra on 21/01/21.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    
    @Published var albumData = AlbumList()
    var albumItems = AlbumList()
    private let albumService: AlbumApiService
    private var bindings = Set<AnyCancellable>()
    
    init() {
        albumService = AlbumApiService()
    }
    
    func fetchAlbumData() {
        let completionHandler: (AlbumList) -> Void = { value in
            self.albumData = value
        }
        
        albumService.fetchAlbumList()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {_ in }, receiveValue: completionHandler)
            .store(in: &bindings)
    }
}
