//
//  SettingsViewTemperatureViewModel.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/2021.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import UIKit

struct SettingsViewTemperatureViewModel {

    // MARK: - Properties

    let temperatureNotation: TemperatureNotation

    // MARK: - Public Interface

    var text: String {
        switch temperatureNotation {
        case .fahrenheit: return "Fahrenheit"
        case .celsius: return "Celsius"
        }
    }

    var accessoryType: UITableViewCell.AccessoryType {
        if UserDefaults.temperatureNotation() == temperatureNotation {
            return .checkmark
        } else {
            return .none
        }
    }

}

extension SettingsViewTemperatureViewModel: SettingsRepresentable {

}
