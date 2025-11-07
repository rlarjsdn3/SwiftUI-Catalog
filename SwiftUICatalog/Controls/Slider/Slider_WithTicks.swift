//
//  Slider_WithStep.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/7/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/slider

import SwiftUI

struct Slider_WithTicks: View {
    @State private var percentage = 0.5
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            Slider(value: $percentage) {
                Text("Percentage")
            } currentValueLabel: {
                Text("\(percentage)%")
            } ticks: {
                SliderTickContentForEach(
                    stride(from: 0.0, through: 1.0, by: 0.25).map { $0 },
                    id: \.self
                ) { value in
                    SliderTick(value) {
                        Text(String(format: "%.0f", value))
                    }
                }
            }
            
            Text("\(percentage)%")
        }
    }
}

#Preview {
    Slider_WithTicks()
}
