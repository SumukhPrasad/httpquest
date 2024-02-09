//
//  ConclusionView.swift
//  
//
//  Created by Sumukh Prasad on 07/02/24.
//

import SwiftUI

struct ConclusionView: View {
    @Binding var tabSelection: Int
    
    var body: some View {
        Text("Hello, World! cv")
    }
}

#Preview {
    ConclusionView(tabSelection: .constant(3))
}
