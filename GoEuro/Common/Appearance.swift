//
//  Appearance.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit

struct Appearance {

    static func install() {
        let navigationBarProxy = UINavigationBar.appearance()
        navigationBarProxy.tintColor = Stylesheet.Color.white
        navigationBarProxy.barTintColor = Stylesheet.Color.blue
        navigationBarProxy.isTranslucent = false
        navigationBarProxy.titleTextAttributes = [NSForegroundColorAttributeName: Stylesheet.Color.white]
        navigationBarProxy.setBackgroundImage(UIImage(), for: .default)
        navigationBarProxy.shadowImage = UIImage()
    }

}
