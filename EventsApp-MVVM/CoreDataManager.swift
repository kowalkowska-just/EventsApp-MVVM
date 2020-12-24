//
//  CoreDataManager.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 24/12/2020.
//

import CoreData
import UIKit

final class CoreDataManager {
    lazy var persistentContainer: NSPersistentContainer = {
        let persistenContainer = NSPersistentContainer(name: "EventsApp")
        persistenContainer.loadPersistentStores { (_, error) in
            print("DEBUG: Failed loading persistent stores with error: \(error?.localizedDescription)")
        }
        return persistenContainer
    }()
    
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }
    
    func saveEvent(name: String, date: Date, image: UIImage) {
        let event = Event(context: moc)
        event.setValue(name, forKey: "name")
        let imageData = image.jpegData(compressionQuality: 1)
        event.setValue(imageData, forKey: "image")
        event.setValue(date, forKey: "date")
        
        do {
            try moc.save()
        } catch {
            print("DEBUG: Failed saving data in Event with error: \(error.localizedDescription)")
        }
    }
    
    func fetchEvents() -> [Event] {
        do {
            let fetchRequest = NSFetchRequest<Event>(entityName: "Event")
            let events = try moc.fetch(fetchRequest)
            return events
        } catch {
            print("DEBUG: Failed fetching data in Event with error: \(error.localizedDescription)")
            return []
        }
    }
}
