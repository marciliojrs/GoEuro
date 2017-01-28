//
//  FlightsViewModelSpec.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Quick
import Nimble
import RxBlocking
@testable import GoEuro

class FlightsViewModelSpec: QuickSpec {

    override func spec() {
        var viewModel: FlightsViewModel!

        beforeEach {
            viewModel = FlightsViewModel(apiClient: NetworkClient(provider: Providers.testProvider))
        }

        describe("FlightsViewModel") {
            context("when subscribe to flights observable") {
                it("should emit valid values") {
                    let sections: [FlightsViewModel.SectionType] = try! viewModel.flights
                        .toBlocking().toArray().first!

                    expect(sections.count) == 1
                    let items: [TravelItemViewModel] = sections.first!.items
                    expect(items.count) > 0
                }
            }
        }
    }
    
}
