//
//  ObservableType+Mappable.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import ObjectMapper
import RxSwift
import RxSwiftExt

typealias JSON = [String: Any]

extension ObservableType where E == Any {

    func parseJSONArray<T: Mappable>() -> Observable<[T]> {
        return map { (json) in
            guard let json = json as? [JSON] else { return [] }
            guard let response = Mapper<T>().mapArray(JSONArray: json) else { return [] }

            return  response
        }
    }

    func parseJSON<T: Mappable>() -> Observable<T?> {
        return map { (json) in
            guard let json = json as? JSON else { return nil }
            guard let response = Mapper<T>().map(JSON: json) else { return nil }

            return  response
        }
    }

}
