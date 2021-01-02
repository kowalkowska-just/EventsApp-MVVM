//
//  EventDetailCoordinator.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 02/01/2021.
//

import CoreData
import UIKit

final class EventDetailCoordinator: Coordinator {
    
    let childCoordinators: [Coordinator] = []
    
    private let navigationController: UINavigationController
    private let eventID: NSManagedObjectID
    
    init(eventID: NSManagedObjectID, navigationController: UINavigationController) {
        self.eventID = eventID
        self.navigationController = navigationController
    }
    
    func start() {
        //create event detail view controller
        let detailViewController: EventDetailViewController = .instantiate()
        //event deatil view model
        detailViewController.viewModel = EventDetailViewModel(eventID: eventID)
        //push it onto navigation controller
        navigationController.pushViewController(detailViewController, animated: true)
    }
}
