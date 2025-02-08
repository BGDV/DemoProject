//
//  HeaderForDataItems.swift
//  DemoProject
//
//  Created by BGDV on 08.02.2025.
//

import SwiftUI

struct HeaderForDataItems: View {
    let action: () -> ()
    
    var body: some View {
        HStack(spacing: 18) {
            Spacer()
            EditButton()
            Button(action: action) {
                Image(systemName: "plus")
                    .font(.system(size: 18))
            }
        }
        .padding(.horizontal)
    }
}
