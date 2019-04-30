//
//  AllAirportDetails.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 08/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import Foundation

struct AllAirportDetails: Decodable {
    var businessFares: [String]?
    var warningMessage: [String]?
    var previousFlightSearchParameter: [String]?
    var countries: [Country]?
    
    private enum CodingKeys: String, CodingKey {
        case businessFares
        case warningMessage
        case previousFlightSearchParameter = "prevFlightSearchParam"
        case countries
    }
}
