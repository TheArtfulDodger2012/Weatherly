//
//  WeatherClient.swift
//  Weatherly
//
//  Created by Ron Lane on 4/16/24.
//

import Foundation

enum NetworkError: Error {
    case invalidResponse
}

struct WeatherClient {
    
    func fetchWeather(location: Location) async throws -> Weather {
        
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .weatherByLatLon(location.lat, location.lon)))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        let weatherResponse = try JSONDecoder().decode(WeatherResponse.self, from: data)
        
        return weatherResponse.main
    }
}
