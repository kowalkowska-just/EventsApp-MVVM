//
//  EditEventCoordinator.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 03/01/2021.
//

import UIKit

protocol EventUpdatingCoordinator {
    func onUpdateEvent()
}

final class EditEventCoordinator: Coordinator {
    
    //MARK: - Properties
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    private let event: Event
    private var completion: (UIImage) -> Void = { _ in}
    
    var parentCoordinator: (EventUpdatingCoordinator & Coordinator)?
    
    //MARK: - Lifecycle
    
    init(event: Event, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.event = event
    }
    
    //MARK: - Helper Functions
    
    func start() {
        let editEventViewController: EditEventViewController = .instantiate()
        let editEventViewModel = EditEventViewModel(cellBuilder: EventsCellBuilder(), event: event)
        editEventViewModel.coordinator = self
        editEventViewController.viewModel = editEventViewModel
        navigationController.pushViewController(editEventViewController, animated: true)
    }
    
    func didFinish() {
        parentCoordinator?.childDidFinish(self)
    }
    
    func didFinishUpdateEvent() {
        parentCoordinator?.onUpdateEvent()
        navigationController.popViewController(animated: true)
    }
    
    func showImagePicker(completion: @escaping(UIImage) -> Void) {
        print("DEBUG: Show image picker.")
//        guard let modalNavigationController = modalNavigationController else { return }
        self.completion = completion
        let imagePickerCoordinator = ImagePickerCoordinator(navigationController: navigationController)
        imagePickerCoordinator.parentCoordinator = self
        imagePickerCoordinator.onFinishPicking = { image in
            completion(image)
            self.navigationController.dismiss(animated: true, completion: nil)
        }
        childCoordinators.append(imagePickerCoordinator)
        imagePickerCoordinator.start()
    }
    
    func childDidFinish(_ childCoordinator: Coordinator) {
        if let index = childCoordinators.firstIndex(where: { coordinator -> Bool in
            return childCoordinator === coordinator
        }) {
            childCoordinators.remove(at: index)
        }
    }
}
