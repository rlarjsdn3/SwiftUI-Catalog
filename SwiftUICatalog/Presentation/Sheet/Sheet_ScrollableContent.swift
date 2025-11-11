//
//  Sheet_ScrollableContent.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/11/25.
//

import SwiftUI

struct Sheet_CompactAdaptation: View {
    @State private var showSettings = false
    
    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .popover(isPresented: $showSettings) {
            InfoView()
                // But what if we wanted a popover in compact vertical size classes?
                .presentationCompactAdaptation(
                    horizontal: .sheet,
                    vertical: .popover
                )
        }
    }
}

private struct InfoView: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        Text("Vertical Size Class: \(verticalSizeClass)")
        Text("Horizontal Size Class: \(horizontalSizeClass)")
    }
}

#Preview {
    Sheet_CompactAdaptation()
}
