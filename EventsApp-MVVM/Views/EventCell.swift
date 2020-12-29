//
//  EventCell.swift
//  EventsApp-MVVM
//
//  Created by Justyna Kowalkowska on 29/12/2020.
//

import UIKit

final class EventCell: UITableViewCell {

    //MARK: - Properties
    private let yearLabel = UILabel()
    private let monthLabel = UILabel()
    private let weekLabel = UILabel()
    private let daysLabel = UILabel()
    private let dateLabel = UILabel()

    private let eventNameLabel = UILabel()
    private let backgroundImageView = UIImageView()

    private let verticalStackView = UIStackView()

    //MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helper Functions
    
    private func setupViews() {
        [yearLabel, monthLabel, weekLabel, daysLabel, dateLabel, eventNameLabel, backgroundImageView, verticalStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        [yearLabel, monthLabel, weekLabel, daysLabel, dateLabel].forEach {
            $0.font = .systemFont(ofSize: 22, weight: .medium)
            $0.textColor = .white
        }
        
        eventNameLabel.font = .systemFont(ofSize: 28, weight: .bold)
        eventNameLabel.textColor = .white
        
        verticalStackView.axis = .vertical
    }
    
    private func setupHierarchy() {
        contentView.addSubview(backgroundImageView)
        contentView.addSubview(verticalStackView)
        
        [yearLabel, monthLabel, weekLabel, daysLabel, dateLabel].forEach {
            verticalStackView.addArrangedSubview($0)
        }
        
    }
    
    private func setupLayout() {
        backgroundImageView.anchor(top: contentView.topAnchor,
                                   left: contentView.leftAnchor,
                                   bottom: contentView.bottomAnchor,
                                   right: contentView.rightAnchor)
        verticalStackView.anchor(top: contentView.topAnchor,
                                 bottom: contentView.bottomAnchor,
                                 right: contentView.rightAnchor,
                                 paddingTop: 15, paddingBottom: 15, paddingRight: 15)
        eventNameLabel.anchor(left: contentView.leftAnchor,
                              bottom: contentView.bottomAnchor,
                              paddingLeft: 15, paddingBottom: 15)
    }
    
    func update(with viewModel: EventCellViewModel) {
        yearLabel.text = viewModel.yearText
        monthLabel.text = viewModel.monthText
        weekLabel.text = viewModel.weekText
        daysLabel.text = viewModel.dayText
        dateLabel.text = viewModel.dateText
        eventNameLabel.text = viewModel.eventName
        backgroundImageView.image = viewModel.backgroundImage
    }
}
