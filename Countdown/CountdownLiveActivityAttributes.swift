//
//  CountdownLiveActivityAttributes.swift
//  SwiftUITest
//
//  Created by Ashwin Raghuraman on 12/13/23.
//

import Foundation
import ActivityKit

struct CountdownLiveActivityAttributes: ActivityAttributes {
    
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var hours: Int
        var minutes: Int
        var seconds: Int
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}
