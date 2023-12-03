//
//  TimeConversionView.swift
//  UnitsConverter
//
//  Created by Akshith Ramadugu on 12/2/23.
//

import SwiftUI

struct TimeConversionView: View {
    @StateObject private var viewModel = TimeViewModel()

    var body: some View {
        Section("Time Conversion") {
            TextField("Time Value", value: $viewModel.inputValue, format: .number)
                .keyboardType(.decimalPad)

            UnitPickerView(title: "Initial Time Type", selection: $viewModel.selectedInputUnit)
            UnitPickerView(title: "Converted Time Type", selection: $viewModel.selectedOutputUnit)

            Text("Converted Time: \(viewModel.outputFormatted)")
        }
    }
}
