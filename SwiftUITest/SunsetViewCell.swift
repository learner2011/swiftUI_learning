//
//  SunsetViewCell.swift
//  SwiftUITest
//
//  Created by Ashwin Raghuraman on 6/15/23.
//

import SwiftUI
import UIKit

struct SunsetViewCell: View {
    
    @State private var isButtonTapped: Bool = false
    
    var imageName: String
    var text: String
    
    var body: some View {
        
        Button(action: {
            isButtonTapped.toggle()
            if let url = URL(string: "https://www.foxlocal.com/") {
                UIApplication.shared.open(url)
            }
        }) {
            HStack() {
                Image(imageName)
                    .frame(width: 52, height: 48, alignment: .center)
                Text(text)
                    .font(.custom("Graphic App", fixedSize: 18))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.leading)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 12)
            .padding(.horizontal, 25)
            .background(
                   RoundedRectangle(cornerRadius: 22)
                    .stroke(isButtonTapped ? .gray : .white, lineWidth: isButtonTapped ? 10 : 0.25)
                    .overlay(
                        isButtonTapped ? RoundedRectangle(cornerRadius: 22).fill(.blue) : nil
                    )
                   )
        }
        .padding(.vertical, 5)
    }
}

struct SunsetViewCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SunsetViewCell(imageName: "foxSports",
                           text: "The industry leader in live Sports events and engaging commentary")
        }
        .background(Image("sunsetBackground")
            .resizable()
            .aspectRatio(contentMode: .fill)
        )
    }
}
