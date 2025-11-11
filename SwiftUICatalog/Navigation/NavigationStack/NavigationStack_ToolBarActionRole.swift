//
//  NavigationStack_ToolBarActionRole.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/11/25.
//

import SwiftUI

struct NavigationStack_ToolBarActionRole: View {
    @State private var alertMessage: String? = nil
    
    var body: some View {
        NavigationStack {
            List {
                TextField("", text: .constant("ToolBarActionRole"))
            }
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button(
                        "Confirmation Action",
                        systemImage: "checkmark.bubble.fill"
                    ) {
                        alertMessage = "Confirmation Action"
                    }
                }
                
                ToolbarItemGroup(placement: .secondaryAction) {
                    Button("Secondary Action 1") {
                        alertMessage = "Secondary Action 1"
                    }
                    
                    Button("Secondary Action 2") {
                        alertMessage = "Secondary Action 1"
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button(
                        "Cancellation Action",
                        systemImage: "xmark.circle"
                    ) {
                        alertMessage = "Cancellation Action"
                    }
                }
                
                ToolbarItem(placement: .destructiveAction) {
                    Button(
                        "Destructive Action",
                        systemImage: "trash.fill",
                        role: .destructive
                    ) {
                        alertMessage = "Confirmation Action"
                    }
                }
                
                ToolbarItemGroup(placement: .keyboard) {
                    Button(
                        "Keyboard",
                        systemImage: "list.bullet.clipboard"
                    ) {
                        alertMessage = "Keyboard"
                    }
                    
                    Spacer()
                    
                    Button(
                        "Keyboard",
                        systemImage: "keyboard.chevron.compact.down.fill"
                    ) {
                        alertMessage = "Keyboard"
                    }
                }
            }
            .navigationTitle("NavigationStack")
        }
        .alert(item: $alertMessage) { message in
            Alert(title: Text(message))
        }
    }
}

#Preview {
    NavigationStack_ToolBarActionRole()
}
