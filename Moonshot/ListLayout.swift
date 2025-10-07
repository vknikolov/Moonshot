//
//  ListView.swift
//  Moonshot
//
//  Created by Veselin Nikolov on 6.10.25.
//

import SwiftUI

struct ListLayout: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(missions) { mission in
                        NavigationLink {
                            MissionView(
                                mission: mission,
                                astronauts: astronauts
                            )
                        } label: {
                            HStack {
                                Image(mission.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 50, height: 50)
                                    .padding()
                                    .background(.white.opacity(0.4))
                                    .clipShape(.rect(cornerRadius: 10))

                                VStack(alignment: .leading) {
                                    Text(mission.displayName)
                                        .font(.headline)
                                        .foregroundStyle(.white)
                                    Text(mission.formattedlaunchDate)
                                        .font(.caption)
                                        .foregroundStyle(.gray)
                                }
                                .padding(.horizontal)
                                .frame(maxWidth: .infinity, alignment: .leading)

                                Image(systemName: "chevron.right")
                                    .font(.title2)
                                    .foregroundStyle(.white)
                                    .padding(.horizontal)
                            }
                            .background(Color.lightBackground)
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                            .buttonStyle(.plain)
                        }

                    }
                }
                .padding()
            }
            .background(Color.darkBackground)
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    return ListLayout(missions: missions, astronauts: astronauts)
}
