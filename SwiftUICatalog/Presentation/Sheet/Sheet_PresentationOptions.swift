//
//  Sheet_PresentationDetent.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/11/25.
//

import SwiftUI

struct Sheet_PresentationOptions: View {
    @State private var showSettings = false
    
    var body: some View {
        Button("View Settings") {
            showSettings = true
        }
        .sheet(isPresented: $showSettings) {
            SettingsView()
                .presentationDetents([.large, .medium, .height(250)])
                .presentationCornerRadius(50)
                .presentationContentInteraction(.scrolls)
        }
    }
}

private struct SettingsView: View {
    var body: some View {
        List(0..<10, id: \.self) { index in
            Text("\(index)")
        }
    }
}

#Preview {
    Sheet_PresentationOptions()
}
