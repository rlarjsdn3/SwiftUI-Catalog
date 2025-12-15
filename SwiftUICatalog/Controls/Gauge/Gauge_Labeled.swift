//
//  Guage_Linear.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/15/25.
//

import SwiftUI

struct Guage_Labeled: View {
    @State private var current = 67.0
    @State private var minValue = 0.0
    @State private var maxValue = 170.0
    
    var body: some View {
        Gauge(
            value: current,
            in: minValue...maxValue
        ) {
            Text("BPM")
        } currentValueLabel: {
            Text("\(Int(current))")
        } minimumValueLabel: {
            Text("\(Int(minValue))")
        } maximumValueLabel: {
            Text("\(Int(maxValue))")
        }
    }
}

#Preview {
    Guage_Labeled()
}
