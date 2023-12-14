//
//  CountdownModel.swift
//  SwiftUITest
//
//  Created by Ashwin Raghuraman on 12/13/23.
//

import Foundation
import ActivityKit
import SwiftUI

class CountdownModel: ObservableObject {
    @Published var hours: Int
    @Published var minutes: Int
    @Published var seconds: Int
    var numberOfSecondsRemaining: Int
    private var timer: Timer?
    private var activityId: String?
    
    init(totalNumberOfSeconds: Int) {
        self.numberOfSecondsRemaining = totalNumberOfSeconds
        self.hours = totalNumberOfSeconds / 3600
        self.minutes = (totalNumberOfSeconds % 3600) / 60
        self.seconds = (totalNumberOfSeconds % 3600) % 60
    }
    
    func startCountdown() {
        
        startLiveActivity()
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self else { return }
            
            if numberOfSecondsRemaining > 0 {
                numberOfSecondsRemaining -= 1
                updateRemainingTime()
                Task {
                    await self.updateLiveActivity()
                }
            } else {
                timer?.invalidate()
            }
        }
    }
    
    private func updateRemainingTime() {
        self.hours = numberOfSecondsRemaining / 3600
        self.minutes = (numberOfSecondsRemaining % 3600) / 60
        self.seconds = (numberOfSecondsRemaining % 3600) % 60
    }
    
    private func startLiveActivity() {
        let attributes = CountdownLiveActivityAttributes(name: "Live activity")
        
        let initialContentState = CountdownLiveActivityAttributes.ContentState(hours: self.hours, minutes: self.minutes, seconds: self.seconds)
        
        let content = ActivityContent(state: initialContentState, staleDate: nil, relevanceScore: 100)
        
        do {
            let activity = try Activity.request(attributes: attributes,
                                                content: content)
            self.activityId = activity.id
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func updateLiveActivity() async {
        guard let activityId = activityId,
              let runningActivity = Activity<CountdownLiveActivityAttributes>.activities.first(where: { $0.id == activityId}) else {
            print("unable to get current activity")
            return
        }
        
        let updatedContentState = CountdownLiveActivityAttributes.ContentState(hours: self.hours, minutes: self.minutes, seconds: self.seconds)
        
        print("updatedContentstate", updatedContentState)
        
        await runningActivity.update(using: updatedContentState)
    }
}
