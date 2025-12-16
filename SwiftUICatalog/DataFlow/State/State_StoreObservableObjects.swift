//
//  State_StoreObservableObjects.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/16/25.
//

import SwiftUI

@Observable
private class Library {
    var name = "My library of books"
    // ...
}

struct State_StoreObservableObjects: View {
    @State private var library = Library()
    
    var body: some View {
        Text(library.name)
            .font(.title)
        
        Button("Change name of library") {
            library.name = "Updated library of books"
        }
    }
}

#Preview {
    State_StoreObservableObjects()
}
