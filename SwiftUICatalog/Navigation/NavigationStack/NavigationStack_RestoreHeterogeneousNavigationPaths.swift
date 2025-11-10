//
//  NavigationStack_RestoreHeterogeneousNavigationPaths.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/10/25.
//

import SwiftUI

private enum ColorAsset: CaseIterable, Identifiable, Codable {
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

private enum Recipe: Identifiable, Hashable, CaseIterable, Codable {
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

@Observable
private class NavigationManager {
    var path = NavigationPath() {
        didSet {
            save()
            print("did Set to \(path)")
        }
    }
    
    /// The URL for the JSON file that stores the navigation path.
    private static var dataURL: URL {
        .documentsDirectory.appending(path: "NavigationPath.json")
    }
    
    init() {
        do {
            let path = try load(url: NavigationManager.dataURL)
            self.path = path
        } catch {
            // Handle error.
        }
    }
    
    func save() {
        guard let codableRepresentation = path.codable else { return }
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(codableRepresentation)
            try data.write(to: NavigationManager.dataURL)
        } catch {
            // Handle error.
        }
    }
    
    /// Load the navigation path from a previously saved data.
    func load(url: URL) throws -> NavigationPath {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        let decoder = JSONDecoder()
        let path = try decoder.decode(NavigationPath.CodableRepresentation.self, from: data)
        return NavigationPath(path)
    }
}

struct NavigationStack_RestoreHeterogeneousNavigationPaths: View {
    @State private var navigationManager = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            List {
                NavigationLink("Mint", value: Color.mint)
                NavigationLink("Red", value: Color.red)
                NavigationLink("Apple Pie", value: Recipe.applePie)
                NavigationLink("Chocolate Cake", value: Recipe.chocolateCake)
            }
            .navigationDestination(for: Color.self) { color in
                ColorDetail(color: color)
            }
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetail(recipe: recipe)
            }
        }
    }
}

private struct ColorDetail: View {
    var color: Color
    
    var body: some View {
        ZStack {
            color
            NavigationLink("Push another view", value: Color.red)
                .navigationDestination(for: Color.self) { color in
                    ColorDetail(color: color)
                }
        }
    }
}

private struct RecipeDetail: View {
    var recipe: Recipe
    
    var body: some View {
        Text(recipe.description)
        NavigationLink("Push another view", value: Recipe.applePie)
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetail(recipe: recipe)
            }
    }
}

#Preview {
    NavigationStack_RestoreHeterogeneousNavigationPaths()
}
