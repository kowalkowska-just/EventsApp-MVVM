//
//  AddEventViewController.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 26/12/2020.
//

import UIKit

class AddEventViewController: UIViewController {

    //MARK: - Properties
    
    var viewModel: AddEventViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationControllerView()
        setupTableView()
        
        viewModel.onUpdate = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.viewDidLoad()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        viewModel.viewDidDisappear()
    }

    //MARK: - Helper functions
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.register(TitleSubtitleCell.self, forCellReuseIdentifier: "TitleSubtitleCell")
        tableView.tableFooterView = UIView()
    }
    
    func setupNavigationControllerView() {
        navigationItem.title = viewModel.title
        navigationController?.navigationBar.prefersLargeTitles = true
    
        //to force large title
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.setContentOffset(.init(x: 0, y: -1), animated: false)
        
        //buttons in navigation controller
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedDone))
        navigationController?.navigationBar.tintColor = .black
    }
    
    //MARK: - Selectors
    
    @objc private func tappedDone() {
        viewModel.tappedDone()
    }
}

    //MARK: - UITableViewDataSource

extension AddEventViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = viewModel.cell(for: indexPath)
        
        switch cellViewModel {
        case .titleSubtitle(let titleSubtitleCellViewModel):
            let cell = tableView.dequeueReusableCell(withIdentifier: "TitleSubtitleCell", for: indexPath) as! TitleSubtitleCell
            cell.update(with: titleSubtitleCellViewModel)
            cell.subtitleTextFiled.delegate = self
            return cell
        case .titleImage:
            return UITableViewCell()
        }
    }
}

//MARK: - UITextFieldDelegate

extension AddEventViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let currentText = textField.text else { return false}
        let text = currentText + string
        
        let point = textField.convert(textField.bounds.origin, to: tableView)
        if let indexPath = tableView.indexPathForRow(at: point) {
            viewModel.updateCell(indexPath: indexPath, subtitle: text)
        }
        return true
    }
}

