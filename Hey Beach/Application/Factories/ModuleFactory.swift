//
//  ModuleFactory.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

protocol AuthModuleFactory {
    func makeAuthView() -> AuthView
}

protocol ImagesModuleFactory {
    func makeImagesView() -> ImagesView
}

final class ModuleFactory:
    AuthModuleFactory,
    ImagesModuleFactory {
    
    func makeAuthView() -> AuthView {
        return AuthViewController.fromStoryboard(.auth)
    }
    
    func makeImagesView() -> ImagesView {
        return ImagesViewController.fromStoryboard(.images)
    }
}
