//
//  Text_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/text

import SwiftUI

struct Text_Basics: View {
    
    var body: some View {
        Text("Hello, World!")
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

#Preview {
    Text_Basics()
}
