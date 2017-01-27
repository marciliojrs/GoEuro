//
//  UINavigationController+StatusBar.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit

extension UINavigationController {

    open override var preferredStatusBarStyle: UIStatusBarStyle {
        if let rootViewController = viewControllers.first {
            return rootViewController.preferredStatusBarStyle
        }

        return self.preferredStatusBarStyle
    }

}
