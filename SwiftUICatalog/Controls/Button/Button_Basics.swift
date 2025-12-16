//
//  Button_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/15/25.
//

import SwiftUI

struct Button_Basics: View {
    var body: some View {
        Button(action: signIn) {
            Text("Sign In")
        }
    }
    
    func signIn() {
        print("tappped Sign In")
    }
}

#Preview {
    Button_Basics()
}
