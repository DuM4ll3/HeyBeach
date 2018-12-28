//
//  ImagesView.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

protocol ImagesViewInputs {
    var onLoadMoreImages: ((Int) -> Void)? { get set }
}

protocol ImagesViewOutputs {
    func display(_ images: [Image])
}

typealias ImagesViewType = BaseView & ImagesViewInputs & ImagesViewOutputs

protocol ImagesView: ImagesViewType {}
