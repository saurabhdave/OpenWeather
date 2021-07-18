//
//  Conversions.swift
//  OpenWeather
//
//  Created by Saurabh Dave on 14/07/21.
//  Copyright © 2021 Saurabh. All rights reserved.
//

import Foundation

extension Double {

    func toCelcius() -> Double {
        return ((self - 32.0) * (5/9))
    }

    func toKPH() -> Double {
        return (self * 1.609344)
    }

}
