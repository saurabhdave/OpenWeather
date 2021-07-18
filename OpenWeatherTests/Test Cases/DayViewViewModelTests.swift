//
//  DayViewViewModelTests.swift
//  OpenWeatherTests
//
//  Created by Saurabh Dave on 14/07/21.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import XCTest
@testable import OpenWeather

class DayViewViewModelTests: XCTestCase {

    // MARK: - Properties

    var viewModel: DayViewViewModel!

    // MARK: - Set Up & Tear Down

    override func setUp() {
        super.setUp()

        // Load Stub
        let data = loadStubFromBundle(withName: "openweather", extension: "json")
        let weatherData: WeatherData = try! JSONDecoder().decode(WeatherData.self, from: data)

        // Initialize View Model
        viewModel = DayViewViewModel(weatherData: weatherData)
    }

    override func tearDown() {
        super.tearDown()

        // Reset User Defaults
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
    }

    // MARK: - Tests for Date

    func testDate() {
        XCTAssertEqual(viewModel.date, "Today")
    }

    // MARK: - Tests for Time

    func testTime_TwelveHour() {
        let timeNotation: TimeNotation = .twelveHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)

        XCTAssertEqual(viewModel.time, "03:39 PM")
    }

    func testTime_TwentyFourHour() {
        let timeNotation: TimeNotation = .twentyFourHour
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)

        XCTAssertEqual(viewModel.time, "15:39")
    }

    // MARK: - Tests for Summary

    func testSummary() {
        XCTAssertEqual(viewModel.summary, "moderate rain")
    }

    // MARK: - Tests for Temperature

    func testTemperature_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        XCTAssertEqual(viewModel.temperature, "80.6 °F")
    }

    func testTemperature_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)

        XCTAssertEqual(viewModel.temperature, "27.0 °C")
    }

    // MARK: - Tests for Wind Speed

    func testWindSpeed_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        XCTAssertEqual(viewModel.windSpeed, "9 MPH")
    }

    func testWindSpeed_Metric() {
        let unitsNotation: UnitsNotation = .metric
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)

        print(viewModel.windSpeed)

        XCTAssertEqual(viewModel.windSpeed, "15 KPH")
    }

    // MARK: - Tests for Image

    func testImage() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = viewModelImage!.pngData()!
        let imageDataReference = UIImage(named: "clear-day")!.pngData()!

        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 236.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }
    
    func testImageURL () {
        XCTAssertEqual(viewModel.imageURL, "http://openweathermap.org/img/wn/10d@2x.png")

    }

}
