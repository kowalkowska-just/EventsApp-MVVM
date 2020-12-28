//
//  TitleSubtitleCell.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 27/12/2020.
//

import UIKit

final class TitleSubtitleCell: UITableViewCell {
    
    //MARK: - Properties
    
    private let titleLabel = UILabel()
    let subtitleTextFiled = UITextField()
    private let verticalStackView = UIStackView()
    private let padding: CGFloat = 15
    
    private let datePickerView = UIDatePicker()
    private let toolbar = UIToolbar(frame: .init(x: 0, y: 0, width: 100, height: 40))
    
    private var viewModel: TitleSubtitleCellViewModel?
    
    lazy var doneButton: UIBarButtonItem = { UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(toppedDone))
    }()
    
    private let photoImageView = UIImageView()
    
    //MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper Functions
    
    func update(with viewModel: TitleSubtitleCellViewModel) {
        self.viewModel = viewModel
        titleLabel.text = viewModel.title
        subtitleTextFiled.text = viewModel.subtitle
        subtitleTextFiled.placeholder = viewModel.placeholder

        subtitleTextFiled.inputView = viewModel.type == .text ? nil : datePickerView
        subtitleTextFiled.inputAccessoryView = viewModel.type == .text ? nil : toolbar
        
        photoImageView.isHidden = viewModel.type != .image
        subtitleTextFiled.isHidden = viewModel.type == .image
        
        photoImageView.image = viewModel.image
        
        verticalStackView.spacing = viewModel.type == .image ? padding : verticalStackView.spacing
    }
    
    private func setupView() {
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextFiled.font = .systemFont(ofSize: 20, weight: .medium)
        
        [verticalStackView, titleLabel, subtitleTextFiled].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        doneButton.tintColor = .black

        toolbar.setItems([doneButton], animated: false)
        
        datePickerView.datePickerMode = .date
        datePickerView.preferredDatePickerStyle = .wheels
        datePickerView.backgroundColor = .white
        
        photoImageView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
        photoImageView.layer.cornerRadius = 10
    }
    
    private func setupHierarchy() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextFiled)
        verticalStackView.addArrangedSubview(photoImageView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -padding)
        ])
        
        photoImageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
    //MARK: - Selectors
    
    @objc private func toppedDone() {
        print("DEBUG: Tapped done in data picker view...")
        
        viewModel?.update(datePickerView.date)
    }
}
