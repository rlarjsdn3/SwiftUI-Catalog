//
//  Button_Roloe.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/16/25.
//

import SwiftUI

struct Button_Role: View {
    var body: some View {
        VStack {
            Button("Confirm", role: .confirm) { }
            Button("Cancel", role: .cancel) { }
            Button("Destructive", role: .destructive) { }
            Button("Close", role: .close) { }
        }
        .buttonStyle(.bordered)
    }
}

#Preview {
    Button_Role()
}
