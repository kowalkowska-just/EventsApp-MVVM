//
//  CoreDataManager.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 24/12/2020.
//

import CoreData
import UIKit

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    lazy var persistentContainer: NSPersistentContainer = {
        let persistenContainer = NSPersistentContainer(name: "EventsApp")
        persistenContainer.loadPersistentStores { (_, error) in
            print("DEBUG: Failed loading persistent stores with error: \(String(describing: error?.localizedDescription))")
        }
        return persistenContainer
    }()
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func get<T: NSManagedObject>(_ id: NSManagedObjectID) -> T? {
        do {
            return try moc.existingObject(with: id) as! T
        } catch {
            print("DEBUG: Failed getting data with error: \(error)")
        }
        return nil
    }
    
    func getAll<T: NSManagedObject>() -> [T] {
        do {
            let fetchRequest = NSFetchRequest<T>(entityName: "\(T.self)")
            return try moc.fetch(fetchRequest)
        } catch {
            print("DEBUG: Failed fetching data with error: \(error.localizedDescription)")
            return []
        }
    }
    
    func save() {
        do {
            try moc.save()
        } catch {
            print("DEBUG: Failed saving data with error: \(error)")
        }
    }
}
