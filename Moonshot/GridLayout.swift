//
//  GridView.swift
//  Moonshot
//
//  Created by Veselin Nikolov on 6.10.25.
//

import SwiftUI

struct GridLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    private let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(missions) { mission in
                    NavigationLink {
                        MissionView(
                            mission: mission,
                            astronauts: astronauts
                        )
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()

                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)

                                Text(mission.formattedlaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color.lightBackground)
                        }
                        .background(.white.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.lightBackground)
                        )
                    }
                }
            
            }
            .padding()
        }
        .background(.darkBackground)

    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    return GridLayout(missions: missions, astronauts: astronauts)
}
