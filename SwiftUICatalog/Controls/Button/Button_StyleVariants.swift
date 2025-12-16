//
//  Button_StyleVariants.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/16/25.
//

import SwiftUI

struct Button_StyleVariants: View {
    var body: some View {
        VStack {
            Button("Automatic", action: { })
                .buttonStyle(.automatic)
            
            Button("Bordered", action: { })
                .buttonStyle(.bordered)
            
            Button("BorderedProminent", action: { })
                .buttonStyle(.borderedProminent)
            
            Button("Borderless", action: { })
                .buttonStyle(.borderless)
            
            Button("Glass", action: { })
                .buttonStyle(.glass)
            
            Button("GlassProminent", action: { })
                .buttonStyle(.glassProminent)
            
            Button("Plain", action: { })
                .buttonStyle(.plain)
        }
    }
}

#Preview {
    Button_StyleVariants()
}
