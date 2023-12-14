//
//  LayoutTest.swift
//  SwiftUITest
//
//  Created by Ashwin Raghuraman on 11/21/23.
//

import SwiftUI

struct LayoutTest: View {
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack {
                VStack(spacing: .zero) {
                    HStack(spacing: .zero) {
                        testButtonView(titleText: "THIS IS A BIG TITLE THAT COULD WRAP", showBadge: true)
                        
                        FNDownloadStateView()
                    }
                    
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.")
                        .lineLimit(3)
                        .padding(.top, 6)
                        .padding(.bottom, 10)
                        .font(.custom("Graphik App", size: 12).weight(.regular))
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Rectangle()
                        .foregroundColor(.white.opacity(0.1))
                        .frame(maxWidth: .infinity)
                        .frame(height: 1)
                }
                
                HStack(spacing: .zero) {
                    testButtonView(titleText: "THIS IS A TITLE", showBadge: true)
                }
                
                HStack(spacing: .zero) {
                    testButtonView(titleText: "THIS IS A BIG TITLE THAT COULD WRAP")
                }
                
                HStack(spacing: .zero) {
                    testButtonView(titleText: "THIS IS A TITLE")
                }
            }
        }
        .background(GeometryReader {_ in
            Color(red: 0.09, green: 0.09, blue: 0.09).edgesIgnoringSafeArea(.all)
        })
    }
}

struct testButtonView: View {
    
    //@State private var dynamicHeight: CGFloat = 0
    
    var titleText: String = ""
    var showBadge: Bool = false
    
    var body: some View {
        Button {
            //
        } label: {
            VStack(spacing: .zero) {
                HStack(alignment: .top, spacing: .zero) {
                    ZStack(alignment: .bottom) {
                        Image("corn-on-the-cob-thumb").resizable()
                        
                        backgroundGradient()
                        
                        ProgressView(value: 0.5)
                            .progressViewStyle(CustomProgressViewStyle())
                    }
                    .frame(width: 121, height: 68)
                    
                    VStack(alignment: .center, spacing: .zero) {
                        if showBadge {
                            FNSwiftUIBadgeView()
                        }
                        
                        Group {
                            Text(titleText)
                                .padding(.top, 4)
                                .font(.custom("Graphik App", size: 14).weight(.medium))
                                .lineLimit(2)
                                .multilineTextAlignment(.leading)
                            
                            Text("Item subtitle")
                                .padding(.top, 4)
                                .font(.custom("Graphik App", size: 10).weight(.regular))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .foregroundColor(.white)
                    .padding(.leading, 10)
                    .padding(.trailing, 14)
                    .frame(height: 68)
                }
            }
        }
    }
    
    struct HeightPreferenceKey: PreferenceKey {
        static var defaultValue: CGFloat = 0

        static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
            value = max(value, nextValue())
        }
    }
    
    @ViewBuilder
    func backgroundGradient() -> some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(height: 40)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: .black.opacity(.zero), location: .zero),
                        Gradient.Stop(color: .black.opacity(0.5), location: 1)
                    ],
                    startPoint: UnitPoint(x: 0, y: 0),
                    endPoint: UnitPoint(x: 0, y: 1)
                )
            )
    }
}

struct CustomProgressViewStyle: ProgressViewStyle {
    var height: CGFloat = Constants.defaultHeight
    var fillColor: Color = .white.opacity(Constants.opacity)
    var progressColor: Color = .white
    
    func makeBody(configuration: Configuration) -> some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .leading) {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(height: height)
                        .background(fillColor)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: geometry.size.width * CGFloat(configuration.fractionCompleted ?? 0),
                               height: height)
                        .background(progressColor)
                }
                .cornerRadius(height / Constants.radius)
            }
        }.frame(height: height)
    }
    
    enum Constants {
        static let opacity: Double = 0.25
        static let radius: CGFloat = 2
        static let defaultHeight: CGFloat = 2
    }
}

struct FNSwiftUIBadgeView: View {
    
    var body: some View {
        HStack(spacing: .zero) {
            Text("WATCHED")
                .cornerRadius(Constants.badgeViewCornerRadius)
                .font(Constants.badgeFont)
                .background(.black)
                .foregroundColor(.white)
            Spacer()
        }
    }
    
    private enum Constants {
        static let badgeViewPadding: CGFloat = 5
        static let badgeViewCornerRadius: CGFloat = 2
        static let badgeFont: Font = .custom("Graphik App", size: 10).weight(.semibold)
    }
}

struct FNDownloadStateView: View {
    var downloadIconSize: CGFloat = Constants.downloadIconSize
    var downloadProgressSize: CGFloat = Constants.downloadProgressSize
    var shouldShowStatusInfo: Bool = false
    
    var body: some View {
        Button {
            
        } label: {
            VStack(alignment: .center, spacing: .zero) {
                Image("download_black_bg")
                    .resizable()
                    .frame(width: downloadIconSize,
                           height: downloadIconSize,
                           alignment: .center)
                
                if shouldShowStatusInfo {
                    Text("Download")
                        .padding(.top, Constants.textTopPadding)
                        .font(Constants.font)
                        .foregroundColor(Color.white)
                }
            }
        }
        .accessibility(label: Text("download item"))
        .padding()
    }
    
    private enum Constants {
        static let downloadIconSize: CGFloat = 18
        static let downloadProgressSize: CGFloat = 25
        static let textTopPadding: CGFloat = 7
        static let font: Font = .custom("Graphik App", size: 10).weight(.regular)
    }
}

struct LayoutTest_Previews: PreviewProvider {
    static var previews: some View {
        LayoutTest()
    }
}
