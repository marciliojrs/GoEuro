//
//  AppDelegate.swift
//  GoEuro
//
//  Created by Marcilio Junior on 1/26/17
//  Copyright (c) 2017 GoEuro. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var coordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        Appearance.install()

        window = UIWindow()
        coordinator = AppCoordinator(window: window!)
        coordinator.start()

        window?.makeKeyAndVisible()

        return true
    }

}
