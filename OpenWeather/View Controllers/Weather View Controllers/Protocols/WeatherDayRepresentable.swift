//
//  WeatherDayRepresentable.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/21.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import UIKit

protocol WeatherDayRepresentable {

    var day: String { get }
    var date: String { get }
    var image: UIImage? { get }
    var windSpeed: String { get }
    var temperature: String { get }
    var imageURL: String { get }

}
