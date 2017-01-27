//
//  BusesViewController.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit
import XLPagerTabStrip

final class BusesViewController: BaseViewController {

    let viewModel: BusesViewModel

    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(viewModel: BusesViewModel) {
        self.viewModel = viewModel

        super.init()
    }

}

extension BusesViewController: IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Buses")
    }

}
