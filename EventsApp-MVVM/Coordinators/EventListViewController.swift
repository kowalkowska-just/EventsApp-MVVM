//
//  EventListViewController.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 22/12/2020.
//

import UIKit
import CoreData

class EventListViewController: UIViewController {
    
    private let coreDoreManager = CoreDataManager()

    static func instantiate() -> EventListViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "EventListViewController") as! EventListViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        coreDoreManager.saveEvent(name: "New Year", date: Date(), image: #imageLiteral(resourceName: "new-year"))
        print("DEBUG: Events: \(coreDoreManager.fetchEvents())")
    }
    
    //MARK: - Helper Functions
    
    private func setupViews() {
        let plusImage = UIImage(systemName: "plus.circle.fill")
        let barButtonItem = UIBarButtonItem(image: plusImage, style: .plain, target: self, action: #selector(tappedRightBarButton))
        barButtonItem.tintColor = .primary
        navigationItem.rightBarButtonItem = barButtonItem
        navigationItem.title = "Events"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    //MARK: - Selectors
    
    @objc private func tappedRightBarButton() {
        print("DEBUG: Tapped right bar button.")
    }
}