//
//  containerRelativeFrame_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/SwiftUI/View/containerRelativeFrame(_:alignment:)

import SwiftUI

struct ContainerRelativeFrame_Basics: View {
    
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .fill(.blue)
                    .frame(width: 200, height: 200)
                
                Rectangle()
                    .fill(.orange)
                    // Divide the container vertical dimension by 5 and return
                    .containerRelativeFrame(.vertical) { height, _ in height / 5 }
                    // it can only access dimensions provided by specific containers listed in the container list
                    // (like a window, ScrollView, TabView, NavigationStack, etc.).
                
            }
            .border(.red)
        }
        .frame(height: 300)
    }
}

#Preview {
    ContainerRelativeFrame_Basics()
}
