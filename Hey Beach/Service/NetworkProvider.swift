//
//  NetworkProvider.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Foundation

typealias NetworkCompletion = (_ data: Data?, _ error: Error?) -> Void

protocol NetworkProviderType: AnyObject {
    associatedtype Api: ApiType
    func request(_ api: Api, completion: @escaping NetworkCompletion)
}

class NetworkProvider<Api: ApiType>: NetworkProviderType {
    func request(_ api: Api, completion: @escaping NetworkCompletion) {
        let session = URLSession.shared
        let request = buildRequest(to: api)
        let task = session.dataTask(with: request) { (data, response, error) in
            completion(data, error)
        }
        
        task.resume()
    }
    
    private func buildRequest(to api: Api) -> URLRequest {
        var request = URLRequest(url: api.baseURL.appendingPathComponent(api.path),
                                 cachePolicy: .useProtocolCachePolicy,
                                 timeoutInterval: 10)
        request.httpMethod = api.method.rawValue
        
        switch api.task {
        case let .requestParameters(parameters): configure(&request, with: parameters)
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
}
