//
//  EventDetailViewController.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 02/01/2021.
//

import UIKit

final class EventDetailViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    var viewModel: EventDetailViewModel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdate = { [weak self] in
            self?.backgroundImageView.image = self?.viewModel.image
        }
        
        viewModel.viewDidLoad()
    }
}
