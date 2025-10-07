//
//  ContentView.swift
//  Moonshot
//
//  Created by Veselin Nikolov on 6.10.25.
//

import SwiftUI

struct ContentView: View {
    @State private var store = MoonshotDataStore()

    @State private var showingGrid = true

    var body: some View {
        NavigationStack {
            VStack {
                Text("Moonshot")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)

                contentView()
            }
            .background(.darkBackground)
            .toolbar {
                Button {
                    withAnimation { showingGrid.toggle() }
                } label: {
                    Image(
                        systemName: showingGrid
                            ? "list.bullet" : "square.grid.2x2"
                    )

                }
            }
        }

    }

    @ViewBuilder
    private func contentView() -> some View {
        Group {
            if showingGrid {
                GridLayout(
                    missions: store.missions,
                    astronauts: store.astronauts
                )

            } else {
                ListLayout(
                    missions: store.missions,
                    astronauts: store.astronauts
                )

            }

        }
        .transition(.slide)
    }

}

#Preview {
    ContentView()
}
