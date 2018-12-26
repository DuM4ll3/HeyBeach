//
//  TabBarView.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

protocol TabBarView: BaseView {
    var onImageFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onUserFlowSelect: ((UINavigationController) -> Void)? { get set }
    var onViewDidLoad: ((UINavigationController) -> Void)? { get set }
}
