//
//  Scoreboard.swift
//  DataModeling
//
//  Created by Lucid AppleDev1 on 10/30/24.
//

import Foundation

struct Scoreboard
{
    var players: [Player] = [
            Player(name: "Elisha", score: 0),
            Player(name: "Andre", score: 0),
            Player(name: "Jasmine", score: 0),
        ]
    
    var state = GameState.setup
    
    var doesHighestScoreWin: Bool = true
    
    var winners: [Player] {
        //You use a guard statement to check that a condition is true and exit a function early if it’s not.
        guard state == .gameOver else { return [] }
        
        var winningScore: Int = 0
        if doesHighestScoreWin
        {
            winningScore = Int.min
            for player in players {
                winningScore = max(player.score, winningScore)
                }
            
        }else{
            winningScore = Int.max
            for player in players {
                winningScore = min(player.score, winningScore)
            }
            
        }
        
        
        
        return players.filter{player in
            player.score == winningScore}
    }
    
    mutating func resetScores(to newValue: Int)
    {
        for index in 0..<players.count
        {
            players[index].score = newValue
        }
    }
}
