//
//  SunsetTabletView.swift
//  SwiftUITest
//
//  Created by Ashwin Raghuraman on 6/19/23.
//

import SwiftUI

struct SunsetTabletView: View {
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
                Image(foxHeader.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 140, height: 59)
                    .padding(38)
                
                Text(foxHeader.text)
                    .font(.custom("Graphic App", fixedSize: 24))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            .padding(.horizontal, 20)
            .padding(.vertical, 20)
            
            SunsetTabletViewCell(foxChannels: foxChannels)
                .padding(.horizontal, 16)
            
            
            SunsetViewButtons()
                .padding(.horizontal, 245)
                .padding(.bottom, 100)
            
        }
        .background(
            Image("tabletBackground")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        )
    }
}


struct SunsetTabletViewCell: View {
    
    var foxChannels: [FoxChannelDetails]
    
    let gridLayout = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: gridLayout, spacing: 16) {
                ForEach(foxChannels, id: \.self) { foxChannel in
                    Button(action: {
                        
                    }) {
                        VStack(spacing: 0) {
                            Image(foxChannel.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 131, height: 131)
                                .padding(.vertical, 20)
                            
                            Text(foxChannel.text)
                                .font(.custom("Graphic App", fixedSize: 30))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .padding(50)
                        }
                        .frame(height: 419)
                        .frame(maxWidth: .infinity)
                    }
                    .background(
                        Image("tabletButtonBackground")
                            .resizable()
                    )
                }
            }
        }
    }
}



//struct SunsetTabletViewCell: View {
//
//    var foxChannel: FoxChannelDetails
//
//    var body: some View {
//
//        Button(action: {
//
//        }) {
//            VStack(spacing: 0) {
//                Image(foxChannel.imageName)
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 140, height: 59)
//                    .padding(.vertical, 50)
//
//                Text(foxChannel.text)
//                    .font(.custom("Graphic App", fixedSize: 30))
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.leading)
//                    .padding(50)
//            }
//        }
//        .background(
//            Image("tabletButtonBackground")
//                .resizable()
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
//        )
//    }
//}

struct SunsetTabletView_Previews: PreviewProvider {
    static var previews: some View {
        SunsetTabletView().background(.black)
    }
}
