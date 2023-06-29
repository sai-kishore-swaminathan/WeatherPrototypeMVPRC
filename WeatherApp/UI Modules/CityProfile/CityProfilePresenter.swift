//
//  CityProfilePresenter.swift
//  WeatherApp
//
//  Created by Sai Kishore Swaminathan on 29/06/23.
//

import Foundation

final class CityProfilePresenter {

    public var city: City

    public unowned var router: CityProfileRouter!

    init(city: City) {
        self.city = city
    }

    public func deleteCity()  {
        CityWeatherService.shared.deleteCity(city: city)
        router.popModule()
    }
}
