//
//  WeekViewViewModel.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/2021.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import UIKit

struct WeekViewViewModel {

    // MARK: - Properties

    let weatherData: [Daily]

    // MARK: -

    var numberOfSections: Int {
        return 1
    }

    var numberOfDays: Int {
        return weatherData.count
    }

    // MARK: - Methods

    func viewModel(for index: Int) -> WeatherDayViewViewModel {
        return WeatherDayViewViewModel(weatherDayData: weatherData[index])
    }

}
