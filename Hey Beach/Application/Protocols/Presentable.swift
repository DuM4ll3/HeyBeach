//
//  Presentable.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 24/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit
/// in order to the view let access to its controller
/// i.e: by the router
protocol Presentable {
    func toPresent() -> UIViewController?
}
