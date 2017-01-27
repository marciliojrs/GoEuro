//
//  Coordinator.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit

protocol Coordinator: class {

    var window: UIWindow { get }

    init(window: UIWindow)

    func start()

}
