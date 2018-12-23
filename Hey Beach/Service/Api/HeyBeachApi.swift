//
//  HeyBeachApi.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Foundation

enum HeyBeachApi {
    case beaches(page: Int)
}

extension HeyBeachApi: ApiType {
    var baseURL: URL {
        return URL(string: "http://techtest.lab1886.io:3000")!
    }
    
    var path: String {
        switch self {
        case .beaches: return "/beaches"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .beaches: return .get
        }
    }
    
    var task: Task {
        switch self {
        case .beaches(let page): return .requestParameters(parameters: ["page" : page])
        }
    }
}
