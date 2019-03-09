//
//  Airport.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 08/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import Foundation

struct StateWrapper: Decodable {
    let state: State
}

struct Destination: Decodable {
    let country: Country
}

struct Airport: Decodable {
    var code: String
    var name: String
    var stateWrapper: StateWrapper
    var destinations : [Destination]?
    
    private enum CodingKeys: String, CodingKey {
        case code
        case name = "meaning"
        case stateWrapper = "state"
        case destinations
    }
}
