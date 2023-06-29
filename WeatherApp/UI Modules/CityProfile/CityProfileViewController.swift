//
//  CityProfileViewController.swift
//  WeatherApp
//
//  Created by Alexios on 16/6/23.
//

import Foundation
import UIKit

final class CityProfileViewController: UIViewController {
    unowned var presenter: CityProfilePresenter!

    // MARK: - Properties
    private let cityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let temperatureLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let humidityLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let weatherInfoStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Delete", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - UIViewController functions
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        displayWeatherInfo()
        configureDeleteButton()
    }

    // MARK: - Private functions
    private func setupUI() {
        // Configure city label
        cityLabel.text = "City Name"
        view.backgroundColor = .white 

        // Add labels to the stack view
        weatherInfoStackView.addArrangedSubview(cityLabel)
        weatherInfoStackView.addArrangedSubview(temperatureLabel)
        weatherInfoStackView.addArrangedSubview(humidityLabel)

        // Add stack view and delete button to the view hierarchy
        view.addSubview(weatherInfoStackView)
        view.addSubview(deleteButton)

        // Define constraints
        NSLayoutConstraint.activate([
            weatherInfoStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            weatherInfoStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),

            deleteButton.topAnchor.constraint(equalTo: weatherInfoStackView.bottomAnchor, constant: 16),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func displayWeatherInfo() {
        // Fetch weather data for the selected city
        // Update the labels with the weather information
        let cityName = presenter.city.name
        let temperature = presenter.city.temperataure
        let humidity = presenter.city.humidity

        cityLabel.text = cityName
        temperatureLabel.text = temperature
        humidityLabel.text = humidity
    }

    private func configureDeleteButton() {
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }

    @objc private func deleteButtonTapped() {
        // Handle the delete action for the city
        // Perform necessary actions like confirming the deletion or updating data

        // Example: Show an alert for confirmation
        let alertController = UIAlertController(title: "Delete City", message: "Are you sure you want to delete this city?", preferredStyle: .alert)

        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { [weak self] (_) in
            self?.deleteCity()
        }

        alertController.addAction(cancelAction)
        alertController.addAction(deleteAction)

        present(alertController, animated: true, completion: nil)
    }

    private func deleteCity() {
        presenter.deleteCity()
        // Delete the city from data source or perform other required actions
        // Example: Navigate back to the city list screen or show a success message
    }
}
