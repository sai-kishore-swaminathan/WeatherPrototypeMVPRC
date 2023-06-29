//
//  CityService.swift
//  WeatherApp
//
//  Created by Sai Kishore Swaminathan on 29/06/23.
//

import Foundation

public struct City: Equatable {
    public let name: String
    public let temperataure: String
    public let humidity: String
}

public final class CityWeatherService {

    public static let shared = CityWeatherService()

    private init() {
        fetchIfNeeded()
    }

    private var cities: [City] = []

    public func getCities() -> [City] {
        fetchIfNeeded()
        return cities
    }

    public func deleteCity(city: City) {
        cities.removeAll(where: { $0.name == city.name} )
    }

    public func getCity(for index: Int) -> City {
        // Should handle error when index is greator than city count
        return cities[index]
    }


    // MARK: - Some Network / DB Operations
    private func fetchIfNeeded() {
        if cities.isEmpty {
            // Get from Network Service or from DB
            let chennai = City(name: "Chennai", temperataure: "30", humidity: "50")
            let banglore = City(name: "Banglore", temperataure: "30", humidity: "50")
            let mumbai = City(name: "Mumbai", temperataure: "30", humidity: "50")
            let delhi = City(name: "Delhi", temperataure: "30", humidity: "50")
            let kolkatta = City(name: "Kolkatta", temperataure: "30", humidity: "50")
            self.cities =  [chennai, banglore, mumbai, delhi, kolkatta]
        }
    }
}
