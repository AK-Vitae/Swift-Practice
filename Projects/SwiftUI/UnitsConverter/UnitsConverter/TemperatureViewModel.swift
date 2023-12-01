//
//  TemperatureViewModel.swift
//  UnitsConverter
//
//  Created by Akshith Ramadugu on 12/1/23.
//

import Foundation

class TemperatureViewModel: ObservableObject {
    @Published var inputValue: Double = 0
    @Published var selectedInputUnit: TemperatureType = .celsius
    @Published var selectedOutputUnit: TemperatureType = .fahrenheit
    @Published var outputValue: Double = 0
    
    init() {
        convert()
    }

    var inputFormatted: String {
        String(format: "%.2f", inputValue)
    }

    var outputFormatted: String {
        String(format: "%.2f", outputValue)
    }

    func convert() {
        outputValue = UnitConverter.convertTemperature(value: inputValue, from: selectedInputUnit, to: selectedOutputUnit)
    }
}
