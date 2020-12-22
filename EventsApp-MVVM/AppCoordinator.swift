//
//  AppCoordinatr.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 22/12/2020.
//

import UIKit


protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start()
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
