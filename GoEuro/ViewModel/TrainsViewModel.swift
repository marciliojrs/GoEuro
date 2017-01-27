//
//  TrainsViewModel.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import RxSwift
import RxCocoa

class TrainsViewModel: ViewModel {

    typealias SectionType = SectionViewModelType<TravelItemViewModel>
    private let apiClient: NetworkClient

    init(apiClient: NetworkClient = NetworkClient(provider: Providers.defaultProvider)) {
        self.apiClient = apiClient
    }

    var trains: Observable<[SectionType]> {
        return apiClient.fetchTrains()
            .map { $0 as [TravelMode] }
            .viewModels()
            .map { [SectionViewModelType(viewModels: $0)] }
    }

}
