//
//  SectionHeaderView.swift
//  Scores365
//
//  Created by Evyasaf Mordechai on 3/5/25.
//

import SwiftUI

struct SectionHeaderView: View {
    let date: Date

    var body: some View {
        Text(date, style: .date)
            .font(.title3.bold())
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
