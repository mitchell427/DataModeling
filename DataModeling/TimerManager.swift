//
//  TimerManager.swift
//  DataModeling
//
//  Created by Lucid AppleDev1 on 10/31/24.
//

import SwiftUI
import Foundation
import Combine

class TimerManager: ObservableObject {
    private var timer: Timer?
    //The Date type represents a specific point in time, and it provides various methods to get the current date and time, compare dates, and perform calculations on dates and times.
    private var startTime: Date?
    
    // Use @Published to make the elapsedTime property observable
    @Published var elapsedTime: TimeInterval = 0
    var isRunning = false

    func start() {
        guard !isRunning else { return } // Prevent multiple starts
        startTime = Date()
        isRunning = true
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateElapsedTime), userInfo: nil, repeats: true)
    }

    func stop() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }

    @objc private func updateElapsedTime() {
        guard let start = startTime else { return }
        elapsedTime = Date().timeIntervalSince(start)
    }
}
