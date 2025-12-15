//
//  Guage_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/15/25.
//

import SwiftUI

struct Gauge_Basics: View {
    @State private var batteryLevel = 0.4
    
    var body: some View {
        Gauge(value: batteryLevel) {
            Text("Battery Level")
        }
    }
}

#Preview {
    Gauge_Basics()
}
