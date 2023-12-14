//
//  SwiftUITestApp.swift
//  SwiftUITest
//
//  Created by Ashwin Raghuraman on 5/24/23.
//

import SwiftUI

@main
struct SwiftUITestApp: App {
    var body: some Scene {
        WindowGroup {
            LiveActivityTestCountdownView().environmentObject(CountdownModel(totalNumberOfSeconds: 28800))
        }
    }
}
