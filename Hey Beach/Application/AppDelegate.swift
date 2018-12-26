//
//  AppDelegate.swift
//  Hey Beach
//
//  Created by Rafael Ferraz on 23/12/18.
//  Copyright © 2018 Rafael Ferraz. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var rootController: UINavigationController {
        return self.window!.rootViewController as! UINavigationController
    }

    private lazy var appCoordinator: Coordinator = makeCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        appCoordinator.start()
        return true
    }
    
    private func makeCoordinator() -> Coordinator {
        return AppCoordinator(router: Router(rootController: rootController),
                              coordinatorFactory: CoordinatorFactory())
    }
}
