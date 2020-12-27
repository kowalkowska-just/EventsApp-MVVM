//
//  AddEventViewModel.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 26/12/2020.
//

import UIKit

final class AddEventViewModel {
    
    enum Cell {
        case titleSubtitle(TitleSubtitleCellViewModel)
    }
    
    var coordinator: AddEventCoordinator?
    
    func viewDidDisappear() {
        coordinator?.didFinishAddEvent()
    }
    
    deinit {
        print("DEBUG: Deinit from add event view model")
    }
}
