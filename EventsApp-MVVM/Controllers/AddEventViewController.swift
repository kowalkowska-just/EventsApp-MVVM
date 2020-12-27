//
//  AddEventViewController.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 26/12/2020.
//

import UIKit

class AddEventViewController: UIViewController {

    var viewModel: AddEventViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }
    
    deinit {
        print("DEBUG: Deinit from add event view controller.")
    }
}
