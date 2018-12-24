//
//  ImageService.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import Foundation

typealias ImageServiceCompletion = (ServiceResult<[Image]>) -> Void

protocol ImageServiceType {
    func getImages(_ completion: @escaping ImageServiceCompletion)
}

struct ImageService: ImageServiceType {
    
    private let heyBeach: NetworkProvider<HeyBeachApi>
    
    init(heyBeach: NetworkProvider<HeyBeachApi> = NetworkProvider<HeyBeachApi>()) {
        self.heyBeach = heyBeach
    }
    
    func getImages(_ completion: @escaping ImageServiceCompletion) {
        heyBeach.request(.beaches(page: 1)) { (result) in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    if let json = data {
                        let images: [Image]? = try? [Image].decode(from: json)
                        completion(.success(images))
                    }
                case let .error(error):
                    completion(.failure(error))
                }
            }
        }
    }
}
