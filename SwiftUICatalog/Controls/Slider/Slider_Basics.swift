//
//  Slider_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/7/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/slider

import SwiftUI

struct Slider_Basics: View {
    
    @State private var speed = 50.0
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Slider(
                value: $speed,
                in: 0...100) { editing in
                    isEditing = editing
                }
            Text("\(speed)")
                .foregroundStyle(isEditing ? .red : .blue)
        }
        .padding()
    }
}

#Preview {
    Slider_Basics()
}
