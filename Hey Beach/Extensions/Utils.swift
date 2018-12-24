//
//  Utils.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Foundation

extension Encodable {
    func encode(with encoder: JSONEncoder = JSONEncoder()) throws -> Data {
        return try encoder.encode(self)
    }
}

extension Decodable {
    static func decode(with decoder: JSONDecoder = JSONDecoder(), from data: Data) throws -> Self {
        return try decoder.decode(Self.self, from: data)
    }
}
