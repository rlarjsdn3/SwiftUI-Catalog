//
//  NavigationStack_ValueBasedNavigation.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/8/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/navigationstack

import SwiftUI

private enum ColorAsset: CaseIterable, Identifiable {
    case mint, red
    
    var id: Self { self }
    
    var color: Color {
        switch self {
        case .mint: Color.mint
        case .red: Color.red
        }
    }
    
    var description: String {
        switch self {
        case .mint: return "Mint"
        case .red: return "Red"
        }
    }
}

private enum Recipe: Identifiable, Hashable, CaseIterable {
    case applePie
    case chocolateCake
    
    var id: Self { self }
    
    var description: String {
        switch self {
        case .applePie:
            return "Apple Pie"
        case .chocolateCake:
            return "Chocolate Cake"
        }
    }
}

struct NavigationStack_ValueBasedNavigation: View {
    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Mint", value: ColorAsset.mint)
                NavigationLink("Red", value: ColorAsset.red)
                
                ForEach(Recipe.allCases) { recipe in
                    NavigationLink(recipe.description, value: recipe)
                }
            }
            .navigationDestination(for: ColorAsset.self) { type in
                ColorDetail(color: type.color, text: type.description)
            }
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetail(text: recipe.description)
            }
            .navigationTitle("Value-Based Navigation")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

private struct ColorDetail: View {
    var color: Color
    var text: String
    
    var body: some View {
        Text(text)
        color
    }
}

private struct RecipeDetail: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
    }
}

#Preview {
    NavigationStack_ValueBasedNavigation()
}
