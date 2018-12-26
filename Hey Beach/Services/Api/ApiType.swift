//
//  ApiType.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

public typealias Parameters = [String: Any]
public typealias HTTPHeader = [String: String]

public enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case delete = "DELETE"
}

public enum Task {
    case request
    case requestParameters(parameters: Parameters)
    case requestJSONEncodable(Encodable)
}

protocol ApiType {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: HTTPHeader? { get }
}
