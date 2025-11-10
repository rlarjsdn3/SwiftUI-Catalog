//
//  Frame_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/6/25.
//

import SwiftUI

struct Frame_Basics: View {
    var body: some View {
        VStack {
            Ellipse()
                .fill(Color.purple)
                .frame(width: 200, height: 100)
            
            Ellipse()
                .fill(Color.blue)
                .frame(height: 100)
            
            Text("Hello, World!")
                .frame(width: 300, height: 30, alignment: .topLeading)
                .border(Color.red)
        }
    }
}

#Preview {
    Frame_Basics()
}
