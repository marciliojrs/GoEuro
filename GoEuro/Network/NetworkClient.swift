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

    fileprivate let networkProvider: RxMoyaProvider<Providers.ApiTargetType>

    init(provider: RxMoyaProvider<Providers.ApiTargetType> = Providers.defaultProvider) {
        self.networkProvider = provider
    }

}

extension NetworkClient {

    func fetchTrains() -> Observable<[Train]> {
        return networkProvider
            .request(.trains)
            .observeOn(SerialDispatchQueueScheduler(qos: .userInteractive))
            .mapJSON()
            .parseJSONArray()
    }

    func fetchBuses() -> Observable<[Bus]> {
        return networkProvider
            .request(.buses)
            .observeOn(SerialDispatchQueueScheduler(qos: .userInteractive))
            .mapJSON()
            .parseJSONArray()
    }

    func fetchFlights() -> Observable<[Flight]> {
        return networkProvider
            .request(.flights)
            .observeOn(SerialDispatchQueueScheduler(qos: .userInteractive))
            .mapJSON()
            .parseJSONArray()
    }

}
