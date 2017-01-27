//
//  AppCoordinator.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit

final class AppCoordinator: Coordinator {

    let window: UIWindow

    required init(window: UIWindow) {
        self.window = window
    }

    func start() {
        TravelCoordinator(window: window).start()
    }

}
