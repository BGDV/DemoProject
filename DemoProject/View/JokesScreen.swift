//
//  JokesScreen.swift
//  DemoProject
//
//  Created by BGDV on 08.02.2025.
//

import SwiftUI


struct JokesScreen: View {
    @Environment(ViewModel.self) private var vm
    
    var body: some View {
        VStack {
            AsyncImage(url: vm.jokeItem?.iconUrl) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 100, height: 100)
            .padding()
            
            Text(vm.jokeItem?.value ?? "")
                .font(.title)
                .padding(16)
                .multilineTextAlignment(.center)
                .transition(.scale)
            
            Spacer()
            
            Button("Generate") {
                Task {
                    try? await vm.loadJoke()
                }
            }
            .buttonStyle(.borderedProminent)
            
        }
//        .animation(.bouncy, value: vm.jokeItem?.value)
        .task {
            do {
                try await vm.loadJoke()
            } catch {
                print(error)
            }
        }
    }
}
