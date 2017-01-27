//
//  TravelItemViewModel.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Foundation
import RxCocoa

class TravelItemViewModel: ViewModel {

    let item: TravelMode

    init(item: TravelMode) {
        self.item = item
    }

    var travelInterval: Driver<String> {
        return .just("\(item.departureTime!) - \(item.arrivalTime!)")
    }

    var numberOfStops: Driver<String> {
        return .just(item.numberOfStops == 0 ? "Direct" : "\(item.numberOfStops!) stops")
    }

    var travelTime: Driver<String> {
        return .just("TBD")
    }

    var price: Driver<String> {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency

        return .just(numberFormatter.string(from: item.price) ?? "")
    }

    var providerLogo: Driver<DownloadableImage> {
        return .just(.remote(url: item.providerLogo, placeholder: nil))
    }

}
