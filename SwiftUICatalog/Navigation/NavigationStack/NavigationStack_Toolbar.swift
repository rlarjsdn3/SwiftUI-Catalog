//
//  NavigationStack_Toolbar.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/10/25.
//

import SwiftUI

struct NavigationStack_Toolbar: View {
    @State private var alertMessage: String? = nil
    
    var body: some View {
        NavigationStack {
            List {
                TextField("TextField", text: .constant("Hello, World!"))
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("TopBarLeading", systemImage: "chevron.left") {
                        alertMessage = "TopBarLeading"
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button("BottomBar", systemImage: "camera") {
                        alertMessage = "BottomBar"
                    }
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button("BottomBar", systemImage: "photo.artframe") {
                        alertMessage = "BottomBar"
                    }
                }
                
                ToolbarItem(placement: .primaryAction) {
                    Button("Primary Action", systemImage: "square.and.arrow.up") {
                        alertMessage = "Primary Action"
                    }
                }
                
                ToolbarItem(placement: .secondaryAction) {
                    Button("Secondary Action", systemImage: "square.and.arrow.up") {
                        alertMessage = "Secondary Action"
                    }
                }
                
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancellation Action", systemImage: "chevron.right") {
                        alertMessage = "Cancellation Action"
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Confirmation Action", systemImage: "xmark.bin") {
                        alertMessage = "Confirmation Action"
                    }
                }
                
                ToolbarItem(placement: .destructiveAction) {
                    Button("Destructive Action", systemImage: "trash.fill") {
                        alertMessage = "Destructive Action"
                    }
                    .tint(Color.red)
                }
                
                ToolbarItem(placement: .keyboard) {
                    Button("Keyboard", systemImage: "list.bullet.clipboard") {
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

extension String: @retroactive Identifiable {
    public var id: Self { self }
}

#Preview {
    NavigationStack_Toolbar()
}
