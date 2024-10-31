//
//  ContentView.swift
//  DataModeling
//
//  Created by Lucid AppleDev1 on 10/30/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var scoreboard = Scoreboard()
    @State private var startingPoints = 0
    
    @StateObject var timerManager = TimerManager()
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Score Keeping")
                .font(.title)
                .bold()
                .padding(.bottom)
            
            //this allows the starting points variable to be overridden by the settings view struct?
            SettingsView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $startingPoints)
                .disabled(scoreboard.state != .setup)
            
            Grid
            {
                GridRow
                {
                    Text("Name")
                        .gridColumnAlignment(.leading)
                    Text("Score")
                        .opacity(scoreboard.state == .setup ? 0 : 1.0)
                }
                .font(.headline)
                
                ForEach($scoreboard.players) { $players in
                    GridRow
                    {
                        HStack {
                            if scoreboard.winners.contains(players){
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.yellow)
                            }
                            TextField("Enter Name Here", text: $players.name)
                            Button("Remove Player", systemImage: "minus") {
                                scoreboard.players.removeAll { $0.name == players.name }
                                    
                            }
                            .font(.caption)
                            .border(Color.red, width: 1)
                            .padding(.horizontal)
                        }
                        Text("\(players.score)")
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                        Stepper("\(players.score)", value: $players.score)
                            .labelsHidden()
                            .opacity(scoreboard.state == .setup ? 0 : 1.0)
                    }
                    Text("\(players.id)")
                        .font(.caption2)
                }
            }
            .padding(.vertical)
            
            Button("Add Player", systemImage: "plus") {scoreboard.players.append(Player(name: "", score: 0))
                        }
            .opacity(scoreboard.state == .setup ? 1.0 : 0)
            
            Spacer()
            
            HStack
            {
                Text("Elapsed Time: \(Int(timerManager.elapsedTime)) seconds")
                                .font(.largeTitle)
                                .padding()
                Spacer()
                switch scoreboard.state
                {
                case.setup:
                    Button("Start Game", systemImage: "play.circle")
                    {scoreboard.state = .playing
                     scoreboard.resetScores(to: startingPoints)
                        
                        timerManager.start()
                    }
                    
                case.playing:
                    Button("End Game", systemImage: "stop.circle")
                    {scoreboard.state = .gameOver
                        timerManager.stop()
                    }
                case.gameOver:
                    Button("Restart Game", systemImage: "arrow.counterclockwise")
                    {scoreboard.state = .setup}
                    
                    //only need this if all cases are not defined
                    //default : EmptyView()
                }
                Spacer()
                
            }
            .buttonStyle(.bordered)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
            .tint(.blue)
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
