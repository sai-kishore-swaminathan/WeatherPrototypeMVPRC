//
//  CityListRouter.swift
//  WeatherApp
//
//  Created by Sai Kishore Swaminathan on 28/06/23.
//

import Foundation

public final class CityListRouter {

    private unowned let rootRouter: RootRouter
    private var container: CityListContainer?
    private var cityProfileRouter: CityProfileRouter?

    init(rootRouter: RootRouter) {
        self.rootRouter = rootRouter
        createContainer()
    }

    public func createContainer() {
        self.container = CityListContainer(router: self)
        self.container?.viewController.navigationItem.hidesBackButton = true
        rootRouter.presentViewController(viewController: container!.viewController)
    }
    

    public func openCityDetailScreen(for city: City) {
        self.cityProfileRouter = CityProfileRouter(rootRouter: rootRouter, for: city)
    }
}
