//
//  TravelCell.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit

class TravelCell: UITableViewCell {

    @IBOutlet weak var providerLogoImageView: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var stopsLabel: UILabel!
    @IBOutlet weak var travelIntervalLabel: UILabel!
    @IBOutlet weak var travelTimeLabel: UILabel!

    var viewModel: TravelItemViewModel! {
        didSet {
            viewModel.travelInterval
                .drive(travelIntervalLabel.rx.text)
                .addDisposableTo(rx_disposeBag)

            viewModel.travelTime
                .drive(travelTimeLabel.rx.text)
                .addDisposableTo(rx_disposeBag)

            viewModel.price
                .drive(priceLabel.rx.attributedText)
                .addDisposableTo(rx_disposeBag)

            viewModel.numberOfStops
                .drive(stopsLabel.rx.text)
                .addDisposableTo(rx_disposeBag)

            viewModel.providerLogo
                .drive(providerLogoImageView.rx.downloadableImage)
                .addDisposableTo(rx_disposeBag)
        }
    }

}
