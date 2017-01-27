//
//  FlightsViewController.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit
import XLPagerTabStrip

final class FlightsViewController: BaseViewController {

    let viewModel: FlightsViewModel

    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(viewModel: FlightsViewModel) {
        self.viewModel = viewModel

        super.init()
    }

}

extension FlightsViewController: IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Flights")
    }

}
