//
//  ContentView.swift
//  Moonshot
//
//  Created by Veselin Nikolov on 6.10.25.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

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
                GridLayout(missions: missions, astronauts: astronauts)
                    .transition(.slide)
            } else {
                ListLayout(missions: missions, astronauts: astronauts)
                    .transition(.slide)
            }
        }
    }

}

#Preview {
    ContentView()
}
