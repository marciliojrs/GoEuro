//
//  StatefulViewController+Rx.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import RxSwift
import RxCocoa
import StatefulViewController

extension Reactive where Base: StatefulViewController {

    var isLoading: UIBindingObserver<Base, Bool> {
        return UIBindingObserver(UIElement: self.base) { control, value in
            if value {
                control.startLoading()
            }
            else {
                control.endLoading()
            }
        }
    }

}
