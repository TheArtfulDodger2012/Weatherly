//
//  Location.swift
//  Weatherly
//
//  Created by Ron Lane on 4/16/24.
//

import Foundation

struct Location: Decodable {
    let name : String
    let lat  : Double
    let lon  : Double
}
