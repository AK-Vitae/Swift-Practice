//
//  UnitConverter.swift
//  UnitsConverter
//
//  Created by Akshith Ramadugu on 12/1/23.
//

import Foundation

protocol ConvertibleUnit: CaseIterable, Identifiable, CustomStringConvertible, Hashable {
    var displayName: String { get }
    static var allCasesArray: [Self] { get }
}

enum TemperatureType: ConvertibleUnit {
    case celsius, fahrenheit, kelvin
    
    var id: Self { self }
    
    var displayName: String {
        switch self {
        case .celsius:
            return "Celsius"
        case .fahrenheit:
            return "Fahrenheit"
        case .kelvin:
            return "Kelvin"
        }
    }
    
    var description: String {
        displayName
    }
    
    static var allCasesArray: [Self] {
        allCases
    }
}

enum TimeType: ConvertibleUnit {
    case seconds, minutes, hours
    
    var id: Self { self }
    
    var displayName: String {
        switch self {
        case .seconds:
            return "Seconds"
        case .minutes:
            return "Minutes"
        case .hours:
            return "Hours"
        }
    }
    
    var description: String {
        displayName
    }
    
    static var allCasesArray: [Self] {
        allCases
    }
}


struct UnitConverter {
    static func convertTemperature(value: Double, from initialType: TemperatureType, to targetType: TemperatureType) -> Double {
        var temperatureInCelsius = value
        
        // Convert initial temperature to Celsius
        switch initialType {
        case .fahrenheit:
            temperatureInCelsius = (value - 32) * 5 / 9
        case .kelvin:
            temperatureInCelsius = value - 273.15
        case .celsius:
            break
        }
        
        // Convert from Celsius to target temperature type
        switch targetType {
        case .fahrenheit:
            return (temperatureInCelsius * 9 / 5) + 32
        case .kelvin:
            return temperatureInCelsius + 273.15
        case .celsius:
            return temperatureInCelsius
        }
    }
    
    static func convertTime(value: Double, from initialType: TimeType, to targetType: TimeType) -> Double {
        let valueInSeconds: Double
        
        // Convert the initial value to seconds
        switch initialType {
        case .seconds:
            valueInSeconds = value
        case .minutes:
            valueInSeconds = value * 60
        case .hours:
            valueInSeconds = value * 3600
        }
        
        // Convert from seconds to the target time type
        switch targetType {
        case .seconds:
            return valueInSeconds
        case .minutes:
            return valueInSeconds / 60
        case .hours:
            return valueInSeconds / 3600
        }
    }
}
