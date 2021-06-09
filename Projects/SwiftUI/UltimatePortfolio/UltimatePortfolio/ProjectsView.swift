//
//  ProjectView.swift
//  UltimatePortfolio
//
//  Created by Ramadugu, Akshith on 6/09/21.
//
// Purpose: Show Projects that are open or closed
import SwiftUI

struct ProjectsView: View {
    // Properties have to independent and they cannot use each other
    let showClosedProjects: Bool
    let projects: FetchRequest<Project>
    
    init(showClosedProjects: Bool) {
        self.showClosedProjects = showClosedProjects
        
        // 1. Tell Core Data what kind of entity we’re looking for.
        // 2. Tell Core Data how we want the resulting project information sorted.
        // 3. Tell Core Data how to filter the data if at all, using a predicate.
        projects = FetchRequest<Project>(entity: Project.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)
        ], predicate: NSPredicate(format: "closed = %d", showClosedProjects))
    }
    
    var body: some View {
        NavigationView {
            List {
                // Because we use the FetchRequest struct directly rather than as a property wrapper, we need to read its inner value using wrappedValue
                ForEach(projects.wrappedValue) { project in
                    Section(header: Text(project.title ?? "")) {
                        // Relationships in core data need to be type cast as an array
                        ForEach(project.items?.allObjects as? [Item] ?? []) { item in
                            Text(item.title ?? "")
                        }
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())
            .navigationTitle(showClosedProjects ? "Closed Projects" : "Open Projects")
        }
    }
}

struct ProjectView_Previews: PreviewProvider {
    static var dataController = DataController.preview
    
    static var previews: some View {
        ProjectsView(showClosedProjects: false)
            .environment(\.managedObjectContext, dataController.container.viewContext)
            .environmentObject(dataController)
    }
}
