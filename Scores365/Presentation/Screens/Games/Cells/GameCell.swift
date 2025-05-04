//
//  GameCell.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import SwiftUI
import UIKit

final class GameCell: UITableViewCell, ConfigurableView {
    // MARK: - UI Components
    private let containerStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let team1Label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .left
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    private let scoreContainer: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 4
        return stack
    }()
    
    private let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .monospacedDigitSystemFont(ofSize: 17, weight: .medium)
        label.textAlignment = .center
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        return label
    }()
    
    private let minuteLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .center
        return label
    }()
    
    private let team2Label: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textAlignment = .right
        label.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        return label
    }()
    
    // MARK: - Initialization
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    override func prepareForReuse() {
        super.prepareForReuse()
        team1Label.text = nil
        team2Label.text = nil
        scoreLabel.text = nil
        minuteLabel.text = nil
    }
    
    // MARK: - Internal Methods
    func configure(with viewModel: GameCellViewModel) {
        team1Label.text = viewModel.team1Name
        team2Label.text = viewModel.team2Name
        scoreLabel.text = viewModel.scoreText
        minuteLabel.text = viewModel.minuteText
    }
}

// MARK: - Private Methods
private extension GameCell {
    func setupUI() {
        contentView.addSubview(containerStack)
        
        scoreContainer.addArrangedSubview(scoreLabel)
        scoreContainer.addArrangedSubview(minuteLabel)
        
        [team1Label, scoreContainer, team2Label].forEach { containerStack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            containerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            containerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            containerStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            containerStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            
            team1Label.widthAnchor.constraint(equalTo: team2Label.widthAnchor),
            scoreContainer.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        backgroundColor = .systemBackground
        selectionStyle = .none
        
        // Set default colors
        team1Label.textColor = .label
        team2Label.textColor = .label
        scoreLabel.textColor = .label
        minuteLabel.textColor = .secondaryLabel
    }
} 
