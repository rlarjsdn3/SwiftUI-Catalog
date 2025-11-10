//
//  AlignmentGuide_Basics.swift
//  SwiftUICatalog
//
//  Created by 김건우 on 11/10/25.
//

import SwiftUI

struct AlignmentGuide_Basics: View {
    var body: some View {
        VStack {
            Text("Today's Weaher")
                .font(.title)
                .border(.gray)
            
            HStack {
                Text("🌧️")
                    // Use to calculate specific offsets to reposition views in relationship to one another.
                    // Changing the alignment of one view may have effects on surrounding views.
                    .alignmentGuide(VerticalAlignment.center) { _ in 20 }
                    .border(.red)
                
                Text("Rain & Thunderstorms")
                    .border(.red)
                
                Text("⛈️")
                    .alignmentGuide(VerticalAlignment.center) { _ in -20 }
                    .border(.red)
            }
        }
    }
}

#Preview {
    AlignmentGuide_Basics()
}
