//
//  ColorPicker_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/15/25.
//

import SwiftUI

struct ColorPicker_Basics: View {
    @State private var bgColor: Color = Color(.sRGB, red: 0.98, green: 0.92, blue: 0.95)
    
    var body: some View {
        VStack {
            ColorPicker(
                "Alignment Guides",
                selection: $bgColor,
                supportsOpacity: true
            )
            
            bgColor
        }
        .padding()
    }
}

#Preview {
    ColorPicker_Basics()
}
