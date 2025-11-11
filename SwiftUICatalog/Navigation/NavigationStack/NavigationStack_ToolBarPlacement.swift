//
//  NavigationStack_ToolBarPlacement.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/10/25.
//

import SwiftUI

struct NavigationStack_ToolBarPlacement: View {
    @State private var alertMessage: String? = nil
    
    var body: some View {
        NavigationStack {
            List {
                Text("ToolbarPlacement")
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("TopBarLeading", systemImage: "chevron.left") {
                        alertMessage = "TopBarLeading"
                    }
                }
                
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("TopBarTrailing", systemImage: "square.and.arrow.up") {
                        alertMessage = "TopBarTrailing"
                    }
                    
                    Button("TopBarTrailing", systemImage: "trash.fill") {
                        alertMessage = "TopBarTrailing"
                    }
                    .tint(Color.red)
                }
                
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("BottomBar", systemImage: "camera") {
                        alertMessage = "BottomBar"
                    }
                    
                    Spacer()
                    
                    Button("BottomBar", systemImage: "photo.artframe") {
                        alertMessage = "BottomBar"
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
    NavigationStack_ToolBarPlacement()
}
