//
//  ContainerViewController.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import SwiftDate

final class ContainerViewController: ButtonBarPagerTabStripViewController {

    @IBOutlet weak var subtitleLabel: UILabel!

    var pages: [UIViewController] = []

    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return pages
    }

    override func viewDidLoad() {
        settings.style.buttonBarBackgroundColor = Stylesheet.Color.blue
        settings.style.selectedBarBackgroundColor = Stylesheet.Color.orange
        settings.style.buttonBarItemBackgroundColor = Stylesheet.Color.blue
        settings.style.selectedBarHeight = 4
        settings.style.buttonBarItemFont = UIFont.boldSystemFont(ofSize: 14)

        super.viewDidLoad()

        subtitleLabel.text = Date().string(format: .custom("dd MMM"))
    }

    override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }

}
