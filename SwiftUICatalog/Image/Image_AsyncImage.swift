//
//  Image_AsyncImage.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/20/26.
//

import SwiftUI

struct Image_AsyncImage: View {

    var body: some View {
        AsyncImage(url: URL(string: "https://placehold.co/600x400/png"))
            .frame(width: 200, height: 200)

        AsyncImage(
            url: URL(string: "https://placehold.co/600x400/png"),
            scale: 1.25
        ) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }

        AsyncImage(url: URL(string: "https://placehold.co/600x400/png")) { phase in
            if let image = phase.image {
                image.resizable() // Displays the loaded image.
            } else if phase.error != nil {
                Color.red // Indicates an error.
            } else {
                Color.blue // Acts as a placeholder
            }
        }
        .frame(width: 200, height: 200)

    }
}

#Preview {
    Image_AsyncImage()
}
