//
//  DayViewViewModel.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/2021.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import UIKit

struct DayViewViewModel {

    // MARK: - Properties

    let weatherData: WeatherData

    // MARK: -

    private let dateFormatter = DateFormatter()
    private let timeFormatter = DateFormatter()

    // MARK: -

    var date: String {
        // Configure Date Formatter
        dateFormatter.dateFormat = "EEE, MMMM d"
        let currentDate = Date(timeIntervalSince1970: Double(weatherData.current.dt))
        
        return Calendar.autoupdatingCurrent.isDateInToday(currentDate) ? "Today" : dateFormatter.string(from: currentDate)
    }

    var time: String {
        // Configure Date Formatter
        timeFormatter.dateFormat = UserDefaults.timeNotation().timeFormat
        let currentDate = Date(timeIntervalSince1970: Double(weatherData.current.dt))
        return timeFormatter.string(from: currentDate)
    }

    var summary: String {
        return weatherData.current.weather[0].description
    }

    var temperature: String {
        let temperature = weatherData.current.temp

        switch UserDefaults.temperatureNotation() {
        case .fahrenheit:
            return String(format: "%.1f °F", temperature)
        case .celsius:
            return String(format: "%.1f °C", temperature.toCelcius())
        }
    }

    var windSpeed: String {
        let windSpeed = weatherData.current.wind_speed

        switch UserDefaults.unitsNotation() {
        case .imperial:
            return String(format: "%.f MPH", windSpeed)
        case .metric:
            return String(format: "%.f KPH", windSpeed.toKPH())
        }
    }

    var image: UIImage? {
        return UIImage.imageForIcon(withName: weatherData.current.weather[0].icon)
    }
    
    //http://openweathermap.org/img/wn/10d@2x.png
    var imageURL : String {
        return "http://openweathermap.org/img/wn/\(weatherData.current.weather[0].icon)@2x.png"

    }

}
