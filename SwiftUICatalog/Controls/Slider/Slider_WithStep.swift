//
//  Slider_WithStep.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/7/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/slider

import SwiftUI

struct Slider_WithStep: View {
    @State private var percentage = 0.0
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Slider(
                value: $percentage,
                in: 0...100,
                step: 25
            ) { editing in
                isEditing = editing
            }

            
            Text("\(percentage)%")
                .foregroundStyle(isEditing ? Color.red : Color.secondary)
        }
        .padding()
    }
}

#Preview {
    Slider_WithStep()
}
