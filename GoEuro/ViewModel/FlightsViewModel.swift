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
    private var loadingStateVariable: Variable<Bool>
    private var numberOfValues: Int = 0
    private let sortObservable: BehaviorSubject<Bool?>
    private var flightsCache: Variable<[TravelMode]?>
    private let disposeBag = DisposeBag()
    private let coordinator: TravelCoordinator
    private var currentSort: Bool = false

    init(apiClient: NetworkClient = NetworkClient(provider: Providers.defaultProvider), coordinator: TravelCoordinator, sortObservable: BehaviorSubject<Bool?>) {
        self.apiClient = apiClient
        self.loadingStateVariable = Variable(false)
        self.sortObservable = sortObservable
        self.coordinator = coordinator
        self.flightsCache = Variable(nil)
    }

    var hasContent: Bool {
        return loadingStateVariable.value ? false : numberOfValues > 0
    }

    var loadingState: Observable<Bool> {
        return loadingStateVariable.asObservable()
    }

    private var cachedFlights: Observable<[TravelMode]> {
        return Observable.deferred {
            if let cache = self.flightsCache.value {
                return Observable.just(cache)
            }
            else {
                return self.apiClient.fetchFlights()
                    .map { $0 as [TravelMode] }
                    .do(onNext: { self.flightsCache.value = $0 })
            }
        }.observeOn(MainScheduler.instance)
    }

    var flights: Observable<[SectionType]> {
        loadingStateVariable.value = true

        let sortObservable = self.sortObservable
            .asObservable()
            .filter { [unowned self] _ in
                guard let containerViewController = self.coordinator.containerViewController else { return false }
                return containerViewController.currentIndex == 0
            }

        return Observable.combineLatest(cachedFlights, sortObservable) { flights, sort in
            guard let containerViewController = self.coordinator.containerViewController else { return flights }

            if sort != nil, containerViewController.currentIndex == 0 {
                self.currentSort = !self.currentSort
                if self.currentSort {
                    return flights.sorted(by: { $0.0.departureTime < $0.1.departureTime })
                }
                else {
                    return flights.sorted(by: { $0.0.departureTime > $0.1.departureTime })
                }
            }
            else {
                return flights
            }
        }.viewModels()
        .do(onNext: { [unowned self] items in
            self.numberOfValues = items.count
            self.loadingStateVariable.value = false
        }).map { [SectionViewModelType(viewModels: $0)] }
    }

}
