//
//  containerRelativeFrame_Alignment.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/SwiftUI/View/containerRelativeFrame(_:alignment:)

import SwiftUI

struct ContainerRelativeFrame_Alignment: View {
    
    var body: some View {
        Text("Hello, World!")
            .font(.system(size: 24, weight: .bold, design: .rounded))
            .containerRelativeFrame(.horizontal, alignment: .trailing)
            .background(Color.pink)
    }
}

#Preview {
    ContainerRelativeFrame_Alignment()
}
