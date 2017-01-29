//
//  DownloadableImage.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit
import Foundation

enum DownloadableImage {
    case remote(url: URL?, placeholder: UIImage?)
    case local(image: UIImage?)
}

extension DownloadableImage: Equatable {

    static func ==(lhs: DownloadableImage, rhs: DownloadableImage) -> Bool {
        switch (lhs, rhs) {
        case (let .remote(urlA, placeholderA), let .remote(urlB, placeholderB)):
            return urlA == urlB && placeholderA == placeholderB
        case (let .local(imageA), let .local(imageB)):
            return imageA == imageB
        default:
            return false
        }
    }

}
