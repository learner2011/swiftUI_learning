//
//  LiveActivityTestCountdownView.swift
//  SwiftUITest
//
//  Created by Ashwin Raghuraman on 12/13/23.
//

import SwiftUI

struct LiveActivityTestCountdownView: View {
    
    @EnvironmentObject var viewModel: CountdownModel
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Spacer()
                VStack {
                    Text(String(viewModel.hours))
                    Text("Hours")
                }
                
                Spacer()
                
                VStack {
                    Text(String(viewModel.minutes))
                    Text("Minutes")
                }
                
                Spacer()
                
                VStack {
                    Text(String(viewModel.seconds))
                    Text("Seconds")
                }
                
                Spacer()
            }
            
            Button {
                viewModel.startCountdown()
            } label: {
                Text("Start countdown")
            }
        }
    }
}

struct LiveActivityTestCountdownView_Previews: PreviewProvider {
    static var previews: some View {
        LiveActivityTestCountdownView().environmentObject(CountdownModel(totalNumberOfSeconds: 28800))
    }
}
