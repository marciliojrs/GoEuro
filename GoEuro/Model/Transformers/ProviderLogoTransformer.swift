//
//  ProviderLogoTransformer.swift
//  GoEuro
//
//  Created by Marcilio Junior on 26/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import ObjectMapper

class ProviderLogoTransfomer: URLTransform {

    override func transformFromJSON(_ value: Any?) -> URL? {
        guard let URLString = value as? String else { return nil }

        return super.transformFromJSON(URLString.replacingOccurrences(of: "{size}", with: "63"))
    }

}
