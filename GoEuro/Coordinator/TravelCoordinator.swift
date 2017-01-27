//
//  TravelCoordinator.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Foundation
import UIKit

final class TravelCoordinator: Coordinator {

    let window: UIWindow

    required init(window: UIWindow) {
        self.window = window
    }

    func start() {
        guard let navigationController = R.storyboard.main.instantiateInitialViewController(),
            let viewController = navigationController.topViewController as? ContainerViewController else { return }

        let flightsViewController = FlightsViewController(viewModel: FlightsViewModel())
        let busesViewController = BusesViewController(viewModel: BusesViewModel())
        let trainsViewController = TrainsViewController(viewModel: TrainsViewModel())
        viewController.pages = [flightsViewController, busesViewController, trainsViewController]

        window.rootViewController = navigationController
    }

}
