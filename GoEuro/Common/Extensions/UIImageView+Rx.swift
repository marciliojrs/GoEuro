//
//  UIImageView+Rx.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import PINRemoteImage

typealias ProcessorImageAdapter = (UIImage?) -> UIImage?

extension Reactive where Base: UIImageView {

    var downloadableImage: UIBindingObserver<Base, DownloadableImage> {
        return downloadableImage(withImageProcessor: nil)
    }

    func downloadableImage(withImageProcessor processor: [String: ProcessorImageAdapter]?) -> UIBindingObserver<Base, DownloadableImage> {
        return UIBindingObserver(UIElement: base) { imageView, content in
            switch content {
            case .remote(let url, let placeholder):
                guard let url = url else { return }
                if let processor = processor, let key = processor.keys.first, let block = processor.values.first {
                    imageView.pin_setImage(from: url, placeholderImage: placeholder, processorKey: key, processor: { (result, _) -> UIImage? in
                        return block(result.image)
                    })
                }
                else {
                    imageView.pin_setImage(from: url, placeholderImage: placeholder)
                }
            case .local(let image):
                imageView.image = image
            }
        }
    }

}
