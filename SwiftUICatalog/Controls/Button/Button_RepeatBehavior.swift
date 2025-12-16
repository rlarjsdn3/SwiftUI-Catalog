//
//  Button_RepeatBehavior.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/16/25.
//

import SwiftUI

struct Button_RepeatBehavior: View {
    @State private var playbackSpeed = 1.0
    
    var body: some View {
        Button {
            playbackSpeed = playbackSpeed.advanced(by: 1)
        } label: {
            Label("Speed Up", systemImage: "hare")
        }
        .buttonRepeatBehavior(.enabled)
        .buttonStyle(.glassProminent)
        
        Text("\(playbackSpeed)")
    }
}

#Preview {
    Button_RepeatBehavior()
}
