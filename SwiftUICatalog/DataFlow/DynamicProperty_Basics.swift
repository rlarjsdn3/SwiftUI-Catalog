//
//  DynamicProperty_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/16/25.
//

import SwiftUI

@propertyWrapper
private struct Counter: DynamicProperty {
    @State private var value: Int
    
    init(wrappedValue value: Int = 0) {
        self.value = value
    }
    
    var wrappedValue: Int {
        get { value }
        nonmutating set { value = newValue }
    }
    
    func update() {
        // SwiftUI calls this function before rendering a view’s body to ensure the view has the most recent value.
    }
}

struct DynamicProperty_Basics: View {
    @Counter private var value: Int
    
    var body: some View {
        VStack {
            Text("\(value)")
                .font(.title3)
            
            Button("Increase") {
                value += 1
            }
        }
    }
}

#Preview {
    DynamicProperty_Basics()
}
