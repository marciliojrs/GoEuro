//
//  EnumKey.swift
//  GoEuro
//
//  Created by Marcilio Junior on 26/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import ObjectMapper

protocol EnumKey {
    var rawValue: String { get }
}

extension Map {

    subscript(key: EnumKey) -> Map {
        return self[key.rawValue]
    }
    
}
