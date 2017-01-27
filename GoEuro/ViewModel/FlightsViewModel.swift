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

    private let apiClient: NetworkClient

    init(apiClient: NetworkClient = NetworkClient(provider: Providers.defaultProvider)) {
        self.apiClient = apiClient
    }

    var flights: Observable<[Flight]> {
        return apiClient.fetchFlights()
    }

}
