//
//  ShareLink_WithTransferable.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/16/25.
//

import SwiftUI

private struct Photo: Transferable {
    var image: Image
    var caption: String
    
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
}


struct ShareLink_WithTransferable: View {
    private let photo = Photo(image: Image(.swiftui), caption: "Hello, SwiftUI!")
    
    var body: some View {
        photo.image
            .toolbar {
                ShareLink(
                    item: photo,
                    preview: SharePreview(
                        photo.caption,
                        image: photo.image
                    )
                )
            }
    }
}

#Preview {
    NavigationStack {
        ShareLink_WithTransferable()
    }
}
