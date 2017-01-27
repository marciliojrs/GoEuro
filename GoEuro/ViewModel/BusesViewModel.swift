//
//  BusesViewModel.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import RxSwift
import RxCocoa

class BusesViewModel: ViewModel {

    private let apiClient: NetworkClient

    init(apiClient: NetworkClient = NetworkClient(provider: Providers.defaultProvider)) {
        self.apiClient = apiClient
    }

    var buses: Observable<[Bus]> {
        return apiClient.fetchBuses()
    }

}
