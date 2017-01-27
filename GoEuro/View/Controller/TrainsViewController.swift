//
//  TrainsViewController.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit
import XLPagerTabStrip

final class TrainsViewController: BaseViewController {

    let viewModel: TrainsViewModel

    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(viewModel: TrainsViewModel) {
        self.viewModel = viewModel

        super.init()
    }

}

extension TrainsViewController: IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Trains")
    }

}
