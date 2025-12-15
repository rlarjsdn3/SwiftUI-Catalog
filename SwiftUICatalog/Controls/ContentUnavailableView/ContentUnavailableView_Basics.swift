//
//  ContentUnavailableView_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/15/25.
//

import SwiftUI

struct ContentUnavailableView_Basics: View {
    var body: some View {
        ContentUnavailableView {
            Label("No Mail", systemImage: "tray.fill")
        } description: {
            Text("New mails you receive will appear here.")
        } actions: {
            Button("Refresh Mail") {
                // Mail Refresh...
            }
        }
    }
}

#Preview {
    ContentUnavailableView_Basics()
}
