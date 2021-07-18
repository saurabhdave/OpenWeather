//
//  SettingsViewTimeViewModel.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/2021.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import UIKit

struct SettingsViewTimeViewModel {

    // MARK: - Properties

    let timeNotation: TimeNotation

    // MARK: -

    var text: String {
        switch timeNotation {
        case .twelveHour: return "12 Hour"
        case .twentyFourHour: return "24 Hour"
        }
    }

    var accessoryType: UITableViewCell.AccessoryType {
        if UserDefaults.timeNotation() == timeNotation {
            return .checkmark
        } else {
            return .none
        }
    }

}

extension SettingsViewTimeViewModel: SettingsRepresentable {

}
