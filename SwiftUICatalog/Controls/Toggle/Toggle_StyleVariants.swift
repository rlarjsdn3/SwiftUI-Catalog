//
//  Toggle_StyleVariants.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/7/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/toggle

import SwiftUI

struct Toggle_StyleVariants: View {
    @State private var vibrateOnRing = false
    
    var body: some View {
        VStack {
            Toggle("Automatic", isOn: $vibrateOnRing)
                .toggleStyle(.automatic)
            
            Toggle("Button", isOn: $vibrateOnRing)
                .toggleStyle(.button)
            
            Toggle("Switch", isOn: $vibrateOnRing)
                .toggleStyle(.switch)
        }
    }
}

#Preview {
    Toggle_StyleVariants()
}
