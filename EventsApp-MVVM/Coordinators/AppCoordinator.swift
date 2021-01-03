//
//  AppCoordinatr.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 22/12/2020.
//

import UIKit

protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get }
    func start()
    func childDidFinish(_ childCoordinator: Coordinator)
}

extension Coordinator {
    func childDidFinish(_ childCoordinator: Coordinator) {}
}

final class AppCoordinator: Coordinator {
    
    private(set) var childCoordinators: [Coordinator] = []
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    func start() {
        let navigationController = UINavigationController()
        
        let eventsListCoordinator = EventListCoordinator(navigationController: navigationController)
        
        childCoordinators.append(eventsListCoordinator)
        
        eventsListCoordinator.start()
                
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
