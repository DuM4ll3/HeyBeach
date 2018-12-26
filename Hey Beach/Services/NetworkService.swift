//
//  NetworkService.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 26/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

typealias NetworkServiceCompletion<T: Decodable> = (ServiceResult<T>) -> Void

enum ServiceResult<T: Decodable> {
    case success(T?)
    case failure(Error)
}

protocol NetworkService {
    func decode<T: Decodable>(_ result: NetworkResult, for type: T.Type?, completion: @escaping NetworkServiceCompletion<T>)
}

extension NetworkService {
    func decode<T: Decodable>(_ result: NetworkResult, for type: T.Type? = nil, completion: @escaping NetworkServiceCompletion<T>) {
        DispatchQueue.main.async {
            switch result {
            case let .success(data):
                if let json = data,
                    let type = type {
                    let model = try? type.decode(from: json)
                    completion(.success(model))
                    return
                }
                completion(.success(nil))
            case let .error(error):
                completion(.failure(error))
            }
        }
    }
}
