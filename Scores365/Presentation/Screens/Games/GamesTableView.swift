//
//  GamesTableView.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import SwiftUI
import UIKit

struct UITableViewWrapper: UIViewRepresentable {
    var sections: [DateSection]
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = context.coordinator
        tableView.dataSource = context.coordinator
        
        // Register cells and header views
        tableView.register(CompetitionCell.self, forCellReuseIdentifier: CompetitionCell.identifier)
        tableView.register(GameCell.self, forCellReuseIdentifier: GameCell.identifier)
        tableView.register(DateHeaderView.self, forHeaderFooterViewReuseIdentifier: DateHeaderView.identifier)
        
        // Modern iOS styling
        tableView.separatorStyle = .none
        tableView.backgroundColor = .systemGroupedBackground
        
        // Remove top content inset
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.contentInset = .zero
        tableView.sectionHeaderTopPadding = 0
        
        return tableView
    }
    
    func updateUIView(_ uiView: UITableView, context: Context) {
        uiView.reloadData()
    }
    
    // Coordinator to handle UITableView delegate and datasource
    class Coordinator: NSObject, UITableViewDelegate, UITableViewDataSource {
        var parent: UITableViewWrapper
        
        init(_ parent: UITableViewWrapper) {
            self.parent = parent
        }
        
        // Number of sections (days)
        func numberOfSections(in tableView: UITableView) -> Int {
            return parent.sections.count
        }
        
        // Number of rows in each section
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return parent.sections[section].rows.count
        }
        
        // Configure cells
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let row = parent.sections[indexPath.section].rows[indexPath.row]
            
            switch row {
            case .competition(let name):
                let cell = tableView.dequeueReusableCell(withIdentifier: CompetitionCell.identifier) as! CompetitionCell
                cell.configure(with: name)
                return cell
                
            case .game(let viewModel):
                let cell = tableView.dequeueReusableCell(withIdentifier: GameCell.identifier) as! GameCell
                cell.configure(with: viewModel)
                return cell
            }
        }
        
        // Configure section header
        func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: DateHeaderView.identifier) as! DateHeaderView
            let date = parent.sections[section].date
            let viewModel = GameDateHeaderViewModel(date: date)
            headerView.configure(with: viewModel)
            return headerView
        }
        
        // Header height
        func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 50
        }
        
        // Row height
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return UITableView.automaticDimension
        }
        
        // Estimated row height
        func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            return 44
        }
    }
} 
