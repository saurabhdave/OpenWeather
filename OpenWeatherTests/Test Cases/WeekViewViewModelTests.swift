//
//  WeekViewViewModelTests.swift
//  OpenWeatherTests
//
//  Created by Saurabh Dave on 14/07/21.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import XCTest
@testable import OpenWeather

class WeekViewViewModelTests: XCTestCase {

    // MARK: - Properties

    var viewModel: WeekViewViewModel!

    // MARK: - Set Up & Tear Down

    override func setUp() {
        super.setUp()

        // Load Stub
        let data = loadStubFromBundle(withName: "openweather", extension: "json")
        let weatherData: WeatherData = try! JSONDecoder().decode(WeatherData.self, from: data)

        // Initialize View Model
        viewModel = WeekViewViewModel(weatherData: weatherData.daily)
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Tests for Number of Sections

    func testNumberOfSections() {
        XCTAssertEqual(viewModel.numberOfSections, 1)
    }

    // MARK: - Tests for Number of Days

    func testNumberOfDays() {
        XCTAssertEqual(viewModel.numberOfDays, 8)
    }

    // MARK: - Tests for View Model for Index

    func testViewModelForIndex() {
        let weatherDayViewViewModel = viewModel.viewModel(for: 5)

        XCTAssertEqual(weatherDayViewViewModel.day, "Monday")
        XCTAssertEqual(weatherDayViewViewModel.date, "July 19")
    }

}
