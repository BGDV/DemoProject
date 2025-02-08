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
            
            Text(vm.jokeItem?.value ?? "")
                .font(.title)
                .padding(16)
                .multilineTextAlignment(.center)
                .transition(.scale)
            
            Spacer()
            
            Button {
                Task {
                    try? await vm.loadJoke()
                }
            } label: {
                Text("Generate")
                    .padding(.horizontal, 18)
            }
            .buttonStyle(.borderedProminent)
        }
        .task {
            do {
                try await vm.loadJoke()
            } catch {
                print(error)
            }
        }
    }
}
