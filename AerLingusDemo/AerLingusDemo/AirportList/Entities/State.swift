//
//  State.swift
//  AerLingusDemo
//
//  Created by mark.sharvin on 08/03/2019.
//  Copyright © 2019 Mark Sharvin. All rights reserved.
//

import Foundation

struct State: Decodable {
    var code : String?
    var name : String?
    
    private enum CodingKeys: String, CodingKey {
        case code
        case name = "meaning"
    }
}
