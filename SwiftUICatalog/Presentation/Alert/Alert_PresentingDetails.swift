//
//  Alert_WithAlertModifier.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/11/25.
//

import SwiftUI

private struct SaveDetails: Identifiable {
    let name: String
    let error: String
    let id = UUID()
}

@Observable
private class Model {
    func save(didError: Binding<Bool>) -> SaveDetails {
        didError.wrappedValue = true
        return SaveDetails(
            name: "NSLog.txt",
            error: "Directory path is not correct."
        )
    }
}

struct Alert_PresentingDetails: View {
    @State private var model = Model()
    
    @State private var didError = false
    @State private var details: SaveDetails?
    let alertTitle: String = "Save failed."
    
    var body: some View {
        Button("Show Alert") {
            details = model.save(didError: $didError)
        }
        .alert(
            Text(alertTitle),
            isPresented: $didError,
            presenting: details) { details in
                Button(role: .destructive) {
                    // Handle the deletion.
                } label: {
                    Text("Delete \(details.name)")
                }
                
                Button("Retry") {
                    // Handle the retry action.
                }
            } message: { details in
                Text(details.error)
            }

        
    }
}

#Preview {
    Alert_PresentingDetails()
}
