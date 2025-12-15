//
//  Guage_Circular.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/15/25.
//

import SwiftUI

struct Gauge_Circular: View {
    @State private var current = 67.0
    @State private var minValue = 50.0
    @State private var maxValue = 170.0
    let gradient = Gradient(colors: [.green, .yellow, .orange, .red])
    
    var body: some View {
        Gauge(
            value: current,
            in: minValue...maxValue
        ) {
            Image(systemName: "heart.fill")
                .foregroundStyle(.red)
        } currentValueLabel: {
            Text("\(Int(current))")
                .foregroundStyle(Color.green)
        } minimumValueLabel: {
            Text("\(Int(minValue))")
                .foregroundStyle(Color.green)
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
                .foregroundStyle(Color.red)
        } markedValueLabels: {
            Text("dd")
        }
        .tint(gradient)
        .gaugeStyle(AccessoryCircularGaugeStyle())
    }
}

#Preview {
    Gauge_Circular()
}
