//
//  ObservableType+TravelMode.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import RxSwift

extension ObservableType where E == [TravelMode] {

    func viewModels() -> Observable<[TravelItemViewModel]> {
        return map { $0.map { TravelItemViewModel.init(item: $0) } }
    }
    
}
