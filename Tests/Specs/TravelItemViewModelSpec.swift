//
//  TravelItemViewModelSpec.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Quick
import Nimble
import ObjectMapper
import RxBlocking
@testable import GoEuro

class TravelItemViewModelSpec: QuickSpec {

    typealias JSON = [String: Any]
    typealias Key = TravelMode.Key

    override func spec() {
        var viewModel: TravelItemViewModel!

        describe("TravelItemViewModel") { 
            context("when instantiate with a valid TravelMode") {
                beforeEach {
                    let json: JSON = [Key.id.rawValue: 1, Key.arrivalTime.rawValue: "12:00", Key.departureTime.rawValue: "11:00", Key.numberOfStops.rawValue: 0, Key.price.rawValue: 100.00, Key.providerLogo.rawValue: "http://url.com"]
                    let item = Mapper<TravelMode>().map(JSON: json)
                    viewModel = TravelItemViewModel(item: item!)
                }

                it("should have all values correctly instantiated") {
                    let numberOfStops: String = try! viewModel.numberOfStops
                        .toBlocking().toArray().first!
                    let price: NSAttributedString = try! viewModel.price
                        .toBlocking().toArray().first!
                    let travelInterval: String = try! viewModel.travelInterval
                        .toBlocking().toArray().first!
                    let travelTime: String = try! viewModel.travelTime
                        .toBlocking().toArray().first!
                    let providerLogo: DownloadableImage = try! viewModel.providerLogo
                        .toBlocking().toArray().first!

                    expect(numberOfStops) == "Direct"
                    expect(travelTime) == "1:00h"
                    expect(travelInterval) == "11:00 - 12:00"
                    expect(price.string) == "€100.00"
                    expect(providerLogo) == DownloadableImage.remote(url: URL(string: "http://url.com")!, placeholder: nil)
                }
            }

            context("when have more than 0 stops") {
                beforeEach {
                    let json: JSON = [Key.id.rawValue: 1, Key.arrivalTime.rawValue: "12:00", Key.departureTime.rawValue: "11:00", Key.numberOfStops.rawValue: 2, Key.price.rawValue: 100.00, Key.providerLogo.rawValue: ""]
                    let item = Mapper<TravelMode>().map(JSON: json)
                    viewModel = TravelItemViewModel(item: item!)
                }

                it("should have a text referred to number of stops") {
                    let numberOfStops: String = try! viewModel.numberOfStops
                        .toBlocking().toArray().first!

                    expect(numberOfStops) == "2 stops"
                }
            }
        }
    }

}
