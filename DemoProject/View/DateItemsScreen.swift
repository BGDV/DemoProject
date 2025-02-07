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
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
            ToolbarItem {
                Button(action: addItem) {
                    Label("Add Item", systemImage: "plus")
                }
            }
        }
    }
    
    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

