//
//  TrainsViewModelSpec.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Quick
import Nimble
import RxBlocking
@testable import GoEuro

class TrainsViewModelSpec: QuickSpec {

    override func spec() {
        var viewModel: TrainsViewModel!

        beforeEach {
            viewModel = TrainsViewModel(apiClient: NetworkClient(provider: Providers.testProvider))
        }

        describe("TrainsViewModel") {
            context("when subscribe to trains observable") {
                it("should emit valid values") {
                    let sections: [TrainsViewModel.SectionType] = try! viewModel.trains
                        .toBlocking().toArray().first!

                    expect(sections.count) == 1
                    let items: [TravelItemViewModel] = sections.first!.items
                    expect(items.count) > 0
                }
            }
        }
    }

}
