//
//  SunsetView.swift
//  SwiftUITest
//
//  Created by Ashwin Raghuraman on 6/15/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct SunsetMobileView: View {
    var body: some View {
        
        let foxHeader: FoxChannelDetails = FoxChannelDetails(imageName: "fox",
                                                             text: "For FOX primetime, download Hulu OR stream on FOX.com")
        
        let foxChannels: [FoxChannelDetails] = [FoxChannelDetails(imageName: "foxSports",
                                                                  text: "The industry leader in live Sports events and engaging commentary"),
                                                FoxChannelDetails(imageName: "foxNews",
                                                                  text: "Breaking news and opinion from America’s #1 most-watched News Brand"),
                                                FoxChannelDetails(imageName: "tubi",
                                                                  text: "Watch over 50,000 movies and TV shows free, on-demand on Tubi"),
                                                FoxChannelDetails(imageName: "foxLocal",
                                                                  text: "News and local programming, free and on-demand from your FOX station")]
        
        VStack(spacing: 0) {
            
            HStack() {
                
                WebImage(url: URL(string: "http://localhost:8000/fox.pdf"))
                    .resizable()
                    .frame(width: 50, height: 30)
                    .aspectRatio(contentMode: .fit)
                
                Text(foxHeader.text)
                    .font(.custom("Graphic App", fixedSize: 18))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, maxHeight: 84)
            .padding(.horizontal, 20)
            
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(foxChannels, id: \.self) { channel in
                        SunsetViewCell(imageName: channel.imageName, text: channel.text)
                            .padding(.horizontal, 20)
                    }
                }
            }
            
            SunsetViewButtons().padding(.bottom, 50)
            
            Spacer()
        }
        
        .background(
            Image("sunsetBackground")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
    }
}

struct SunsetMobileView_Previews: PreviewProvider {
    static var previews: some View {
        SunsetMobileView().background(.black)
    }
}
