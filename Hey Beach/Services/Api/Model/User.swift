//
//  User.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

// TODO: needs to decode/encode manually
// "{\"_id\":\"5c2106bbf083ec001248be89\",\"email\":\"testt3@test.com\"}"

import Foundation

struct User: Codable {
    let email: String
    let password: String
    
    private enum CodingKeys: String, CodingKey {
        case email
        case password
    }
}
