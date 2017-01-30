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
    private let sortObservable: BehaviorSubject<Bool?>
    private var busesCache: Variable<[TravelMode]?>
    private var currentSort: Bool = false
    private let coordinator: TravelCoordinator

    init(apiClient: NetworkClient = NetworkClient(provider: Providers.defaultProvider), coordinator: TravelCoordinator, sortObservable: BehaviorSubject<Bool?>) {
        self.apiClient = apiClient
        self.loadingStateVariable = Variable(false)
        self.sortObservable = sortObservable
        self.coordinator = coordinator
        self.busesCache = Variable(nil)
    }

    var hasContent: Bool {
        return loadingStateVariable.value ? false : numberOfValues > 0
    }

    var loadingState: Observable<Bool> {
        return loadingStateVariable.asObservable()
    }

    private var cachedBuses: Observable<[TravelMode]> {
        return Observable.deferred {
            if let cache = self.busesCache.value {
                return Observable.just(cache)
            }
            else {
                return self.apiClient.fetchBuses()
                    .map { $0 as [TravelMode] }
                    .do(onNext: { self.busesCache.value = $0 })
            }
        }.observeOn(MainScheduler.instance)
    }

    var buses: Observable<[SectionType]> {
        loadingStateVariable.value = true

//        let sortObservable = self.sortObservable
//            .asObservable()
//            .filter { [unowned self] _ in
//                guard let containerViewController = self.coordinator.containerViewController else { return false }
//                return containerViewController.currentIndex == 1
//        }

        return Observable.combineLatest(cachedBuses, sortObservable) { buses, sort in
            guard let containerViewController = self.coordinator.containerViewController else { return buses }

            if sort != nil, containerViewController.currentIndex == 1 {
                self.currentSort = !self.currentSort
                if self.currentSort {
                    return buses.sorted(by: { $0.0.departureTime < $0.1.departureTime })
                }
                else {
                    return buses.sorted(by: { $0.0.departureTime > $0.1.departureTime })
                }
            }
            else {
                return buses
            }
        }.viewModels()
        .do(onNext: { [unowned self] items in
            self.numberOfValues = items.count
            self.loadingStateVariable.value = false
        }).map { [SectionViewModelType(viewModels: $0)] }
    }

}
