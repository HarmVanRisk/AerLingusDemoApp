//
//  Country.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 08/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import Foundation

//JSON for some reason has a wrapper for the airports. Doesn't make sense at all. I'd remove it if I was making it
struct AirportWrapper: Decodable {
    let airport : Airport
}

struct Country: Decodable {
    var code : String
    var name : String
    var shortName : String?
    var region : String
    var airports : [AirportWrapper]
    var priorityAirports : [String]?
    
    private enum CodingKeys: String, CodingKey {
        case code
        case name = "meaning"
        case shortName
        case region
        case airports
        case priorityAirports
    }
}
