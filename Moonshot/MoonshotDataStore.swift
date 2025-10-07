//
//  MoonshotDataStore.swift
//  Moonshot
//
//  Created by Veselin Nikolov on 7.10.25.
//

import SwiftUI

@Observable
final class MoonshotDataStore {
    let astronauts: [String: Astronaut]
    let missions: [Mission]

    init() {
        self.astronauts = Bundle.main.decode("astronauts.json")
        self.missions = Bundle.main.decode("missions.json")
    }

    func astronaut(with id: String) -> Astronaut? {
        astronauts[id]
    }

    func mission(with id: Int) -> Mission? {
        missions.first { $0.id == id }
    }
}
