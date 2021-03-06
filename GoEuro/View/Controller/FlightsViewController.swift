//
//  FlightsViewController.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit
import XLPagerTabStrip
import RxDataSources
import StatefulViewController

final class FlightsViewController: BaseViewController {

    fileprivate var dataSource = RxTableViewSectionedReloadDataSource<FlightsViewModel.SectionType>()

    let viewModel: FlightsViewModel

    required init?(coder aDecoder: NSCoder) { fatalError() }

    init(viewModel: FlightsViewModel) {
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

extension FlightsViewController: StatefulViewController {

    func hasContent() -> Bool {
        return viewModel.hasContent
    }

}

extension FlightsViewController: LoadingStatePresentableViewController {

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

        viewModel.flights
            .bindTo(tableView.rx.items(dataSource: dataSource))
            .addDisposableTo(rx_disposeBag)

        viewModel.loadingState
            .bindTo(rx.isLoading)
            .addDisposableTo(rx_disposeBag)
    }

}

extension FlightsViewController: IndicatorInfoProvider {

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Flights")
    }

}
