//
//  Binding_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/16/25.
//

import SwiftUI

struct Binding_Basics: View {
    @State private var isPlaying: Bool = false
    
    var body: some View {
        PlayButton(isPlaying: $isPlaying)
    }
}

private struct PlayButton: View {
    @Binding var isPlaying: Bool
    
    var body: some View {
        Button {
            isPlaying.toggle()
        } label: {
            Image(
                systemName: isPlaying 
                ? "pause.fill"
                : "play.fill"
            )
        }
    }
}

#Preview {
    Binding_Basics()
}
