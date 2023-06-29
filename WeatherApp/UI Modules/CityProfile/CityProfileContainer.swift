//
//  CityProfileContainer.swift
//  WeatherApp
//
//  Created by Sai Kishore Swaminathan on 28/06/23.
//

import Foundation

public final class CityProfileContainer {

    let viewController: CityProfileViewController
    let presenter: CityProfilePresenter

    public init(router: CityProfileRouter,
                for city: City) {
        self.viewController = CityProfileViewController()
        self.presenter = CityProfilePresenter(city: city)
        viewController.presenter = self.presenter
        self.presenter.router = router
    }
}
