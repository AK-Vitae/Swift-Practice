//
//  TemperatureConversionView.swift
//  UnitsConverter
//
//  Created by Akshith Ramadugu on 12/1/23.
//

import SwiftUI

struct TemperatureConversionView: View {
    @StateObject private var viewModel = TemperatureViewModel()

    var body: some View {
        Section("Temperature") {
            TextField("Temperature Value", value: $viewModel.inputValue, format: .number)
                .keyboardType(.decimalPad)

            UnitPickerView(title: "Initial Temperature Type", selection: $viewModel.selectedInputUnit)
            UnitPickerView(title: "Converted Temperature Type", selection: $viewModel.selectedOutputUnit)

            Text("Converted Temperature: \(viewModel.outputFormatted)")
        }
    }
}
