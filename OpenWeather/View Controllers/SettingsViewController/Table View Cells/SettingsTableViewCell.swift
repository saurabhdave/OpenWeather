//
//  SettingsTableViewCell.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/21.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    // MARK: - Type Properties

    static let reuseIdentifier = "SettingsCell"

    // MARK: - Properties

    @IBOutlet var mainLabel: UILabel!

    // MARK: - Initialization

    override func awakeFromNib() {
        super.awakeFromNib()

        // Configure Cell
        selectionStyle = .none
    }

    // MARK: - Configuration

    func configure(withViewModel viewModel: SettingsRepresentable) {
        mainLabel.text = viewModel.text
        accessoryType = viewModel.accessoryType
    }

}
