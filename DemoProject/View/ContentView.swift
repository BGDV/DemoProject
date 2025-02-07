//
//  ContentView.swift
//  DemoProject
//
//  Created by BGDV on 27.01.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        NavigationSplitView {
            TabView {
                JokesScreen()
                    .tabItem {
                        Label("Joke", systemImage: "face.smiling")
                    }
                DateItemsScreen()
                    .tabItem {
                        Label("Date", systemImage: "calendar")
                    }
            }
        } detail: {
            Text("Select an item")
        }
    }
}

#Preview {
    let vm = ViewModel(httpManager: HTTPManager())
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
        .environment(vm)
}
