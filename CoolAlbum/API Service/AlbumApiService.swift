//
//  AlbumApiService.swift
//  CoolAlbum
//
//  Created by Nirmal Mehra on 21/01/21.
//

import Foundation
import Combine

class AlbumApiService {
    
    let url = URL(string: "https://jsonplaceholder.typicode.com/photos")
    
    func fetchAlbumList() -> AnyPublisher<AlbumList, Error> {
        
        var fetchDataTask: URLSessionDataTask?
        
        return Future<AlbumList, Error> { promise in
            fetchDataTask = URLSession.shared.dataTask(with: self.url!, completionHandler: { (data, response, error) in
                guard let data = data else { return }
                do {
                    let albums = try JSONDecoder().decode(AlbumList.self, from: data)
                    promise(.success(albums))
                } catch {
                    print(error.localizedDescription)
                }
            })
            fetchDataTask?.resume()
        }
        .subscribe(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
}
