//
//  Image_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/20/26.
//

import SwiftUI

struct Image_Basics: View {

    var body: some View {
        Image("swiftui")

        Image("swiftui")
            .renderingMode(.template)
            .foregroundStyle(Color.brown)

        Image(systemName: "heart.fill")
            .resizable()
            .frame(width: 100, height: 100)
    }
}

#Preview {
    Image_Basics()
}
