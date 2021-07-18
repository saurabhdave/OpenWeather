//
//  SettingsRepresentable.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/2021.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import UIKit

protocol SettingsRepresentable {

    var text: String { get }
    var accessoryType: UITableViewCell.AccessoryType { get }

}
