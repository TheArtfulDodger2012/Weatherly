//
//  GeocodingClient.swift
//  Weatherly
//
//  Created by Ron Lane on 4/16/24.
//

import Foundation

struct GeocodingClient {
    
    enum NetworkError: Error {
        case invalidResponse
    }
    
    func coordinateByCity(_ city: String) async throws -> Location? {
        
        let (data, response) = try await URLSession.shared.data(from: APIEndpoint.endpointURL(for: .coordinatesByLocationName(city)))
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else { throw NetworkError.invalidResponse }
        
        let locations = try JSONDecoder().decode([Location].self, from: data)
        
        return locations.first
    }
}
