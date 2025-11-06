//
//  containerRelativeFrame_InGrid.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/SwiftUI/View/containerRelativeFrame(_:alignment:)

import SwiftUI

struct ContainerRelativeFrame_InGrid: View {
    
    var products: [String] = [
        "iPhone 15 Pro",
        "iPhone SE (3rd generation)",
        "iPad Pro (M4)",
        "iPad Air (M2)",
        "MacBook Air (M3)",
        "MacBook Pro (M3 Pro)",
        "iMac (M3)",
        "Mac mini (M2)",
        "Apple Watch Ultra 2",
        "AirPods Pro (2nd generation)"
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: 100))
            ]) {
                ForEach(products, id: \.self) { product in
                    Text(product)
                        .padding()
                        // Each text takes appropriate width within its grid cell
                        .containerRelativeFrame(.horizontal) { width, _ in
                            width * 0.95
                        }
                        .aspectRatio(1, contentMode: .fit)
                        .background(.orange, in: RoundedRectangle(cornerRadius: 10))
                }
            }
        }
    }
}

#Preview {
    ContainerRelativeFrame_InGrid()
}
