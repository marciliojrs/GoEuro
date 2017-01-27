//
//  Providers.swift
//  GoEuro
//
//  Created by Marcilio Junior on 26/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Moya
import RxSwift

struct Providers {

    typealias ApiTargetType = GoEuroRestApi

    fileprivate static let endpointClosure: ((ApiTargetType) -> Endpoint<ApiTargetType>) = { (target) -> Endpoint<ApiTargetType> in
        return Endpoint<ApiTargetType>(
            url: target.url,
            sampleResponseClosure: { .networkResponse(200, target.sampleData) },
            method: target.method,
            parameters: target.parameters,
            parameterEncoding: target.encoding,
            httpHeaderFields: target.headerFields)
    }

    static let defaultProvider = RxMoyaProvider<ApiTargetType>(endpointClosure: endpointClosure, stubClosure: MoyaProvider.neverStub, plugins: [NetworkLoggerPlugin()])

    static let testProvider = RxMoyaProvider<ApiTargetType>(endpointClosure: endpointClosure, stubClosure: MoyaProvider.immediatelyStub)

}
