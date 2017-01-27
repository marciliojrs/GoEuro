//
//  TravelItemViewModel.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Foundation
import RxCocoa
import SwiftDate

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
        let departureComponents = item.departureTime.components(separatedBy: ":")
        let departureHour = departureComponents.first!
        let departureMinute = departureComponents.last!

        let arrivalComponents = item.arrivalTime.components(separatedBy: ":")
        let arrivalHour = arrivalComponents.first!
        let arrivalMinute = arrivalComponents.last!

        let now = Date()
        if let departure = try? now.atTime(hour: Int(departureHour)!, minute: Int(departureMinute)!, second: 0), let arrival = try? now.atTime(hour: Int(arrivalHour)!, minute: Int(arrivalMinute)!, second: 0), let time = try? arrival.timeComponents(to: departure, options: ComponentsFormatterOptions(style: .positional)) {

            return .just("\(time.substring(to: time.characters.count - 3))h")
        }
        else {
            return .just("")
        }
    }

    var price: Driver<NSAttributedString> {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = "EUR"

        if let string = numberFormatter.string(from: item.price) {
            let attributedString = NSMutableAttributedString(string: string)
            let dotLocation = string.characters.count - 3
            attributedString.addAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 12)], range: NSRange(location: dotLocation, length: 3))

            return .just(attributedString)
        }

        return .just(NSAttributedString(string: ""))
    }

    var providerLogo: Driver<DownloadableImage> {
        return .just(.remote(url: item.providerLogo, placeholder: nil))
    }

}
