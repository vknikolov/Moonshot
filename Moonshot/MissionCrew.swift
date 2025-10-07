//
//  MissionCrew.swift
//  Moonshot
//
//  Created by Veselin Nikolov on 6.10.25.
//

import SwiftUI

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}

struct MissionCrew: View {
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMemebr in
                    NavigationLink {
                        AstronautView(astronaut: crewMemebr.astronaut)
                    } label: {
                        HStack {
                            Image(crewMemebr.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule().stroke(
                                        .white,
                                        lineWidth: 2
                                    )
                                )

                            VStack(alignment: .leading) {
                                Text(crewMemebr.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline.bold())

                                Text(crewMemebr.role)
                                    .foregroundStyle(.secondary)
                            }

                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    let mission = missions[0]
    
    let crewMembers: [CrewMember] = mission.crew.compactMap { member in
        guard let astronaut = astronauts[member.name] else { return nil }
        return CrewMember(role: member.role, astronaut: astronaut)
    }

    return MissionCrew(crew: crewMembers)
        .preferredColorScheme(.dark)
}
