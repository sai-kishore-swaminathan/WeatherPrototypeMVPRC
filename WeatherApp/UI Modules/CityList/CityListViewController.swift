//
//  ViewController.swift
//  WeatherApp
//
//  Created by Alexios on 16/6/23.

/*

 City List Screen:
    Display a list of cities.
    Fetch city data from an API (simulated or real).
    Display basic information about each city, such as name and temperature.
    Allow the user to select a city from the list.

 City Profile Screen:
    Display detailed weather information for the selected city.
    Fetch weather data for the selected city from the same API or another API.
    Show relevant weather details, such as temperature, humidity, wind speed, etc.
    Provide a way to navigate back to the city list screen.

 */
//

import UIKit

final class CityListViewController: UIViewController,
                                    UICollectionViewDataSource,
                                    UICollectionViewDelegateFlowLayout {
    // MARK: - Properties
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    private var cityDataSource: [String] = ["City1", "City2", "City3"]

    // MARK: - UIViewController functions
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityDataSource.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .gray

        let cityLabel = UILabel(frame: cell.contentView.bounds)
        cityLabel.text = cityDataSource[indexPath.item]
        cityLabel.textAlignment = .center
        cityLabel.textColor = .white
        cell.contentView.addSubview(cityLabel)

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let _ = cityDataSource[indexPath.item]
        // Handle the selection, navigate to the City Profile screen, etc.
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat = 10
        let itemWidth = (collectionView.bounds.width - padding * 3) / 2
        return CGSize(width: itemWidth, height: 50)
    }

    // MARK: - Private functions
    private func setupUI() {
        // Configure collection view
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")

        // Add collection view to the view hierarchy
        view.addSubview(collectionView)

        // Define constraints
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
