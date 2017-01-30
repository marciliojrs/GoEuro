//
//  NetworkClient.swift
//  GoEuro
//
//  Created by Marcilio Junior on 26/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import RxSwift
import Moya
import ObjectMapper

struct NetworkClient {

    typealias JSON = [String: Any]

    fileprivate let scheduler: SerialDispatchQueueScheduler
    fileprivate let networkProvider: RxMoyaProvider<Providers.ApiTargetType>

    init(provider: RxMoyaProvider<Providers.ApiTargetType> = Providers.defaultProvider) {
        self.networkProvider = provider
        self.scheduler = SerialDispatchQueueScheduler(qos: .background)
    }

}

extension NetworkClient {

    func fetchTrains() -> Observable<[Train]> {
        return networkProvider
            .request(.trains)
            .timeout(2, scheduler: SerialDispatchQueueScheduler(qos: .userInteractive))
            .mapJSON()
            .parseJSONArray()
    }

    func fetchBuses() -> Observable<[Bus]> {
        return networkProvider
            .request(.buses)
            .timeout(2, scheduler: SerialDispatchQueueScheduler(qos: .userInteractive))
            .mapJSON()
            .parseJSONArray()
    }

    func fetchFlights() -> Observable<[Flight]> {
        return networkProvider
            .request(.flights)
            .timeout(2, scheduler: SerialDispatchQueueScheduler(qos: .userInteractive))
            .mapJSON()
            .parseJSONArray()
    }

}
