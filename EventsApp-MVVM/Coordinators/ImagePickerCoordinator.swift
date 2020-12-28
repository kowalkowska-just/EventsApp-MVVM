//
//  ImagePickerCoordinator.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 28/12/2020.
//

import UIKit

final class ImagePickerCoordinator: NSObject, Coordinator {
  
    //MARK: - Properties
    
    private(set) var childCoordinators: [Coordinator] = []
    private let navigationController: UINavigationController
    var parentCoordinator: AddEventCoordinator?
    
    //MARK: - Lifecycle
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //MARK: - Helper Functions
    
    func start() {
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        navigationController.present(imagePickerController, animated: true, completion: nil)
    }
}

//MARK: - UIPickerControllerDelegate and UINavigationControllerDelegate

extension ImagePickerCoordinator: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            parentCoordinator?.didFinishPicking(image)
        }
        parentCoordinator?.childDidFinish(self)
    }
}
