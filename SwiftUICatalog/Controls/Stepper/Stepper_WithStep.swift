//
//  Stepper_WithStep.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/7/25.
//

import SwiftUI

struct Stepper_WithStep: View {
    @State private var value = 0
    let step = 5
    let range = 1...50
    
    var body: some View {
        Stepper(
            value: $value,
            in: range,
            step: step
        ) {
            Text("Current: \(value) in \(range.description) " + "stepping by \(step)")
        }
        .padding(10)
    }
}

#Preview {
    Stepper_WithStep()
}
