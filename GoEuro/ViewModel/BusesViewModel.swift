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

    typealias SectionType = SectionViewModelType<TravelItemViewModel>
    private let apiClient: NetworkClient
    private var loadingStateVariable: Variable<Bool>
    private var numberOfValues: Int = 0

    init(apiClient: NetworkClient = NetworkClient(provider: Providers.defaultProvider)) {
        self.apiClient = apiClient
        self.loadingStateVariable = Variable(false)
    }

    var hasContent: Bool {
        return loadingStateVariable.value ? false : numberOfValues > 0
    }

    var loadingState: Observable<Bool> {
        return loadingStateVariable.asObservable()
    }

    var buses: Observable<[SectionType]> {
        loadingStateVariable.value = true
        return apiClient.fetchBuses()
            .map { $0 as [TravelMode] }
            .viewModels()
            .do(onNext: { [unowned self] items in
                self.numberOfValues = items.count
                self.loadingStateVariable.value = false
            })
            .map { [SectionViewModelType(viewModels: $0)] }
    }

}
