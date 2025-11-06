//
//  containerRelativeFrame_InScrollView.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/SwiftUI/View/containerRelativeFrame(_:alignment:)

import SwiftUI

struct ContainerRelativeFrame_InScrollView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10.0) {
                ForEach(0..<10) { item in
                    Rectangle()
                        .fill(.purple)
                        .aspectRatio(3.0 / 2.0, contentMode: .fit)
                        // count refers to the total number of rows or columns that the length of the container size in a particular axis should be divided into.
                        // span refers to the number of rows or columns that the modified view should actually occupy.
                        .containerRelativeFrame(.horizontal, count: 4, span: 3, spacing: 10.0)
                        // let availableWidth = (containerWidth - (spacing * (count - 1)))
                        // let columnWidth = (availableWidth / count)
                        // let itemWidth = (columnWidth * span) + ((span - 1) * spacing)
                }
            }
        }
        .safeAreaPadding(.horizontal, 20.0)
    }
    
    func color(_ n: Int) -> Color {
        n.isMultiple(of: 2) ? Color.orange : Color.brown
    }
}

#Preview {
    ContainerRelativeFrame_InScrollView()
}
