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
    
}
