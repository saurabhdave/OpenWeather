//
//  SettingsViewUnitsViewModel.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/2021.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import UIKit

struct SettingsViewUnitsViewModel {

    // MARK: - Properties

    let unitsNotation: UnitsNotation

    // MARK: - Public Interface

    var text: String {
        switch unitsNotation {
        case .imperial: return "Imperial"
        case .metric: return "Metric"
        }
    }

    var accessoryType: UITableViewCell.AccessoryType {
        if UserDefaults.unitsNotation() == unitsNotation {
            return .checkmark
        } else {
            return .none
        }
    }

}

extension SettingsViewUnitsViewModel: SettingsRepresentable {

}
