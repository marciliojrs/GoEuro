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
    private var loadingStateVariable: Variable<Bool>
    private var numberOfValues: Int = 0
    private let sortObservable: BehaviorSubject<Bool?>
    private var trainsCache: Variable<[TravelMode]?>
    private var currentSort: Bool = false
    private let coordinator: TravelCoordinator

    init(apiClient: NetworkClient = NetworkClient(provider: Providers.defaultProvider), coordinator: TravelCoordinator, sortObservable: BehaviorSubject<Bool?>) {
        self.apiClient = apiClient
        self.loadingStateVariable = Variable(false)
        self.sortObservable = sortObservable
        self.coordinator = coordinator
        self.trainsCache = Variable(nil)
    }

    var hasContent: Bool {
        return loadingStateVariable.value ? false : numberOfValues > 0
    }

    var loadingState: Observable<Bool> {
        return loadingStateVariable.asObservable()
    }

    private var cachedTrains: Observable<[TravelMode]> {
        return Observable.deferred {
            if let cache = self.trainsCache.value {
                return Observable.just(cache)
            }
            else {
                return self.apiClient.fetchTrains()
                    .map { $0 as [TravelMode] }
                    .do(onNext: { self.trainsCache.value = $0 })
            }
        }.observeOn(MainScheduler.instance)
    }

    var trains: Observable<[SectionType]> {
        loadingStateVariable.value = true

        return Observable.combineLatest(cachedTrains, sortObservable) { trains, sort in
            guard let containerViewController = self.coordinator.containerViewController else { return trains }

            if sort != nil, containerViewController.currentIndex == 2 {
                self.currentSort = !self.currentSort
                if self.currentSort {
                    return trains.sorted(by: { $0.0.departureTime < $0.1.departureTime })
                }
                else {
                    return trains.sorted(by: { $0.0.departureTime > $0.1.departureTime })
                }
            }
            else {
                return trains
            }
        }.viewModels()
        .do(onNext: { [unowned self] items in
            self.numberOfValues = items.count
            self.loadingStateVariable.value = false
        }).map { [SectionViewModelType(viewModels: $0)] }
    }

}
