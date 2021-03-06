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
    private let service: ImageServiceType
    
    init(router: RouterType, factory: ImagesModuleFactory, service: ImageServiceType) {
        self.factory = factory
        self.router = router
        self.service = service
    }
    
    override func start() {
        showImages()
    }
    
    private func showImages() {
        var imagesView = factory.makeImagesView()
        let completion = imagesCompletion(view: imagesView)
        service.getImages(at: 0, completion)
        
        imagesView.onLoadMoreImages = { [unowned self] page in
            self.service.getImages(at: page, completion)
        }
        
        imagesView.onUserClick = { [unowned self] in
            self.showDetails()
        }
        
        router.setRootModule(imagesView)
    }
    
    private func showDetails() {
        let imageDetailsView = factory.makeImageDetails()
        router.push(imageDetailsView)
    }
    
    private func imagesCompletion(view: ImagesView) -> (ServiceResult<[Image]>) -> Void {
        return { (result) in
            switch result {
            case let .success(images):
                view.display(images ?? [])
            case let .failure(error):
                print(error.localizedDescription)
            }
        }
    }
}
