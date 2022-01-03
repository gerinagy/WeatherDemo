//
//  InfoPlistParser.swift
//  WeatherDemo
//
//  Created by Gergo Nagy on 1/3/22.
//

import Foundation

struct InfoPlistParser {
    static func  getStringValue(forKey key: String) -> String {
        guard let value = Bundle.main.infoDictionary?[key] as? String else {
            fatalError("Could not find value for key \(key) in the Info.plist")
        }
        return value
    }
}
