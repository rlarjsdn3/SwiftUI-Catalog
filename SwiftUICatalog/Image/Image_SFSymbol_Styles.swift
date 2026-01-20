//
//  Image_SFSymbol_Styles.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/20/26.
//

import SwiftUI

struct Image_SFSymbol_Styles: View {
    var body: some View {
        Image(systemName: "cloud.sun.rain.fill")
            .symbolRenderingMode(.multicolor)
            .background(Color.gray)

        Image(systemName: "cloud.sun.rain.fill")
            .symbolRenderingMode(.palette)
            .foregroundStyle(Color.red, Color.yellow, Color.green)

        Image(systemName: "cloud.sun.rain.fill")
            .symbolRenderingMode(.hierarchical)
            .foregroundStyle(Color.cyan)

        Image(systemName: "cloud.sun.rain.fill")
            .symbolRenderingMode(.monochrome)
            .foregroundStyle(Color.green)

        Image(systemName: "cloud.sun.rain.fill")
            .symbolColorRenderingMode(.flat)
            .foregroundStyle(Color.brown)

        Image(systemName: "cloud.sun.rain.fill")
            .symbolColorRenderingMode(.gradient)
            .foregroundStyle(Color.gray)
    }
}

#Preview {
    Image_SFSymbol_Styles()
}
