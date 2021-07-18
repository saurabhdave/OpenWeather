//
//  WeatherDayViewViewModel.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/21.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import UIKit

struct WeatherDayViewViewModel {

    // MARK: - Properties

    let weatherDayData: Daily

    // MARK: -

    private let dayFormatter = DateFormatter()
    private let dateFormatter = DateFormatter()

    // MARK: - Public Interface

    var day: String {
        // Configure Date Formatter
        dayFormatter.dateFormat = "EEEE"

        let currentDate = Date(timeIntervalSince1970: Double(weatherDayData.dt))

        return dayFormatter.string(from: currentDate)
    }

    var date: String {
        // Configure Date Formatter
        dateFormatter.dateFormat = "MMMM d"
        let currentDate = Date(timeIntervalSince1970: Double(weatherDayData.dt))

        return dateFormatter.string(from: currentDate)
    }

    var temperature: String {
        let min = format(temperature: weatherDayData.temp.min)
        let max = format(temperature: weatherDayData.temp.max)

        return "\(min) - \(max)"
    }

    var windSpeed: String {
        let windSpeed = weatherDayData.wind_speed

        switch UserDefaults.unitsNotation() {
        case .imperial:
            return String(format: "%.f MPH", windSpeed)
        case .metric:
            return String(format: "%.f KPH", windSpeed.toKPH())
        }
    }

    var image: UIImage? {
        return UIImage.imageForIcon(withName: weatherDayData.weather[0].icon)
    }
    
    var imageURL : String {
        return "http://openweathermap.org/img/wn/\(weatherDayData.weather[0].icon)@2x.png"

    }

    // MARK: - Private Interface

    private func format(temperature: Double) -> String {
        switch UserDefaults.temperatureNotation() {
        case .fahrenheit:
            return String(format: "%.0f °F", temperature)
        case .celsius:
            return String(format: "%.0f °C", temperature.toCelcius())
        }
    }

}

extension WeatherDayViewViewModel: WeatherDayRepresentable {

}
