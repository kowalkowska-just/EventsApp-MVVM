//
//  EventListViewModel.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 26/12/2020.
//

import Foundation

final class EventListViewModel {
    
    let title = "Events"
    var coordinator: EventListCoordinator?
    
    func tappedAddEvent() {
        print("DEBUG: Tapped right bar button.")
        coordinator?.startAddEvent()
    }
}
