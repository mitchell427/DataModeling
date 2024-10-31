//
//  Player.swift
//  DataModeling
//
//  Created by Lucid AppleDev1 on 10/30/24.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    
    var name: String
    var score: Int
    
}

//When you declare that a type conforms to Equatable, Swift automatically provides an implementation that compares all
//properties of the type and returns true if they’re equal.
extension Player: Equatable {
    static func == (lhs: Player, rhs: Player) -> Bool {
        lhs.name == rhs.name && lhs.score == rhs.score
    }
}
