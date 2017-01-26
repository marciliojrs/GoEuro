//
//  GoEuroRestApi.swift
//  GoEuro
//
//  Created by Marcilio Junior on 26/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Moya

enum GoEuroRestApi {
    case trains
    case flights
    case buses
}

extension GoEuroRestApi: TargetType {

    var baseURL: URL {
        return URL(string: "https://api.myjson.com/bins/")!
    }

    var path: String {
        switch self {
        case .trains: return "3zmcy"
        case .flights: return "w60i"
        case .buses: return "37yzm"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var parameters: [String: Any]? {
        return nil
    }

    var encoding: Moya.ParameterEncoding {
        return JSONEncoding.default
    }

    var headerFields: [String: String]? {
        return ["Content-Type": "application/json"]
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        return .request
    }

    var url: String {
        return "\(baseURL)\(path)"
    }
    
}
