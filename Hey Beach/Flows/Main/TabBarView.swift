//
//  TabBarView.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

protocol TabBarView: BaseView {
    var onImageFlowSelect: ((UINavigationController) -> ())? { get set }
    var onUserFlowSelect: ((UINavigationController) -> ())? { get set }
    var onViewDidLoad: ((UINavigationController) -> ())? { get set }
}
