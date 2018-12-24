//
//  User.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Foundation

struct User: Codable {
    let email: String
    let password: String
    
    private enum CodingKeys: String, CodingKey {
        case email
        case password
    }
}
