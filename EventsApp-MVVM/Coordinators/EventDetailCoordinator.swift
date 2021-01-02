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
    var parentCoordinator: EventListCoordinator?
    
    init(eventID: NSManagedObjectID, navigationController: UINavigationController) {
        self.eventID = eventID
        self.navigationController = navigationController
    }
    
    func start() {
        let detailViewController: EventDetailViewController = .instantiate()
        let eventDetailViewModel = EventDetailViewModel(eventID: eventID)
        eventDetailViewModel.coordinator = self
        detailViewController.viewModel = eventDetailViewModel
        navigationController.pushViewController(detailViewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
}
