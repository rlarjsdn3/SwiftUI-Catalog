//
//  Picker_StyleVariants.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/7/25.
//
//  iOS 26, Xcode 26 기준 예제
//  참고: https://developer.apple.com/documentation/swiftui/picker

import SwiftUI

fileprivate enum Flavor: String, CaseIterable, Identifiable {
    case chocolate, vanilla, strawberry
    var id: Self { self }
}

struct Picker_StyleVariants: View {
    @State private var selectedFlavor: Flavor = .chocolate
    
    var body: some View {
        NavigationStack {
            List {
                FlavorPicker("Automatic")
                    .pickerStyle(.automatic)
                
                FlavorPicker("Inline")
                    .pickerStyle(.inline)
                
                FlavorPicker("Menu")
                    .pickerStyle(.menu)
                
                FlavorPicker("Navigation Link")
                    .pickerStyle(.navigationLink)
                
                FlavorPicker("Pallette")
                    .pickerStyle(.palette)
                
                FlavorPicker("Segmented")
                    .pickerStyle(.segmented)
                
                FlavorPicker("Wheel")
                    .pickerStyle(.wheel)
            }
        }
    }
    
    func FlavorPicker(_ name: String) -> some View {
        Picker(name, selection: $selectedFlavor) {
            ForEach(Flavor.allCases) { flavor in
                Text(flavor.rawValue.capitalized)
            }
        }
    }
}

#Preview {
    Picker_StyleVariants()
}
