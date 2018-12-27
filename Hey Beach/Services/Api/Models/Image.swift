//
//  Image.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

struct Image: Decodable {
    
    struct Dimension {
        let width: Int
        let height: Int
    }
    
    let id: String
    let name: String
    let url: String
    private let width: String
    private let height: String
    
    private enum CodingKeys: String, CodingKey {
        case id = "_id"
        case name
        case url
        case width
        case height
    }
}

extension Image {
    var dimension: Dimension {
        return Dimension(width: Int(width) ?? 0, height: Int(height) ?? 0)
    }
}
