//
//  ContainerViewModel.swift
//  GoEuro
//
//  Created by Marcilio Junior on 29/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Foundation
import RxSwift

class ContainerViewModel: ViewModel {

    var sortObservable: BehaviorSubject<Bool?> = BehaviorSubject(value: nil)

}
