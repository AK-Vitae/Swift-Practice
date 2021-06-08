//
//  UltimatePortfolioApp.swift
//  UltimatePortfolio
//
//  Created by Ramadugu, Akshith on 6/07/21.
//

import SwiftUI

@main
struct UltimatePortfolioApp: App {
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController) // underscore refers to StateObject that wraps around data controller
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext) // Used for SwiftUI to read core data values
                .environmentObject(dataController) // Lets code read core data values (allows usage of custom methods)
        }
    }
}
