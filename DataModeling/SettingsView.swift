//
//  SettingsView.swift
//  DataModeling
//
//  Created by Lucid AppleDev1 on 10/30/24.
//

import SwiftUI

struct SettingsView: View {
    @Binding var doesHighestScoreWin: Bool
    @Binding var startingPoints: Int
    
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Game Rules")
                .font(.headline)
            Divider()
            Picker("Starting Points", selection: $startingPoints) {
                Text("0 starting points")
                        .tag(0)
                Text("10 starting points")
                        .tag(10)
                Text("20 starting points")
                        .tag(20)
            }
            
            Picker(("Highest Score Wins"), selection: $doesHighestScoreWin) {
                Text("Lowest Score Wins")
                    .tag(false)
                Text("Highest Score Wins")
                    .tag(true)
            }
            
        }
        .padding()
        .background(.thinMaterial, in: .rect(cornerRadius: 10.0))
    }
}

#Preview {
    @Previewable @State var startingPoints = 10
    @Previewable @State var doesHighestScoreWin = true
        SettingsView(doesHighestScoreWin: $doesHighestScoreWin, startingPoints: $startingPoints)
}
