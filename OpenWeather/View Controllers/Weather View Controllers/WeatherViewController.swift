
//
//  WeatherViewController.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/21.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    // MARK: - Properties

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var weatherDataContainer: UIView!
    @IBOutlet var activityIndicatorView: UIActivityIndicatorView!
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    // MARK: - Public Interface

    func reloadData() {
        
    }

    // MARK: - View Methods

    private func setupView() {
        // Configure Message Label
        messageLabel.isHidden = true

        // Configure Weather Data Container
        weatherDataContainer.isHidden = true

        // Configure Activity Indicator View
        activityIndicatorView.startAnimating()
        activityIndicatorView.hidesWhenStopped = true
    }

    private func updateView() {

    }

    // MARK: - Helper Methods

    func imageForIcon(withName name: String) -> UIImage? {
        switch name {
        case "clear-day":
            return UIImage(named: "clear-day")
        case "clear-night":
            return UIImage(named: "clear-night")
        case "rain":
            return UIImage(named: "rain")
        case "snow":
            return UIImage(named: "snow")
        case "sleet":
            return UIImage(named: "sleet")
        case "wind", "OpenWeather", "partly-OpenWeather-day", "partly-OpenWeather-night":
            return UIImage(named: "OpenWeather")
        default:
            return UIImage(named: "clear-day")
        }
    }

}
