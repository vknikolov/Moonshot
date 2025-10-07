//
//  MissionView.swift
//  Moonshot
//
//  Created by Veselin Nikolov on 6.10.25.
//

import SwiftUI

struct MissionView: View {
    let mission: Mission
    let crew: [CrewMember]

    var body: some View {
        ScrollView {
            VStack {
                VStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame(.horizontal) { width, axis in
                            width * 0.6
                        }

                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(.lightBackground)
       
           

                VStack {
                    Text(mission.formattedlaunchDate)
                }
                .padding(.vertical)

                Divider()
                    .padding(.bottom)

                VStack(alignment: .leading) {
                    Text("Mission Heighlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)

                    Text(mission.description)

                }
                .padding(.horizontal)
                
                Divider()
                    .padding()

                VStack {
                    Text("Crew")
                        .font(.title.bold())
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)

       

                MissionCrew(crew: crew)

            }
            .foregroundStyle(.white)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }

    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission

        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing member: \(member.name)")
            }
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
