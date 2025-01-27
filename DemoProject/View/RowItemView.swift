//
//  RowItemView.swift
//  DemoProject
//
//  Created by BGDV on 27.01.2025.
//

import SwiftUI

struct RowItemView: View {
    let item: Item
    var backgroundColor: Color { getRandomColor() }
    var textColor: Color { getRandomColor() }
    
    var body: some View {
        HStack {
            Text("Item at \(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))")
                .font(.callout)
                .multilineTextAlignment(.leading)
                .padding(18)
                .foregroundStyle(textColor)
            
            Spacer()
        }
        .background {
            RoundedRectangle(cornerRadius: 12)
                .foregroundStyle(backgroundColor.gradient)
                .opacity(0.6)
        }
    }
}

#Preview {
    RowItemView(item: .default)
}

extension RowItemView {
    private func getRandomColor() -> Color {
        return .init(
            red: Double.random(in: 0...1000)/1000,
            green: Double.random(in: 0...1000)/1000,
            blue: Double.random(in: 0...1000)/1000
        )
    }
}
