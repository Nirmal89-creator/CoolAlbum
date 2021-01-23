//
//  AlbumModel.swift
//  CoolAlbum
//
//  Created by Nirmal Mehra on 21/01/21.
//

import Foundation

struct Album: Codable {
    let albumID, id: Int
    let title: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case id, title, url
        case thumbnailURL = "thumbnailUrl"
    }
}

typealias AlbumList = [Album]
