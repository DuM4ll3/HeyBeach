//
//  ImageService.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

typealias ImageServiceCompletion = (ServiceResult<[Image]>) -> Void

protocol ImageServiceType: NetworkService {
    /// get the list of images objects
    func getImages(at page: Int, _ completion: @escaping ImageServiceCompletion)
    /// get a .png image
    func getPNG(filename: String, _ completion: @escaping (UIImage?) -> Void)
}

struct ImageService: ImageServiceType {
    
    func getImages(at page: Int, _ completion: @escaping ImageServiceCompletion) {
        heyBeach.request(.beaches(page: page)) { (result) in
            self.decode(result, for: [Image].self, completion: completion)
        }
    }
    
    func getPNG(filename: String, _ completion: @escaping (UIImage?) -> Void) {
        // TODO: refactor this
        if let filename = filename as NSString?,
            let image = ImageCache.shared.object(forKey: filename) {
            completion(image)
            print("YOU GOT IT FROM CACHE")
            return
        }
        
        heyBeach.request(.png(filename)) { (result) in
            DispatchQueue.main.async {
                switch result {
                case let .success(data):
                    if let data = data {
                        let image = UIImage(data: data)
                        completion(image)
                        return
                    }
                    completion(nil)
                case let .error(error):
                    print(error.localizedDescription)
                    completion(nil)
                }
            }
        }
    }
}
