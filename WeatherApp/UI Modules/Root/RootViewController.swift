//
//  RootViewController.swift
//  WeatherApp
//
//  Created by Sai Kishore Swaminathan on 28/06/23.
//

import Foundation
import UIKit

public final class RootViewController: UIViewController, UINavigationBarDelegate {

    private var router: RootRouter? = nil

    public override func viewDidLoad() {
        self.router = RootRouter(viewController: self)
    }

    public override func viewDidAppear(_ animated: Bool) {
        guard let router = router else {
            // nonFatal
            return
        }
        router.presentCityList()
    }
}
