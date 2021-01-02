//
//  EventDetailViewController.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 02/01/2021.
//

import UIKit

final class EventDetailViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet weak var timeRemainingStackView: TimeRemainingStackView! {
        didSet {
            timeRemainingStackView.setup()
        }
    }
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    var viewModel: EventDetailViewModel!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.onUpdate = { [weak self] in
            guard let self = self, let timeRemainingViewModel = self.viewModel.timeRemainingViewModel else { return }
            self.backgroundImageView.image = self.viewModel.image
            self.timeRemainingStackView.update(with: timeRemainingViewModel)
        }
        
        viewModel.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        viewModel.viewDidDisappear()
    }
}
