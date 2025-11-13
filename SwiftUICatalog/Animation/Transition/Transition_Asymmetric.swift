//
//  Transition_Asymmetric.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/13/25.
//

import SwiftUI

struct Transition_Asymmetric: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            MyView()
                .transition(
                    .asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: .opacity
                    )
                )
        }
        Button("Toggle") {
            withAnimation {
                isActive.toggle()
            }
        }
    }
}

private struct MyView: View {
    var body: some View {
        Color.red.frame(width: 200, height: 200)
    }
}

#Preview {
    Transition_Asymmetric()
}
