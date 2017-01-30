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

    lazy var containerViewController: ContainerViewController? = {
        guard let navigationController = R.storyboard.main.instantiateInitialViewController(),
            let viewController = navigationController.topViewController as? ContainerViewController else { return nil }

        return viewController
    }()

    func start() {
        guard let viewController = containerViewController else { return }

        viewController.viewModel = ContainerViewModel()

        let flightsViewController = FlightsViewController(viewModel: FlightsViewModel(coordinator: self, sortObservable: viewController.viewModel.sortObservable))
        let busesViewController = BusesViewController(viewModel: BusesViewModel(coordinator: self, sortObservable: viewController.viewModel.sortObservable))
        let trainsViewController = TrainsViewController(viewModel: TrainsViewModel(coordinator: self, sortObservable: viewController.viewModel.sortObservable))
        viewController.pages = [flightsViewController, busesViewController, trainsViewController]

        window.rootViewController = viewController.navigationController
    }

}
