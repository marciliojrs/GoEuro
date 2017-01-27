//
//  ContainerViewController.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit
import XLPagerTabStrip

final class ContainerViewController: ButtonBarPagerTabStripViewController {

    var pages: [UIViewController] = []

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return pages
    }

}
