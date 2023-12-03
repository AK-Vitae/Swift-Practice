//
//  UnitPickerView.swift
//  UnitsConverter
//
//  Created by Akshith Ramadugu on 12/2/23.
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
