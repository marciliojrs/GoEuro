//
//  TrainsViewModel.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import RxSwift
import RxCocoa

class TrainsViewModel {

    private let apiClient: NetworkClient

    init(apiClient: NetworkClient = NetworkClient(provider: Providers.defaultProvider)) {
        self.apiClient = apiClient
    }

    var trains: Observable<[Train]> {
        return apiClient.fetchTrains()
    }

}
