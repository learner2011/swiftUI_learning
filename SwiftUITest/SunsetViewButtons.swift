//
//  SunsetViewButtons.swift
//  SwiftUITest
//
//  Created by Ashwin Raghuraman on 6/16/23.
//

import SwiftUI

struct SunsetViewButtons: View {
    var body: some View {
        VStack(spacing: 0) {
         
            Button(action: {
                
            }) {
                HStack() {
                    Text("Support &FAQs")
                        .font(.custom("Graphic App", fixedSize: 14))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                       RoundedRectangle(cornerRadius: 22)
                        .stroke(.white, lineWidth: 0.25)
                       )
                .padding(.horizontal, 25)
            }
            .padding(.vertical, 13)
            
    
            Button(action: {
                
            }) {
                HStack() {
                    Text("Privacy Policy")
                        .font(.custom("Graphic App", fixedSize: 14))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 12)
                .background(
                       RoundedRectangle(cornerRadius: 22)
                        .stroke(.white, lineWidth: 0.25)
                        .overlay(
                            RoundedRectangle(cornerRadius: 22)
                                .fill(Color(red: 1, green: 1, blue: 1, opacity: 0.25))
                        )
                       )
                .padding(.horizontal, 25)
            }
        }
    }
}

struct SunsetViewButtons_Previews: PreviewProvider {
    static var previews: some View {
        SunsetViewButtons()
            .background(Image("sunsetBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
            )
    }
}
