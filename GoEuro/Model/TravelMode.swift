//
//  TravelMode.swift
//  GoEuro
//
//  Created by Marcilio Junior on 26/01/17.
//  Copyright © 2017 GoEuro. All rights reserved.
//

import ObjectMapper

class TravelMode: Mappable {

    enum Key: String, EnumKey {
        case id, arrivalTime = "arrival_time", departureTime = "departure_time", numberOfStops = "number_of_stops", price = "price_in_euros", providerLogo = "provider_logo"
    }

    var id: Int!
    var numberOfStops: Int!
    var arrivalTime: String!
    var departureTime: String!
    var price: NSDecimalNumber!
    var providerLogo: URL!

    required init?(map: Map) { }

    func mapping(map: Map) {
        id              <- map[Key.id]
        numberOfStops   <- map[Key.numberOfStops]
        arrivalTime     <- map[Key.arrivalTime]
        departureTime   <- map[Key.departureTime]
        price           <- (map[Key.price], NSDecimalNumberTransform())
        providerLogo    <- (map[Key.providerLogo], ProviderLogoTransfomer())
    }

}
