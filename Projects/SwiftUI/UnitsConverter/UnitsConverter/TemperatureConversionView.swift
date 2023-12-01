//
//  TemperatureConversionView.swift
//  UnitsConverter
//
//  Created by Akshith Ramadugu on 12/1/23.
//

import SwiftUI

struct UnitPickerView<UnitType>: View where UnitType: ConvertibleUnit {
    let title: String
    @Binding var selection: UnitType

    var body: some View {
        Picker(title, selection: $selection) {
            ForEach(UnitType.allCasesArray, id: \.id) { unit in
                Text(unit.displayName).tag(unit)
            }
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}

struct TemperatureConversionView: View {
    @StateObject private var viewModel = TemperatureViewModel()

    var body: some View {
        NavigationStack {
            Form {
                Section("Temperature") {
                    TextField("Temperature Value", value: $viewModel.inputValue, format: .number)
                        .keyboardType(.decimalPad)

                    UnitPickerView(title: "Initial Temperature Type", selection: $viewModel.selectedInputUnit)

                    UnitPickerView(title: "Converted Temperature Type", selection: $viewModel.selectedOutputUnit)

                    Text("Converted Temperature: \(viewModel.outputFormatted)")
                }
            }
            .navigationTitle("Units Converter")
            .onChange(of: viewModel.inputValue) { viewModel.convert() }
            .onChange(of: viewModel.selectedInputUnit) { viewModel.convert() }
            .onChange(of: viewModel.selectedOutputUnit) { viewModel.convert() }
        }
    }
}

#Preview {
    TemperatureConversionView()
}
