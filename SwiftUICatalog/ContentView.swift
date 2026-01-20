//
//  ContentView.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Image_AsyncImage()
            }
            .navigationTitle("SwiftUI Catalog")
            .navigationSubtitle("SwiftUI 카탈로그 & 샘플 코드")
        }
    }
}

#Preview {
    ContentView()
}
