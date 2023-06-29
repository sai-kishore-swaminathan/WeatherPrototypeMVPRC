//
//  CityDetailRouter.swift
//  WeatherApp
//
//  Created by Sai Kishore Swaminathan on 28/06/23.
//

import Foundation
// Responsible for Creating Containers which create + holds other components like VC, presenters etc
// Router presents view Controllers from the containers

public final class CityProfileRouter {

    private unowned let rootRouter: RootRouter
    private var container: CityProfileContainer?

    public init(rootRouter: RootRouter,
                for city: City) {
        self.rootRouter = rootRouter
        createContainer(for: city)
    }

    private func createContainer(for city: City) {
        self.container = CityProfileContainer(router: self, for: city)
        rootRouter.presentViewController(viewController: container!.viewController)
    }

    public func popModule() {
        rootRouter.popViewController()
    }
}
