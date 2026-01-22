//
//  ScrollView_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 1/22/26.
//

import SwiftUI

struct ScrollView_Basics: View {

    var body: some View {
        VStack(spacing: 24) {
            title("Vertical ScrollView")
            verticalScrollExample

            Divider()

            title("Horizontal ScrollView")
            horizontalScrollExample

            Divider()

            title("LazyVStack vs VStack")
            lazyComparisonExample
        }
    }
}

// MARK: - Subviews
extension ScrollView_Basics {

    private var verticalScrollExample: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(0..<20, id: \.self) { index in
                    cell(title: "Item \(index)")
                }
            }
        }
        .frame(height: 200)
        .border(.gray)
    }

    private var horizontalScrollExample: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 12) {
                ForEach(0..<15, id: \.self) { index in
                    cell(title: "Card \(index)")
                        .frame(width: 120)
                }
            }
        }
        .frame(height: 100)
        .border(.gray)
    }

    private var lazyComparisonExample: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(0..<100, id: \.self) { index in
                    cell(title: "Lazy Item \(index)")
                }
            }
        }
        .frame(height: 200)
        .border(.green)
    }
}

extension ScrollView_Basics {

    private func cell(title: String) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color.blue.opacity(0.15))
            .frame(height: 44)
            .overlay {
                Text(title)
                    .font(.system(size: 14, weight: .medium))
            }
    }

    private func title(_ text: String) -> some View {
        Text(text)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// MARK: - Preview
#Preview {
    ScrollView_Basics()
}
