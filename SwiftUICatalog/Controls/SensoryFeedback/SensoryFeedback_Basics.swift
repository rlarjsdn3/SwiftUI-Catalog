//
//  SensoryFeedback_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/15/25.
//

import SwiftUI

struct SensoryFeedback_Basics: View {
    @State private var showAccessory = false
    
    var body: some View {
        Text("Show Accessory")
            .sensoryFeedback(.selection, trigger: showAccessory)
            .onLongPressGesture {
                showAccessory.toggle()
            }
        
        if showAccessory {
            Color.yellow
        }
    }
}

#Preview {
    SensoryFeedback_Basics()
}
