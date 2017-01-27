//
//  TrainsViewController.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import RxDataSources

final class TrainsViewController: BaseViewController {

    fileprivate var dataSource = RxTableViewSectionedReloadDataSource<TrainsViewModel.SectionType>()

    let viewModel: TrainsViewModel

    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(viewModel: TrainsViewModel) {
        self.viewModel = viewModel

        super.init()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

}

extension TrainsViewController {

    fileprivate func setup() {
        setupTableView()
    }

    private func setupTableView() {
        dataSource.configureCell = { (_, tableView, indexPath, viewModel) in
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.travelCell, for: indexPath)!

            cell.viewModel = viewModel

            return cell
        }

        viewModel.trains
            .bindTo(tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(rx_disposeBag)
    }

}

extension TrainsViewController: IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Trains")
    }

}
