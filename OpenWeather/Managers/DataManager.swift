//
//  DataManager.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/21.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import Foundation
import UIKit

enum DataManagerError: Error {

    case unknown
    case failedRequest
    case invalidResponse

}

final class DataManager {

    typealias WeatherDataCompletion = (WeatherData?, DataManagerError?) -> ()

    // MARK: - Properties

    private var baseURL: URL

    // MARK: - Initialization

    init(baseURL: URL) {
        self.baseURL = baseURL
    }

    // MARK: - Requesting Data

    func weatherDataForLocation(latitude: Double, longitude: Double, completion: @escaping WeatherDataCompletion) {
        
        var weatherURL = baseURL;
        //lat=0&amp;lon=0&amp
        weatherURL.appendQueryItem(parameters: [
            "lat": latitude,
            "lon": longitude
        ])
        
        weatherURL.appendQueryItem(name: "exclude", value: "minutely,alerts,hourly")
        weatherURL.appendQueryItem(name: "units", value: "imperial")
        
        // Create URL
        print(weatherURL)
        // Create Data Task
        URLSession.shared.dataTask(with: weatherURL) { (data, response, error) in
            DispatchQueue.main.async {
                self.didFetchWeatherData(data: data, response: response, error: error, completion: completion)
            }
        }.resume()
    }

    // MARK: - Helper Methods

    private func didFetchWeatherData(data: Data?, response: URLResponse?, error: Error?, completion: WeatherDataCompletion) {
        if let _ = error {
            completion(nil, .failedRequest)

        } else if let data = data, let response = response as? HTTPURLResponse {
            if response.statusCode == 200 {
                do {
                    
                    // Decode JSON
                    let weatherData: WeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
                    // Invoke Completion Handler
                    completion(weatherData, nil)

                } catch {
                    // Invoke Completion Handler
                    completion(nil, .invalidResponse)
                }

            } else {
                completion(nil, .failedRequest)
            }

        } else {
            completion(nil, .unknown)
        }
    }

}
