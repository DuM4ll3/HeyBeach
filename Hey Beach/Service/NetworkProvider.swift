//
//  NetworkProvider.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Foundation

typealias NetworkCompletion = (NetworkResult) -> Void

protocol NetworkProviderType: AnyObject {
    associatedtype Api: ApiType
    func request(_ api: Api, completion: @escaping NetworkCompletion)
}

enum NetworkResult {
    case success(Data?)
    case error(Error)
}

class NetworkProvider<Api: ApiType>: NetworkProviderType {
    func request(_ api: Api, completion: @escaping NetworkCompletion) {
        let session = URLSession.shared
        let request = buildRequest(to: api)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                (200 ..< 400) ~= httpResponse.statusCode,
                error == nil else {
                    completion(.error(error!))
                    return
            }
            //TODO: move this code to userService
            if let jwt = httpResponse.allHeaderFields["x-auth"] as? String {
                print(jwt)
            }
            completion(.success(data))
        }
        
        task.resume()
    }
    
    private func buildRequest(to api: Api) -> URLRequest {
        var request = URLRequest(url: api.baseURL.appendingPathComponent(api.path),
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10)
        request.httpMethod = api.method.rawValue
        request.allHTTPHeaderFields = api.headers
        
        switch api.task {
        case .request: break // or return request
        case let .requestParameters(parameters): configure(&request, with: parameters)
        case let .requestJSONEncodable(body): configure(&request, with: body)
        }
        
        return request
    }
    
    private func configure(_ request: inout URLRequest, with parameters: Parameters) {
        var components = URLComponents(url: request.url!, resolvingAgainstBaseURL: false)
        components?.queryItems = parameters.map { parameter in
            return URLQueryItem(name: parameter.key, value: parameter.value as? String)
        }
        
        request.url = components?.url
    }
    
    private func configure(_ request: inout URLRequest, with body: Encodable) {
        request.httpBody = try? body.encode()
    }
}
