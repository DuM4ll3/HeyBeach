//
//  ImagesCoordinator.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 25/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

final class ImagesCoordinator: BaseCoordinator {
    
    private let factory: ImagesModuleFactory
    private let router: RouterType
    
    init(router: RouterType, factory: ImagesModuleFactory) {
        self.factory = factory
        self.router = router
    }
    
    override func start() {
        showImages()
    }
    
    private func showImages() {
        var imagesView = factory.makeImagesView()
        
        let service: ImageServiceType = ImageService()
        service.getImages { (result) in
            switch result {
            case let .success(images):
                print(images?.first?.id)
            case .failure:
                break
            }
        }
        
        imagesView.display([])
        
        router.push(imagesView)
    }
}
