//
//  CityListContainer.swift
//  WeatherApp
//
//  Created by Sai Kishore Swaminathan on 28/06/23.
//

import Foundation

// Containers create and hold Strong reference to other components
// Router holds Strong reference to containers
// Containers hold unowned reference to Routers ( Since Containers wont live longer )

public final class CityListContainer {
    let viewController: CityListViewController
    let presenter: CityListPresenter

    init(router: CityListRouter) {
        self.viewController = CityListViewController()
        self.presenter = CityListPresenter()
        self.presenter.router = router
        viewController.presenter = self.presenter
    }
}
