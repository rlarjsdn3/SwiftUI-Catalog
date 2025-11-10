//
//  NavigationStack_RestoreHomogeneousNavigationPaths.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/8/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/navigationstack

import SwiftUI

private enum Recipe: Identifiable, Hashable, Codable {
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
    var path: [Recipe] = [] {
        didSet {
            save()
        }
    }
    
    // The URL for the JSON file that stores the navigation path.
    private static var dataURL: URL {
        .documentsDirectory.appending(path: "NavigationPath.json")
    }
    
    init() {
        do {
            // Load the data model from the 'Navigation Path' data found in the Documents directory.
            let path = try load(url: NavigationManager.dataURL)
            self.path = path
        } catch {
            // Handle error.
        }
    }
    
    func save() {
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(path)
            try data.write(to: NavigationManager.dataURL)
        } catch {
            // Handle error.
        }
    }
    
    // Load the navigation path from a previously saved state.
    func load(url: URL) throws -> [Recipe] {
        let data = try Data(contentsOf: NavigationManager.dataURL)
        let decoder = JSONDecoder()
        return try decoder.decode([Recipe].self, from: data)
    }
}

struct NavigationStack_RestoreHomogeneousNavigationPaths: View {
    @State private var navigationManager = NavigationManager()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            List {
                NavigationLink("Apple Pie", value: Recipe.applePie)
                NavigationLink("Chocolate Cake", value: Recipe.chocolateCake)
            }
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetail(text: recipe.description)
            }
            
        }
        .onChange(of: scenePhase) { _, newValue in
            if newValue == .background {
                navigationManager.save()
            }
        }
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
    NavigationStack_RestoreHomogeneousNavigationPaths()
}
