//
//  RootRouter.swift
//  WeatherApp
//
//  Created by Sai Kishore Swaminathan on 28/06/23.
//

import Foundation
import UIKit

public final class RootRouter {
    let viewController: UIViewController
    var cityListRouter: CityListRouter!

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    public func presentViewController(viewController: UIViewController) {
        //  Routers are responsible for presentation 
        self.viewController.navigationController?.pushViewController(viewController, animated: true)
    }

    public func popViewController() {
        self.viewController.navigationController?.popViewController(animated: true)
    }

    public func presentCityList() {
        // Routers create other routers
        self.cityListRouter = CityListRouter(rootRouter: self)
    }
}
