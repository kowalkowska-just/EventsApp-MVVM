//
//  EventsListCoordinator.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 22/12/2020.
//

import UIKit
import CoreData

final class EventListCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    var onSaveEvent = {}
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let eventListViewController: EventListViewController = .instantiate()
        let eventListViewModel = EventListViewModel()
        eventListViewModel.coordinator = self
        onSaveEvent = eventListViewModel.reload
        eventListViewController.viewModel = eventListViewModel
        navigationController.setViewControllers([eventListViewController], animated: false)
    }
    
    func startAddEvent() {
        let addEventCoordinator = AddEventCoordinator(navigationController: navigationController)
        addEventCoordinator.parentCoordinator = self
        childCoordinators.append(addEventCoordinator)
        addEventCoordinator.start()
    }
    
    func onSelect(_ id: NSManagedObjectID) {
        print("DEBUG: Trigger event detail coordinator with id: \(id)")
        let eventDetailCoordinator = EventDetailCoordinator(eventID: id, navigationController: navigationController)
        childCoordinators.append(eventDetailCoordinator)
        eventDetailCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
                
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
