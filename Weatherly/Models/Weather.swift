//
//  Weather.swift
//  Weatherly
//
//  Created by Ron Lane on 4/16/24.
//

import Foundation

struct WeatherResponse: Decodable {
    let main : Weather
}

struct Weather: Decodable {
    let temp : Double
}
