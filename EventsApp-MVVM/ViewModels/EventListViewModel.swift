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
    var onUpdate = {}
    
    enum Cell {
        case event(EventCellViewModel)
    }
    
    private(set) var cells: [Cell] = []
//    private let coreDataManager: CoreDataManager

//    init(coreDataManager: CoreDataManager) {
//        self.coreDataManager = coreDataManager
//    }
    
    func viewDidLoad() {
        cells = [.event(EventCellViewModel()), .event(EventCellViewModel())]
        onUpdate()
    }
    
    func tappedAddEvent() {
        print("DEBUG: Tapped add event bar button.")
        coordinator?.startAddEvent()
    }
    
    func numberOfRows() -> Int {
        return cells.count
    }
    
    func cell(at indexPath: IndexPath) -> Cell {
        return cells[indexPath.row]
    }
}
