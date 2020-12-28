//
//  TitleSubtitleCell.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 27/12/2020.
//

import UIKit

final class TitleSubtitleCell: UITableViewCell {
    private let titleLabel = UILabel()
    private let subtitleTextFiled = UITextField()
    private let verticalStackView = UIStackView()
    private let padding: CGFloat = 15
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupView()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(with viewModel: TitleSubtitleCellViewModel) {
        titleLabel.text = viewModel.title
        subtitleTextFiled.text = viewModel.subtitle
        subtitleTextFiled.placeholder = viewModel.placeholder
    }
    
    private func setupView() {
        verticalStackView.axis = .vertical
        titleLabel.font = .systemFont(ofSize: 22, weight: .medium)
        subtitleTextFiled.font = .systemFont(ofSize: 20, weight: .medium)
        
        [verticalStackView, titleLabel, subtitleTextFiled].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupHierarchy() {
        contentView.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(titleLabel)
        verticalStackView.addArrangedSubview(subtitleTextFiled)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            verticalStackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: padding),
            verticalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding),
            verticalStackView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: padding)
        ])
    }
}
