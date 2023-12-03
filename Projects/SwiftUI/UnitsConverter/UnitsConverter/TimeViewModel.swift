//
//  TimeViewModel.swift
//  UnitsConverter
//
//  Created by Akshith Ramadugu on 12/2/23.
//

import Foundation

class TimeViewModel: ObservableObject {
    @Published var inputValue: Double = 0 {
        didSet { convert() }
    }
    @Published var selectedInputUnit: TimeType = .minutes {
        didSet { convert() }
    }
    @Published var selectedOutputUnit: TimeType = .seconds {
        didSet { convert() }
    }
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
        outputValue = UnitConverter.convertTime(value: inputValue, from: selectedInputUnit, to: selectedOutputUnit)
    }
}

