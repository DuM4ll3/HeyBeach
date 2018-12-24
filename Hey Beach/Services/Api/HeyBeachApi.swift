//
//  HeyBeachApi.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Foundation

enum HeyBeachApi {
    case register(_ user: User)
    case login(_ user: User)
    case logout
    case me
    case beaches(page: Int)
}

extension HeyBeachApi: ApiType {
    var baseURL: URL {
        return URL(string: "http://techtest.lab1886.io:3000")!
    }
    
    var path: String {
        switch self {
        case .beaches:  return "/beaches"
        case .register: return "/user/register"
        case .login:    return "/user/login"
        case .logout:   return "/user/logout"
        case .me:       return "/user/me"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .beaches,
             .me:
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
             .logout:
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
            return ["x-auth": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1YzIxMDZiYmYwODNlYzAwMTI0OGJlODkiLCJhY2Nlc3MiOiJhdXRoIiwiaWF0IjoxNTQ1NjY4NjExfQ.cYtMg_n69HObHUOYUi_MQByZL0YeSBoAW-59SXVk7DY"] // TODO: get from some property
        case .login,
             .register:
            return ["Content-type": "application/json"]
        case .beaches:
            return nil
        }
    }
}
