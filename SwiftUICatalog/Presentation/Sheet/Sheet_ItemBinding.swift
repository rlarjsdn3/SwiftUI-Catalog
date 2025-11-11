//
//  Sheet_ItemBinding.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/11/25.
//

import SwiftUI

private struct InventoryItem: Identifiable {
    let id: String
    let partNumber: String
    let quantity: Int
    let name: String
}

struct Sheet_ItemBinding: View {
    @State private var sheetDetail: InventoryItem?
    
    var body: some View {
        Button("Show Part Details") {
            sheetDetail = InventoryItem(
                id: "0123456789",
                partNumber: "Z-1234A",
                quantity: 100,
                name: "Widget"
            )
        }
        .sheet(
            item: $sheetDetail,
            onDismiss: didDismiss
        ) { detail in
            VStack(alignment: .leading, spacing: 20) {
                Text("Part Number: \(detail.partNumber)")
                Text("Name: \(detail.name)")
                Text("Quantity On-Hand: \(detail.quantity)")
            }
            .onTapGesture {
                sheetDetail = nil
            }
        }
    }
    
    private func didDismiss() {
        // Handle the dismissing action.
    }
}

#Preview {
    Sheet_ItemBinding()
}
