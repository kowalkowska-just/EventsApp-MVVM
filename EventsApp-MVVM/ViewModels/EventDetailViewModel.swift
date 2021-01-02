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
    private let date = Date()
    var coordinator: EventDetailCoordinator?
    var onUpdate = {}
    
    var image: UIImage? {
        guard let imageData = event?.image else { return nil }
        return UIImage(data: imageData)
    }
    
    var timeRemainingViewModel: TimeRemainingViewModel? {
        guard let eventDate = event?.date, let timeRemainingParts = date.timeRemaining(until: eventDate)?.components(separatedBy: ",") else { return nil }
        return TimeRemainingViewModel(timeRemainingParts: timeRemainingParts, mode: .detail)
    }
    
    init(eventID: NSManagedObjectID, coreDataManger: CoreDataManager = .shared) {
        self.eventID = eventID
        self.coreDataManager = coreDataManger
    }
    
    func viewDidLoad() {
        event = coreDataManager.getEvent(eventID)
        onUpdate()
    }
    
    func viewDidDisappear() {
        coordinator?.didFinish()
    }
}
