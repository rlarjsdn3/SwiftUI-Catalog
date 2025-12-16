//
//  State_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 18, Xcode 16 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/observation

import SwiftUI

struct State_Basics: View {
    @State private var isPlaying: Bool = false
    
    var body: some View {
        Button(isPlaying ? "Pause" : "Play") {
            isPlaying.toggle()
        }
        .transaction { transaction in
            transaction.disablesAnimations = true
        }
    }
}

#Preview {
    State_Basics()
}
