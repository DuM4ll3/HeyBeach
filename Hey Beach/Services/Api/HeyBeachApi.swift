//
//  HeyBeachApi.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

enum HeyBeachApi {
    case register(_ user: User)
    case login(_ user: User)
    case logout
    case me
    case beaches(page: Int)
    case png(_ name: String)
    
    var authToken: String {
        return UserDefaults.standard.string(forKey: "authToken") ?? ""
    }
}

extension HeyBeachApi: ApiType {
    var baseURL: URL {
        return URL(string: "http://techtest.lab1886.io:3000")!
    }
    
    var path: String {
        switch self {
        case .beaches:
            return "/beaches"
        case .register:
            return "/user/register"
        case .login:
            return "/user/login"
        case .logout:
            return "/user/logout"
        case .me:
            return "/user/me"
        case let .png(name):
            return "/images/\(name)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .beaches,
             .me,
             .png:
            return .get
        case .register,
             .login:
            return .post
        case .logout:
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .me,
             .logout,
             .png:
            return .request
        case let .beaches(page):
            return .requestParameters(parameters: ["page" : page])
        case let .register(user),
             let .login(user):
            return .requestJSONEncodable(user)
        }
    }
    
    var headers: HTTPHeader? {
        switch self {
        case .me,
             .logout:
            return ["x-auth": authToken]
        case .login,
             .register:
            return ["Content-type": "application/json"]
        case .beaches,
             .png:
            return nil
        }
    }
}
