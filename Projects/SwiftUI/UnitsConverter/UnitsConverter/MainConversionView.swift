//
//  MainConversionView.swift
//  UnitsConverter
//
//  Created by Akshith Ramadugu on 12/2/23.
//

import SwiftUI

struct MainConversionView: View {
    var body: some View {
        NavigationStack {
            Form {
                TemperatureConversionView()
                TimeConversionView()
            }
            .navigationTitle("Units Converter")
            .onTapGesture {
                 dismissKeyboard()
             }
        }
    }
    
    private func dismissKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
