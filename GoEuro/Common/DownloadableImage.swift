//
//  DownloadableImage.swift
//  GoEuro
//
//  Created by Marcilio Junior on 27/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import UIKit

enum DownloadableImage {
    case remote(url: URL?, placeholder: UIImage?)
    case local(image: UIImage?)
}
