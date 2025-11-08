//
//  NavigationStack_PathNavigation.swift
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

@Observable
private class NavigationManager {
    var path: [ColorAsset] = [] {
        willSet {
            print("Will set to \(newValue)")
        }
        
        didSet {
            print("Did set to \(path)")
        }
    }
    
    func append(_ asset: ColorAsset) {
        path.append(asset)
    }
    
    @discardableResult
    func popLast() -> ColorAsset? {
        path.popLast()
    }
}

struct NavigationStack_PathNavigation: View {
    @State private var navigationManager = NavigationManager()
    
    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            List {
                NavigationLink("Mint", value: ColorAsset.mint)
                NavigationLink("Red", value: ColorAsset.red)
                
                Button("Mint (programatically push)") {
                    navigationManager.append(ColorAsset.mint)
                }
            }
            .navigationDestination(for: ColorAsset.self) { asset in
                ColorDetail(navigationManager: navigationManager, color: asset.color, text: asset.description)
            }
        }
    }
}

private struct ColorDetail: View {
    var navigationManager: NavigationManager
    
    var color: Color
    var text: String
    
    var body: some View {
        Text(text)
        color
        Button("PopLast") {
            navigationManager.popLast()
        }
    }
}

#Preview {
    NavigationStack_PathNavigation()
}
