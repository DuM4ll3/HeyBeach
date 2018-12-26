//
//  ImageService.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

typealias ImageServiceCompletion = (ServiceResult<[Image]>) -> Void

protocol ImageServiceType: NetworkService {
    func getImages(_ completion: @escaping ImageServiceCompletion)
}

struct ImageService: ImageServiceType {
    
    private let heyBeach: NetworkProvider<HeyBeachApi>
    
    init(heyBeach: NetworkProvider<HeyBeachApi> = NetworkProvider<HeyBeachApi>()) {
        self.heyBeach = heyBeach
    }
    
    func getImages(_ completion: @escaping ImageServiceCompletion) {
        guard let url = Bundle.main.url(forResource: "Images", withExtension: "json"),
            let data = try? Data(contentsOf: url)
            else { return }
        let result: NetworkResult = .success(data)
        decode(result, for: [Image].self, completion: completion)
//        heyBeach.request(.beaches(page: 1)) { (result) in
//            decode(result, for: [Image].self, completion: completion)
//        }
    }
}
