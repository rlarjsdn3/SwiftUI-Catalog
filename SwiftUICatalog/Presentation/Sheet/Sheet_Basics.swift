//
//  Sheet_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/11/25.
//

import SwiftUI

struct Sheet_Basics: View {
    @State private var isShowingSheet = false
    
    var body: some View {
        Button {
            isShowingSheet.toggle()
        } label: {
            Text("Show License Agreement")
        }
        .sheet(
            isPresented: $isShowingSheet,
            onDismiss: didDismiss
        ) {
            Text("License Agreement")
                .font(.title)
                .padding(50)
            Text("""
                    Terms and conditions go here.
                """)
            .padding(50)
            Button("Dismiss") { isShowingSheet.toggle()
            }
        }
    }
    
    func didDismiss() {
        // Handle the dismissing action.
    }
}

#Preview {
    Sheet_Basics()
}
