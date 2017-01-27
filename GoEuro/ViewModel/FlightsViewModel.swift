//
//  FlightsViewModel.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import RxSwift
import RxCocoa

class FlightsViewModel: ViewModel {

    typealias SectionType = SectionViewModelType<TravelItemViewModel>
    private let apiClient: NetworkClient

    init(apiClient: NetworkClient = NetworkClient(provider: Providers.defaultProvider)) {
        self.apiClient = apiClient
    }

    var flights: Observable<[SectionType]> {
        return apiClient.fetchFlights()
            .map { $0 as [TravelMode] }
            .viewModels()
            .map { [SectionViewModelType(viewModels: $0)] }
    }

}
