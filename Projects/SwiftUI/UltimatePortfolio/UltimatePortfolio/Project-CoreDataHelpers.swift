//
//  Project-CoreDataHelpers.swift
//  UltimatePortfolio
//
//  Created by Ramadugu, Akshith on 6/10/21.
//

import Foundation

extension Project {
    var projectTitle: String {
        title ?? ""
    }
    
    var projectDetail: String {
        detail ?? ""
    }
    
    var projectColor: String {
        color ?? "Light Blue"
    }
    
    var projectItems: [Item] {
        // Relationships in core data need to be type cast as an array (Use in this helper class rather than in the UI)
        let itemsArray = items?.allObjects as? [Item] ?? []
        
        // Sort the array in a meaningful manner
        // 1. Put completed items at the end of the bottom of the list, because we care about them less.
        // 2. Put higher priority items before lower priority items.
        // 3. Otherwise sort using creation date.
        return itemsArray.sorted { first, second in
            if first.completed == false {
                if second.completed == true {
                    return true
                }
            } else if first.completed == true {
                if second.completed == false {
                    return false
                }
            }
            
            if first.priority > second.priority {
                return true
            } else if first.priority < second.priority {
                return false
            }
            
            return first.itemCreationDate < second.itemCreationDate
        }
    }
    
    // Calculate how much of a project is complete from range 0 to 1
    // 1. Typecast to get an array of items.
    // 2. If that’s empty, then return 0 because we don’t have a completion amount.
    // 3. Otherwise, create a second array by filtering the first for completed items.
    // 4. Finally, divide the count of completed items by the count of the original items.
    var completionAmount: Double {
        let originalItems = items?.allObjects as? [Item] ?? []
        guard originalItems.isEmpty == false else { return 0 }
        
        let completedItems = originalItems.filter(\.completed)
        return Double(completedItems.count) / Double(originalItems.count)
    }
    
    static var example: Project {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let project = Project(context: viewContext)
        project.title = "Example Project"
        project.detail = "This is an example project"
        project.closed = true
        project.creationDate = Date()
        
        return project
    }
    
}
