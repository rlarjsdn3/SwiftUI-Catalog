//
//  Alert_WithTextField.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/11/25.
//

import SwiftUI

struct Alert_WithTextField: View {
    @State private var showAlert = false
    
    var body: some View {
        Button("Show Alert") {
            showAlert = true
        }
        .alert(
            "Sign in",
            isPresented: $showAlert) {
                TextField("username", text: .constant("username"))
                SecureField("password", text: .constant("password"))
                
                Button("Sign in", role: .confirm) { }
                Button(role: .cancel) { }
            } message: {
                Text("AppStore require a username and password.")
                
            }

    }
}

#Preview {
    Alert_WithTextField()
}
