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
import StatefulViewController

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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        setupInitialViewState()
    }

}

extension TrainsViewController: StatefulViewController {

    func hasContent() -> Bool {
        return viewModel.hasContent
    }

}

extension TrainsViewController: LoadingStatePresentableViewController {

    fileprivate func setup() {
        setupTableView()
        setupLoadingState()
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

        viewModel.loadingState
            .bindTo(rx.isLoading)
            .addDisposableTo(rx_disposeBag)
    }

}

extension TrainsViewController: IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Trains")
    }

}
