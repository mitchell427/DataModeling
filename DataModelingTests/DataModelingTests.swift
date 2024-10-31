//
//  DataModelingTests.swift
//  DataModelingTests
//
//  Created by Lucid AppleDev1 on 10/30/24.
//

import Testing
@testable import DataModeling

struct DataModelingTests {

    
    @Test("Reset Player Scores", arguments: [0, 100, 200])
    func resetScores(to newValue: Int) async throws {
            var scoreboard = Scoreboard(players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 5),
            ])
        scoreboard.resetScores(to: newValue)
        
        //this acts as the question to wether the code runs as expected
        //ensure the correct score was applied ie set back to 0
        for player in scoreboard.players {
            #expect(player.score == newValue)
        }
    }
    
    @Test("Highest Score Wins")
    func highestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 4),
            ],
            state: .gameOver,
            doesHighestScoreWin: true
        )
        //this acts as the question to wether the code runs as expected
        //ensure the correct score was applied ie set back to 0
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Andre", score: 4)])
    }
    
    @Test("Lowest score wins")
    func lowestScoreWins() {
        let scoreboard = Scoreboard(
            players: [
                Player(name: "Elisha", score: 0),
                Player(name: "Andre", score: 4),
            ],
            state: .gameOver,
            doesHighestScoreWin: false
        )
        //this acts as the question to wether the code runs as expected
        //ensure the correct score was applied ie set back to 0
        let winners = scoreboard.winners
        #expect(winners == [Player(name: "Elisha", score: 0)])
    }
}
