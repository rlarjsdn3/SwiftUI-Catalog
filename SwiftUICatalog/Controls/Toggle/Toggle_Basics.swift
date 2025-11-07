//
//  Toggle_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/7/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/toggle

import SwiftUI

struct Toggle_Basics: View {
    @State private var vibrateOnRing = false
    
    var body: some View {
        VStack {
            Toggle("Vibrate on Ring", isOn: $vibrateOnRing)
            
            Toggle(isOn: $vibrateOnRing) {
                Text("Vibrate on Ring")
            }
            
            Toggle(isOn: $vibrateOnRing) {
                Text("Vibrate on Ring")
                Text("Enable vibration when phone rings")
            }
            
            Toggle(
                "Vibrate on Ring",
                systemImage: "dot.radiowaves.left.and.right",
                isOn: $vibrateOnRing
            )
        }
    }
}

#Preview {
    Toggle_Basics()
}
