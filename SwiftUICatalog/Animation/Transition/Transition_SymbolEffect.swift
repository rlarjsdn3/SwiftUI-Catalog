//
//  Transition_SymbolEffect.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/13/25.
//

import SwiftUI

struct Transition_SymbolEffect: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            Image(systemName: "chart.line.uptrend.xyaxis").font(.system(size: 150))
                .transition(.symbolEffect(.drawOn))
        }
        Button("Toggle") {
            withAnimation {
                isActive.toggle()
            }
        }
    }
}

#Preview {
    Transition_SymbolEffect()
}
