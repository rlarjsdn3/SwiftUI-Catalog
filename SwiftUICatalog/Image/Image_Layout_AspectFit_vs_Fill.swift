//
//  Image_Layout_AspectFit_vs_Fill.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/20/26.
//

import SwiftUI

struct Image_Layout_AspectFit_vs_Fill: View {

    var body: some View {
        VStack {
            Text("AspectFit")

            Image("swiftui")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 300)
                .overlay(Color.red, in: Rectangle().stroke())

            Text("AspectFill")

            Image("swiftui")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 300)
                .overlay(Color.red, in: Rectangle().stroke())
        }
    }
}

#Preview {
    Image_Layout_AspectFit_vs_Fill()
}
