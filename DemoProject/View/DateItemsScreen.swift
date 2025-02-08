//
//  DateItemsScreen.swift
//  DemoProject
//
//  Created by BGDV on 08.02.2025.
//

import SwiftUI
import SwiftData

struct DateItemsScreen: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    var body: some View {
        VStack {
            HeaderForDataItems() {
                addItem()
            }
            
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text(item.timestamp, format: Date.FormatStyle(date: .numeric, time: .standard))
                    } label: {
                        RowItemView(item: item)
                    }
                }
                .onDelete(perform: deleteItems)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
        }
    }
    
    private func addItem() {
        let newItem = Item(timestamp: Date())
        withAnimation {
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        for index in offsets {
            withAnimation {
                modelContext.delete(items[index])
            }
        }
    }
}

