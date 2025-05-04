//
//  DateHeaderViewModel.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import Foundation

protocol DateHeaderViewModel {
    var dateText: String { get }
}

struct GameDateHeaderViewModel: DateHeaderViewModel {
    let date: Date
    
    var dateText: String {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let inputDate = calendar.startOfDay(for: date)
        
        let components = calendar.dateComponents([.day], from: today, to: inputDate)
        
        if let days = components.day {
            switch days {
            case 0: return "Today"
            case 1: return "Tomorrow"
            case -1: return "Yesterday"
            default:
                let formatter = DateFormatter()
                formatter.dateFormat = "EEEE, d MMMM"
                return formatter.string(from: date)
            }
        }
        
        return ""
    }
} 
