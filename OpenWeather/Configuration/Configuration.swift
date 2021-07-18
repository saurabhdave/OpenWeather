//
//  Configuration.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/21.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import Foundation

struct Defaults {

    static let Latitude: Double = 51.400592
    static let Longitude: Double = 4.760970

}

struct API {

    static let APIKey = "fae7190d7e6433ec3a45285ffcf55c86"
    static var BaseURL = URL(string:"http://api.openweathermap.org/data/2.5/onecall")!
    
    static var AuthenticatedBaseURL: URL {
        BaseURL.appendQueryItem(name: "appid", value: APIKey)
        return BaseURL
    }
    
}


