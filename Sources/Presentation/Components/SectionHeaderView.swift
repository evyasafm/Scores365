import SwiftUI

public struct SectionHeaderView: View {
    let date: Date
    
    public init(date: Date) {
        self.date = date
    }
    
    public var body: some View {
        Text(date, style: .date)
            .font(.headline)
            .foregroundColor(.primary)
    }
} 