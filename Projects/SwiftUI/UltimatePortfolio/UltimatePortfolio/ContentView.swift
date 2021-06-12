//
//  ContentView.swift
//  UltimatePortfolio
//
//  Created by Ramadugu, Akshith on 6/07/21.
//

import SwiftUI

struct ContentView: View {
    // SceneStorage vs AppStorage
    // 1. Values you save are attached to the current instance of your app rather than your whole app, which means if you have two instances of an app like on iPad each will have their own scene storage.
    // 2. If the user actively terminates your app, the data gets deleted.
    // 3. It uses SwiftUI’s state restoration system rather than UserDefaults, so it won’t clash with any other data you’re writing into UserDefaults
    @SceneStorage("selectedView") var selectedView: String?
    
    var body: some View {
        TabView(selection: $selectedView) {
            HomeView()
                .tag(HomeView.tag)
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }

            ProjectsView(showClosedProjects: false)
                .tag(ProjectsView.openTag)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Open")
                }

            ProjectsView(showClosedProjects: true)
                .tag(ProjectsView.closedTag)
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("Closed")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
