//
//  ProgressView_DateRelativeProgress.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 12/15/25.
//

import SwiftUI

struct ProgressView_DateRelativeProgress: View {
    @State private var workoutDateRange = Date()...Date().addingTimeInterval(300)
    
    var body: some View {
        ProgressView(timerInterval: workoutDateRange) {
            Text("Workout!")
        }
    }
}

#Preview {
    ProgressView_DateRelativeProgress()
}
