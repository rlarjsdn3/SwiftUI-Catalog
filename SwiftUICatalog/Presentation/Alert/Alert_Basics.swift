//
//  Alert_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/11/25.
//

import SwiftUI

struct Alert_Basics: View {
    @State private var showAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showAlert = true
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Hello, SwiftUI!"),
                message: Text("SwiftUI uses a declarative syntax, so you can simply state what your user interface should do."),
                primaryButton: .default(
                    Text("OK"),
                    action: { print("Primary Button Tapped") }
                ),
                secondaryButton: .cancel(Text("Cancel"))
            )
        }
    }
}

#Preview {
    Alert_Basics()
}
