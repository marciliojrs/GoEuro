//
//  AppCoordinatorSpec.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Quick
import Nimble
@testable import GoEuro

class AppCoordinatorSpec: QuickSpec {

    override func spec() {
        var mockedWindow: UIWindow!
        var appCoordinator: AppCoordinator!

        beforeEach {
            mockedWindow = UIWindow()
            appCoordinator = AppCoordinator(window: mockedWindow)
        }

        describe("AppCoordinator") {
            context("when start") {
                beforeEach {
                    appCoordinator.start()
                }

                it("should have a UINavigationController as rootViewController") {
                    expect(mockedWindow.rootViewController is UINavigationController) == true
                }

                it("should have a ContainerViewController as topViewController of UINavigationController") {                    
                    let navigationController = mockedWindow.rootViewController as! UINavigationController
                    expect(navigationController.topViewController is ContainerViewController) == true
                }
            }
        }
    }
    
}
