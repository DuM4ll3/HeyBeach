//
//  ApiType.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Foundation

public typealias Parameters = [String: Any]

public enum HTTPMethod: String {
    case get = "GET"
}

public enum Task {
    case requestParameters(parameters: Parameters)
}

protocol ApiType {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
}
