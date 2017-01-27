//
//  SectionViewModelType.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import RxDataSources

final class SectionViewModelType<T: ViewModel> {

    fileprivate let viewModels: [T]

    init(title: String? = nil, viewModels: [T]) {
        self.viewModels = viewModels
    }

}

extension SectionViewModelType: SectionModelType {

    typealias Item = T

    var items: [Item] {
        return viewModels
    }

    convenience init(original: SectionViewModelType, items: [Item]) {
        self.init(title: nil, viewModels: items)
    }

}
