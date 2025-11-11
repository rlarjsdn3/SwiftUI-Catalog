//
//  ConfirmationDialog_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/11/25.
//

import SwiftUI
import UniformTypeIdentifiers

struct FileDetals: Identifiable {
    var id: String { name }
    let name: String
    let fileType: UTType
}

struct ConfirmationDialog_Basics: View {
    @State private var isConfirming = false
    @State private var dialogDetail: FileDetals?
    
    var body: some View {
        Button("Import File") {
            dialogDetail = FileDetals(name: "MyImageFile.png", fileType: .png)
            isConfirming = true
        }
        .confirmationDialog(
            Text("Import New File?"),
            isPresented: $isConfirming,
            presenting: dialogDetail
        ) { detail in
            Button {
                // Handle import action.
            } label: {
                Text("""
                    Import \(detail.name)
                    File Type: \(detail.fileType.description)
                    """)
            }
            Button("Cancel", role: .cancel) {
                dialogDetail = nil
            }
        }
    }
}

#Preview {
    ConfirmationDialog_Basics()
}
