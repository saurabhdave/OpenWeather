//
//  WeatherDayViewViewModelTests.swift
//  OpenWeatherTests
//
//  Created by Saurabh Dave on 14/07/21.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import XCTest
@testable import OpenWeather

class WeatherDayViewViewModelTests: XCTestCase {

    // MARK: - Properties

    var viewModel: WeatherDayViewViewModel!

    // MARK: - Set Up & Tear Down

    override func setUp() {
        super.setUp()

        // Load Stub
        let data = loadStubFromBundle(withName: "openweather", extension: "json")
        let weatherData: WeatherData = try! JSONDecoder().decode(WeatherData.self, from: data)

        // Initialize View Model
        viewModel = WeatherDayViewViewModel(weatherDayData: weatherData.daily[5])
    }

    override func tearDown() {
        super.tearDown()

        // Reset User Defaults
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    }

    // MARK: - Tests for Day

    func testDay() {
        XCTAssertEqual(viewModel.day, "Monday")
    }

    // MARK: - Tests for Date

    func testDate() {
        XCTAssertEqual(viewModel.date, "July 19")
    }

    // MARK: - Tests for Temperature

    func testTemperature_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        XCTAssertEqual(viewModel.temperature, "79 °F - 81 °F")
    }

    func testTemperature_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        XCTAssertEqual(viewModel.temperature, "26 °C - 27 °C")
    }

    // MARK: - Tests for Wind Speed

    func testWindSpeed_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        XCTAssertEqual(viewModel.windSpeed, "20 MPH")
    }

    func testWindSpeed_Metric() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        XCTAssertEqual(viewModel.windSpeed, "32 KPH")
    }

    func testImageURL () {
        XCTAssertEqual(viewModel.imageURL, "http://openweathermap.org/img/wn/10d@2x.png")

    }

}
