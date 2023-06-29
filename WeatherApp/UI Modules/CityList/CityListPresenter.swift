//
//  CityListPresenter.swift
//  WeatherApp
//
//  Created by Sai Kishore Swaminathan on 28/06/23.
//

import Foundation

public final class CityListPresenter {

    public unowned var router: CityListRouter!

    public func didChooseCity(city: City) {
        router.openCityDetailScreen(for: city)
    }

    public func getNumberOfCells() -> Int {
        return CityWeatherService.shared.getCities().count
    }

    public func getCity(index: Int) -> City {
        return CityWeatherService.shared.getCity(for: index)
    }
}
