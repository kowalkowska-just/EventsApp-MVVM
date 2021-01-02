//
//  EventDetailViewModel.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 02/01/2021.
//

import CoreData
import UIKit

final class EventDetailViewModel {
    
    private let eventID: NSManagedObjectID
    private let coreDataManager: CoreDataManager
    private var event: Event?
    var onUpdate = {}
    
    var image: UIImage? {
        guard let imageData = event?.image else { return nil }
        return UIImage(data: imageData)
    }
    
    init(eventID: NSManagedObjectID, coreDataManger: CoreDataManager = .shared) {
        self.eventID = eventID
        self.coreDataManager = coreDataManger
    }
    
    func viewDidLoad() {
        event = coreDataManager.getEvent(eventID)
        onUpdate()
    }
}
