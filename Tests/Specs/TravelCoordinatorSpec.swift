//
//  TravelCoordinatorSpec.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Quick
import Nimble
import UIKit
import CoreLocation
@testable import GoEuro

class TravelCoordinatorSpec: QuickSpec {

    override func spec() {
        var coordinator: TravelCoordinator!
        let mockedWindow = UIWindow()

        beforeEach {
            mockedWindow.makeKeyAndVisible()

            coordinator = TravelCoordinator(window: mockedWindow)
        }

        describe("TravelCoordinator") {
            beforeEach {
                coordinator.start()
            }

            context("when init") {
                it("should have properties correctly setted") {
                    expect(coordinator.window) == mockedWindow
                }
            }

            context("when start") {
                it("should have a ContainerViewController on screen") {
                    let rootViewController = mockedWindow.rootViewController
                    expect(rootViewController is UINavigationController) == true

                    let navigationController = rootViewController as! UINavigationController
                    expect(navigationController.topViewController is ContainerViewController) == true

                    let containerViewController = navigationController.topViewController as! ContainerViewController
                    expect(containerViewController.pages.count) == 3
                }
            }
        }
    }
    
}
