//
//  CountdownLiveActivity.swift
//  Countdown
//
//  Created by Ashwin Raghuraman on 12/13/23.
//

import WidgetKit
import SwiftUI

struct CountdownLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: CountdownLiveActivityAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                //Text("Hello \(context.state.text)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    //Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
//                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    HStack {
                        Spacer()
                        VStack {
                            Text(String(context.state.hours))
                            Text("Hours")
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text(String(context.state.minutes))
                            Text("Minutes")
                        }
                        
                        Spacer()
                        
                        VStack {
                            Text(String(context.state.seconds))
                            Text("Seconds")
                        }
                        
                        Spacer()
                    }
                    // more content
                }
            } compactLeading: {
                Text("Event in")
            } compactTrailing: {
                if context.state.hours > 0 {
                    Text("\(context.state.hours) hours")
                } else if context.state.minutes > 0 {
                    Text("\(context.state.minutes) minutes")
                } else if context.state.seconds > 0 {
                    Text("\(context.state.seconds) seconds")
                }
                
            } minimal: {
                //Text(context.state.text)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}
