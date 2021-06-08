//
//  DataController.swift
//  UltimatePortfolio
//
//  Created by Ramadugu, Akshith on 6/08/21.
//

import CoreData
import SwiftUI

class DataController: ObservableObject {
    let container: NSPersistentCloudKitContainer // Loads local core data instances as well as synchronizing with cloud services
    
    init(inMemory: Bool = false) { // Sometimes create data storage to RAM instead of memory: Helpful for testing as RAM is volatile
        container = NSPersistentCloudKitContainer(name: "Main")
        
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null") // Data will be goen as soon as app stops running
        }
        
        container.loadPersistentStores { storeDescription, error in // Load data model on disk
            if let error = error {
                fatalError("Fatal error loading store: \(error.localizedDescription)")
            }
        }
    }
    
    static var preview: DataController = {
        let dataController = DataController(inMemory: true)
        
        do {
            try dataController.createSampleData()
        } catch {
            fatalError("Fatal error creating preview: \(error.localizedDescription)")
        }
        
        return dataController
    }()
    
    func createSampleData() throws {
        let viewContext = container.viewContext // viewContext = pool of data loaded on disk
        
        for i in 1...5 {
            let project = Project(context: viewContext) // context: lets core data know where to save
            project.title = "Project \(i)"
            project.items = []
            project.creationDate = Date()
            project.closed = Bool.random()
            
            for j in 1...10 {
                let item = Item(context: viewContext)
                item.title = "Item \(j)"
                item.creationDate = Date()
                item.completed = Bool.random()
                item.project = project
                item.priority = Int16.random(in: 1...3)
            }
        }
        
        try viewContext.save() // save(): lets Core data know to write all our data in viewContext to permanent storage or in memory
    }
    
    func save() {
        if container.viewContext.hasChanges { // Save viewContext if has any changes
            try? container.viewContext.save()
        }
    }
    
    func delete(_ object: NSManagedObject) { // Delete a specific item in the viewContext
        container.viewContext.delete(object)
    }
    
    // Fetch Request
    // Batch Delete Request
    func deleteAll() {
        let fetchRequest1: NSFetchRequest<NSFetchRequestResult> = Item.fetchRequest() // Find all items in data
        let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchRequest1) // Delete all items in data
        _ = try? container.viewContext.execute(batchDeleteRequest1)
        
        let fetchRequest2: NSFetchRequest<NSFetchRequestResult> = Project.fetchRequest() // Find all projects in data
        let batchDeleteRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest2) // Delete all projects in data
        _ = try? container.viewContext.execute(batchDeleteRequest2)
    }
}
