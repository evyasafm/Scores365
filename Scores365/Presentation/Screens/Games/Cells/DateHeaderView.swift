//
//  DateHeaderView.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import SwiftUI
import UIKit

final class DateHeaderView: UITableViewHeaderFooterView, ConfigurableView {
    // MARK: - UI Components
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .gray
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initialization
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        dateLabel.text = nil
    }
    
    // MARK: - Internal Methods
    func configure(with viewModel: DateHeaderViewModel) {
        dateLabel.text = viewModel.dateText
    }
}

// MARK: - Private Methods
private extension DateHeaderView {
    func setupUI() {
        contentView.addSubview(dateLabel)
        NSLayoutConstraint.activate([
            dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
        contentView.backgroundColor = .systemGroupedBackground
    }
} 
