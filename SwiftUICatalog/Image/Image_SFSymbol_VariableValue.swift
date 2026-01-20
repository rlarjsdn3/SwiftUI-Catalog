//
//  Image_SFSymbol_VariableValue.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/20/26.
//

import SwiftUI

struct Image_SFSymbol_VariableValue: View {
    @State private var variableValue: Double = 0.0

    var body: some View {
        VStack {
            Slider(
                value: $variableValue,
                in: 0...1,
                label: {}) {
                    Text("0")
                } maximumValueLabel: {
                    Text("100%")
                }

            HStack {
                Image(systemName: "dot.radiowaves.left.and.right", variableValue: variableValue)
                    .symbolVariableValueMode(.draw)

                Image(systemName: "thermometer.high", variableValue: variableValue)
                    .symbolVariableValueMode(.draw)
            }
            .font(.largeTitle)
        }
        .padding()
    }
}

#Preview {
    Image_SFSymbol_VariableValue()
}
