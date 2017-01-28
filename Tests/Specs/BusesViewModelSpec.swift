//
//  BusesViewModelSpec.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Quick
import Nimble
import RxBlocking
@testable import GoEuro

class BusesViewModelSpec: QuickSpec {

    override func spec() {
        var viewModel: BusesViewModel!

        beforeEach {
            viewModel = BusesViewModel(apiClient: NetworkClient(provider: Providers.testProvider))
        }

        describe("BusesViewModel") {
            context("when subscribe to buses observable") {
                it("should emit valid values") {
                    let sections: [BusesViewModel.SectionType] = try! viewModel.buses
                        .toBlocking().toArray().first!

                    expect(sections.count) == 1
                    let items: [TravelItemViewModel] = sections.first!.items
                    expect(items.count) > 0
                }
            }
        }
    }
    
}
